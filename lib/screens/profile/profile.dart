import 'package:diginova/global/constant.dart';
import 'package:diginova/global/utility.dart';
// import 'package:diginova/model/user_data_manager.dart';
import 'package:diginova/screens/account_info/account_info.dart';
// import 'package:diginova/screens/authentication/auth_number_controller.dart';
import 'package:diginova/screens/authentication/login_page.dart';
import 'package:diginova/screens/histroy/history.dart';
import 'package:diginova/screens/orders/orders.dart';
import 'package:diginova/screens/privacy_policy/privacy_policy.dart';
import 'package:diginova/screens/project/project.dart';
import 'package:diginova/screens/update_screen/update_1.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../provider/my_details.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "";

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final Map<String, String> userInfo = await UserDataManager.getLoginInfo();
    // print(userInfo);
    setState(() {
      userName = userInfo["name"] ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final infoProvider = Provider.of<MyDetailsProvider>(context, listen: false);
    Map<String, dynamic>? mydata = infoProvider.myData;
    String? profileImageUrl = mydata?['profileImage'];
    // log('profile: $profileImageUrl');

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
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            BACKGROUNDIMAGE,
            fit: BoxFit.cover,
          ),
          AppBar(
            // toolbarHeight: mediaQueryH(context) * 0.1,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 18,
              ),
            ),
            title: Text(
              'Profile',
              style: TEXT_STYLE_M
                ..copyWith(
                  color: BLACK_CLR,
                ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: mediaQueryH(context) * 0.12,
                left: 30,
                bottom: 16,
                right: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 70,
                      // backgroundColor: AVATAR_BG_CLR,
                      backgroundImage: backgroundImage.image,
                    ),
                  ),
                  const SizedBox(
                    height: SPACING_SM,
                  ),
                  Center(
                    child: Text(
                      // name,
                      userName,
                      style: TEXT_STYLE_M_SEMI_BOLD,
                    ),
                  ),
                  const SizedBox(
                    height: SPACING_MD,
                  ),
                  const SizedBox(height: SPACING_LG),
                  ProfileWidgetList(
                    onTap: () {
                      Get.to(() => const AccountInfo());
                    },
                    title: 'Account Information',
                    pageName: const AccountInfo(),
                  ),
                  const SizedBox(height: SPACING_MD),
                  const Divider(color: DIVIDER_CLR),
                  const SizedBox(height: SPACING_MD),
                  ProfileWidgetList(
                    onTap: () {
                      Get.to(() => const MyOrders());
                    },
                    title: 'My Order',
                    pageName: const MyOrders(),
                  ),
                  const SizedBox(height: SPACING_LG),
                  const SizedBox(height: SPACING_XS),
                  ProfileWidgetList(
                    onTap: () {
                      Get.to(() => const ProjectScreen());
                    },
                    title: 'My Assets',
                    pageName: const ProjectScreen(),
                  ),
                  const SizedBox(height: SPACING_LG),
                  const SizedBox(height: SPACING_XS),
                  ProfileWidgetList(
                    onTap: () {
                      Get.to(() => const UpdateScreen_1());
                    },
                    title: 'Site Readiness',
                    pageName: const UpdateScreen_1(),
                  ),
                  const SizedBox(height: SPACING_MD),
                  const Divider(color: DIVIDER_CLR),
                  const SizedBox(
                    height: SPACING_MD,
                  ),
                  ProfileWidgetList(
                    onTap: () {
                      Get.to(() => const HistoryScreen());
                    },
                    title: 'Retrive QR Code',
                    pageName: const HistoryScreen(),
                  ),
                  const SizedBox(height: SPACING_LG),
                  const SizedBox(height: SPACING_XS),
                  ProfileWidgetList(
                    onTap: () {
                      Get.to(() => const PrivacyPolicy());
                    },
                    title: 'Privacy & Security',
                    pageName: const PrivacyPolicy(),
                  ),
                  const SizedBox(height: SPACING_MD),
                  const Divider(color: DIVIDER_CLR),
                  const SizedBox(
                    height: SPACING_MD,
                  ),
                  ProfileWidgetList(
                    title: 'Sign Out',
                    onTap: () {
                      setState(() {
                        _signOut(context);
                      });
                    },
                    pageName: LoginPage(),
                  ),
                  const SizedBox(
                    height: SPACING_MD,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _signOut(BuildContext context) async {
    await UserDataManager.signOut();
    Navigator.pushAndRemoveUntil(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }
}

class ProfileWidgetList extends StatelessWidget {
  final String title;
  final Widget pageName;
  final VoidCallback onTap;

  const ProfileWidgetList({
    super.key,
    required this.title,
    required this.pageName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => pageName,
      //   ),
      // );
      // },
      onTap: onTap,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: FONT_14_MEDIUM_TXT_STYLE,
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 13,
              color: GREY_BLUR_SHADE_CLR,
            ),
          ],
        ),
      ),
    );
  }
}
