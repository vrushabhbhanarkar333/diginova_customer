import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:diginova/global/constant.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  late ScrollController _scrollController;
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: mediaQueryH(context) * 0.2,
            child: Card(
              elevation: 0.5,
              margin: EdgeInsets.zero,
              surfaceTintColor: Colors.transparent,
              shape: const RoundedRectangleBorder(),
              color: WHITE_SHADE_CLR,
              child: Padding(
                padding: EdgeInsets.only(
                    left: PADDING_MD, top: mediaQueryH(context) * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                        color: BLACK_CLR,
                      ),
                    ),
                    Center(
                      child: Text(
                        'Terms of Use',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: FONT_MD,
                          color: BLACK_CLR_SHADE,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Last update on 1/12/2021',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w600,
                          fontSize: FONT_16,
                          color: const Color(0XFF7C7C7C),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: RawScrollbar(
              trackBorderColor: WHITE_SHADE_CLR,
              trackColor: WHITE_SHADE_CLR,
              radius: const Radius.circular(20),
              interactive: true,
              thumbVisibility: true,
              trackVisibility: true,
              thickness: 9.2,
              thumbColor: BLUE_N_SHADE_CLR,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Image.asset(
                      BACKGROUNDIMAGE,
                      fit: BoxFit.fill, // Fit the image to the screen size
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: SPACING_MD),
                      itemCount: termAndConditionList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: SPACING_LG,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: SPACING_LG),
                                Text(
                                  "${index + 1}. ${termAndConditionList[index]['title']} ${index + 1}",
                                  style: TEXT_STYLE_FONT_20_BOLD,
                                ),
                                const SizedBox(height: SPACING_SM),
                                Text(
                                  termAndConditionList[index]['description'],
                                  style: FONT_16_poppins_NORMAL_TXT_STYLE,
                                ),
                                if (index == termAndConditionList.length - 1)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: PADDING_LG,
                                      bottom: 20,
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                        height: 47,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(
                                              () {
                                                isCompleted = true;
                                              },
                                            );
                                          },
                                          style: ButtonStyle(
                                            elevation:
                                                const MaterialStatePropertyAll(
                                                    0),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                              isCompleted
                                                  ? WHITE_CLR
                                                  : BLUE_N_SHADE_CLR,
                                            ),
                                            shape:
                                                const MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadiusDirectional.all(
                                                  Radius.circular(9.77),
                                                ),
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              isCompleted
                                                  ? const Icon(
                                                      Icons.done_all,
                                                      color: DEFAULT_CLR,
                                                    )
                                                  : const SizedBox(),
                                              const SizedBox(width: SPACING_SM),
                                              Text(
                                                isCompleted
                                                    ? "Complete"
                                                    : "Accept & Continue",
                                                style: GoogleFonts.lato(
                                                  fontSize: FONT_M,
                                                  fontWeight: FontWeight.bold,
                                                  color: isCompleted
                                                      ? DEFAULT_CLR
                                                      : WHITE_CLR,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (index == termAndConditionList.length - 1)
                                  const SizedBox(
                                    height: SPACING_LG,
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> termAndConditionList = [
  {
    'title': "Clause",
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem.'
  },
  {
    'title': "Clause",
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem. \n\n Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem. \n\n Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem.'
  },
  {
    'title': "Clause",
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem.\n\n Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem.'
  },
];
