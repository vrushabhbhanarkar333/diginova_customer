import 'package:diginova/controller/social_media_controller.dart';
import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  final SocialMediaController _socialMediaController = SocialMediaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            BACKGROUNDIMAGE,
            fit: BoxFit.cover,
          ),
          AppBarNova(
            title: 'Add Social Media',
            fontWeight: FontWeight.w600,
            fontSize: FONT_20,
            color: BLACK_CLR_SHADE,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              top: mediaQueryH(context) * 0.12,
              left: 20,
              right: 20,
            ),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Instagram',
                    style: FONT_14_REGULAR_TXT_STYLE,
                  ),
                  const SizedBox(height: SPACING_SM),
                  TextFormField(
                    controller: _socialMediaController.instaController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: WHITE_SHADE_CLR,
                      hintText: 'https://',
                      hintStyle: FONT_14_REGULAR_TEXTFILELD_TXT_STYLE,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(PADDING_SM),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            PADDING_SM,
                          ),
                        ),
                      ),
                      prefixIcon: const Icon(
                        FontAwesomeIcons.instagram,
                        size: SIZE_S,
                        color: TXT_FIELD_HINT_CLR,
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_SM),
                  Text(
                    'Facebook',
                    style: FONT_14_REGULAR_TXT_STYLE,
                  ),
                  const SizedBox(height: SPACING_SM),
                  TextFormField(
                    controller: _socialMediaController.fbController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: WHITE_SHADE_CLR,
                      hintText: 'https://',
                      hintStyle: FONT_14_REGULAR_TEXTFILELD_TXT_STYLE,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(PADDING_SM),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            PADDING_SM,
                          ),
                        ),
                      ),
                      prefixIcon: const Icon(
                        FontAwesomeIcons.facebookF,
                        size: SIZE_S,
                        color: TXT_FIELD_HINT_CLR,
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_SM),
                  Text(
                    'Twitter',
                    style: FONT_14_REGULAR_TXT_STYLE,
                  ),
                  const SizedBox(height: SPACING_SM),
                  TextFormField(
                    controller: _socialMediaController.twitterController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: WHITE_SHADE_CLR,
                      hintText: 'https://',
                      hintStyle: FONT_14_REGULAR_TEXTFILELD_TXT_STYLE,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(PADDING_SM),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            PADDING_SM,
                          ),
                        ),
                      ),
                      prefixIcon: const Icon(
                        FontAwesomeIcons.twitter,
                        size: SIZE_S,
                        color: TXT_FIELD_HINT_CLR,
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_SM),
                  Text(
                    'Youtube',
                    style: FONT_14_REGULAR_TXT_STYLE,
                  ),
                  const SizedBox(height: SPACING_SM),
                  TextFormField(
                    controller: _socialMediaController.ytController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: WHITE_SHADE_CLR,
                      hintText: 'https://',
                      hintStyle: FONT_14_REGULAR_TEXTFILELD_TXT_STYLE,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(PADDING_SM),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            PADDING_SM,
                          ),
                        ),
                      ),
                      prefixIcon: const Icon(
                        FontAwesomeIcons.youtube,
                        size: SIZE_S,
                        color: TXT_FIELD_HINT_CLR,
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_XL),
                  // const SizedBox(height: SPACING_LG),
                  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          BTN_BLUE_CLR,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                          (route) => true,
                        );
                      },
                      child: Text(
                        "Completed",
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.bold,
                          color: WHITE_SHADE_CLR,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
