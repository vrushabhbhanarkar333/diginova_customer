import 'package:diginova/controller/home_controllerr.dart';
import 'package:diginova/controller/project_controller/project_controller.dart';
import 'package:diginova/global/utility.dart';
import 'package:diginova/provider/my_details.dart';
import 'package:diginova/screens/authentication/login_page.dart';
import 'package:diginova/screens/files/file.dart';
import 'package:diginova/screens/categories/categories.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/help_desk/help.dart';
import 'package:diginova/screens/home/asset_custom_btn.dart';
import 'package:diginova/screens/home/categories_custom_btn.dart';
import 'package:diginova/screens/notification/notification.dart';
import 'package:diginova/screens/profile/profile.dart';
import 'package:diginova/screens/project/monitor.dart';
import 'package:diginova/screens/project/perforenmence/performence.dart';
import 'package:diginova/screens/project/project.dart';
import 'package:diginova/screens/project/recent_update.dart';
import 'package:diginova/screens/qr_scan/qr_scan.dart';
import 'package:diginova/screens/search/search.dart';
import 'package:diginova/utils/bottom_nav_pages.dart/help.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Get.put(HomeController());
  String? _selectedProjectId;
  String? _customerId;
  Future<void> _loadSelectedProjectId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('Project Id is : $_selectedProjectId');
    // setState(() {
    // _selectedProjectId = prefs.getString('selectedItem');
    _selectedProjectId = 'AAAA';
    _customerId = prefs.getString('customerId');
    // });
  }

  late String customerId = ''; // Variable to hold the customer ID
  DateTime? currentBackPressTime; // Variable to track back button presses
  String userName = "";
  String email = "";
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    // Fetch and set the customer ID when the widget initializes
    fetchCustomerId();
    _loadUsername();
    _fetchMyDetails();
    _loadSelectedProjectId();
    printFCMToken();
  }

  void printFCMToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    print('FCM Token: $token');
  }

  // Method to fetch the customer ID from Firebase Authentication
  void fetchCustomerId() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      // Assuming the customer ID is stored in the user's profile under 'customerId'
      setState(() {
        customerId = currentUser
            .uid; // Accessing user's UID assuming it's the customerId
      });
    } else {
      // Handle the case when currentUser is null
      print('User is not logged in');
      // You might want to set customerId to a default value or perform other actions
    }
  }

  Future<void> _loadUsername() async {
    final Map<String, String> userInfo = await UserDataManager.getLoginInfo();
    print(userInfo);
    setState(() {
      userName = userInfo["name"] ?? "";
      _customerId = userInfo['customerId'];
    });
  }

  void showSessionExpiredDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Session Expired",
            style: TEXT_STYLE_M_BOLD,
          ),
          content: Text(
            "Your session has expired. Please log in again.",
            style: TEXT_STYLE,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _signOut(context);
              },
              child: Text(
                "OK",
                style: TEXT_STYLE_M_BOLD,
              ),
            ),
          ],
        );
      },
    );
  }

  void _signOut(BuildContext context) async {
    // await UserDataManager.signOut();
    Navigator.pushAndRemoveUntil(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }

  Future<void> _fetchMyDetails() async {
    if (!mounted) {
      return; // Check if the widget is still mounted
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final Map<String, String> userData = await UserDataManager.getLoginInfo();
      String jwtToken = userData['jwtToken'] ?? '';
      String uid = userData['uid'] ?? '';

      final String apiUrl = '${BASE_URL}user/$uid';

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $jwtToken',
        },
      );

      if (mounted) {
        // Check again if the widget is still mounted before updating the UI
        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          log('about meh: $data');
          Provider.of<MyDetailsProvider>(context, listen: false)
              .setMyData(data); // Assuming you have a method to update data
        } else if (response.statusCode == 400 &&
            response.body.contains('jwt expired')) {
          showSessionExpiredDialog(context);
          // Implement token refresh or logout logic here if needed
        } else {
          log('Failed to fetch my  details: ${response.statusCode}');
          log('Failed to fetch my details: ${json.decode(response.body)}');
        }
      }
    } catch (error) {
      if (mounted) {
        // Check if still mounted before updating UI
        log('Error fetching my details: $error');
      }
    }

    if (mounted) {
      // Check if still mounted before updating UI
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final infoProvider = Provider.of<MyDetailsProvider>(context, listen: false);
    Map<String, dynamic>? mydata = infoProvider.myData;
    String? profileImageUrl = mydata?['profileImage'];
    log('profile: $profileImageUrl');

    DecorationImage backgroundImage =
        (profileImageUrl != null && profileImageUrl.isNotEmpty)
            ? DecorationImage(
                image: NetworkImage('$IMAGE_BASE_URL$profileImageUrl'),
                fit: BoxFit.cover,
              )
            : const DecorationImage(
                image: AssetImage('assets/images/Avatar.png'),
                fit: BoxFit.cover,
              );
    // ignore: deprecated_member_use
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            BACKGROUNDIMAGE,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 18,
              right: 18,
            ),
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfilePage(),
                                ),
                              );
                            },
                            // child: Image.network('$profileImageUrl'),
                            child: CircleAvatar(
                              // backgroundColor: AVATAR_BG_CLR,
                              backgroundImage: backgroundImage.image,
                            ),
                            // CircleAvatar(
                            //   backgroundColor: AVATAR_BG_CLR,
                            //   backgroundImage: AssetImage(
                            //     'assets/images/Avatar.png',
                            //   ),
                            // ),
                          ),
                          title: Text(
                            maxLines: 1,
                            // customerId,
                            _customerId ?? userName,
                            // 'DG76876',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_SM,
                              fontWeight: FontWeight.bold,
                              color: BLACK_CLR,
                            ),
                          ),
                          subtitle: Text(
                            _selectedProjectId!,
                            // 'Banglore, India',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_XSS,
                              fontWeight: FontWeight.w400,
                              color: const Color(0XFF363942),
                            ),
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              Get.to(
                                const NotificationPage(),
                              );
                            },
                            child: badges.Badge(
                              badgeContent: Text(
                                '2',
                                style: GoogleFonts.poppins(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: WHITE_CLR,
                                ),
                              ),
                              position:
                                  badges.BadgePosition.topStart(start: 10),
                              child: Image.asset(
                                'assets/icons/homeScreenIcons/ic_notification.png',
                                height: 24,
                                width: 24,
                                color: BLACK_CLR,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: SPACING_LG),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Search(),
                                    ),
                                  );
                                },
                                child: TextFormField(
                                  enabled: false,
                                  cursorColor: TEXTFIELD_HINT_TXT_CLR,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    filled: true,
                                    fillColor: WHITE_CLR,
                                    hintText: 'Search...',
                                    hintStyle: TEXTFIELD_HINT_TXT_STYLE,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    disabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      size: 18,
                                      color: TEXTFIELD_HINT_TXT_CLR,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => const QrScanner(),
                                );
                              },
                              child: Container(
                                height: 44,
                                width: 44,
                                padding: const EdgeInsets.all(PADDING_XXS),
                                decoration: BoxDecoration(
                                  color: DEFAULT_CLR,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Image.asset(
                                  'assets/icons/homeScreenIcons/Filter.png',
                                  // height: 30,
                                  // width: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: SPACING_LG),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Categories',
                              style: FONT_16_TXT_STYLE,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Categories(),
                                  ),
                                );
                              },
                              child: Text(
                                'See all',
                                style: FONT_14_TXT_STYLE.copyWith(
                                    color: DEFAULT_CLR),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: SPACING_M),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CategoriesBtn(
                              // height: 86,
                              // width: 84,
                              text: 'Project',
                              image: PROJECTIMAGE,
                              backgroundClr: CATEGORIES_BG_CLR,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ProjectScreen(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: SPACING_XS),
                            CategoriesBtn(
                              // height: 86,
                              // width: 84,
                              text: 'Files',
                              image: FILESIMAGE,
                              backgroundClr: DEFAULT_CLR,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FilePage(
                                        // saveProjectFile: '',
                                        ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: SPACING_XS),
                            CategoriesBtn(
                              // height: 86,
                              // width: 84,
                              text: 'Performence',
                              image: PERFORMANCEIMAGE,
                              backgroundClr: Colors.green,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PerformanceScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: SPACING_M),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CategoriesBtn(
                              // height: 86,
                              // width: 84,
                              text: 'Update',
                              image: UPDATEIMAGE,
                              backgroundClr: Colors.red,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RecentUpdate(),
                                  ),
                                );
                              },
                            ),
                            CategoriesBtn(
                              // height: 86,
                              // width: 84,
                              text: 'Moniter',
                              image: MONITERIMAGE,
                              backgroundClr: Colors.grey,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Monitor(),
                                  ),
                                );
                              },
                            ),
                            CategoriesBtn(
                              // height: 86,
                              // width: 84,
                              text: 'Help',
                              image: RAISE_TICKETIMAGE,
                              backgroundClr: Colors.blueGrey,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const
                                        // HelpDeskScreen(
                                        //   isRaiseTicketSelected: true,
                                        // ),
                                        HelpDeskScreenBottom(
                                      isRaiseTicketSelected: false,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: SPACING_M),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Assets Status',
                              style: FONT_16_TXT_STYLE,
                            ),
                            // TextButton(
                            //   style: const ButtonStyle(
                            //     padding: MaterialStatePropertyAll(
                            //       EdgeInsets.zero,
                            //     ),
                            //   ),
                            //   onPressed: () {},
                            //   child: Text(
                            //     'See all',
                            //     style:
                            //         FONT_14_TXT_STYLE.copyWith(color: DEFAULT_CLR),
                            //   ),
                            // )
                          ],
                        ),
                        const SizedBox(height: SPACING_SM),
                        const AssetsStatusList(
                          image:
                              'assets/icons/homeScreenIcons/Group 2085662603 (1).jpg',
                          title: 'Project',
                          indicatorPercentage: 32,
                          totalIndicatorPercentage: 50,
                        ),
                        const AssetsStatusList(
                          image:
                              'assets/icons/homeScreenIcons/Group 2085662601.jpg',
                          title: 'Assets',
                          indicatorPercentage: 32,
                          totalIndicatorPercentage: 50,
                        ),
                        const AssetsStatusList(
                          image:
                              'assets/icons/homeScreenIcons/Group 2085662602 (1).jpg',
                          title: 'Reports',
                          indicatorPercentage: 32,
                          totalIndicatorPercentage: 50,
                        ),
                      ], //
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
