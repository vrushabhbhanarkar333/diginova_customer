// ignore_for_file: library_private_types_in_public_api

import 'package:diginova/controller/help_desk_controller/knowledge_base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/help_desk/help.dart';

class KnowledgeBase extends StatefulWidget {
  const KnowledgeBase({super.key});

  @override
  _KnowledgeBaseState createState() => _KnowledgeBaseState();
}

class _KnowledgeBaseState extends State<KnowledgeBase> {
  final KnowledgeBaseController _controller =
      Get.put(KnowledgeBaseController());

  // @override
  // void dispose() {
  //   _controller.dispose(); // Dispose the controller when the widget is disposed
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();
    // Call the method to show the bottom sheet automatically
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _showBottomSheet(context);
    // });
  }

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
          // AppBarNova(
          //   onPressed: () => Navigator.pop(context),
          //   title: 'FAQ\'S',
          //   fontWeight: FontWeight.w700,
          //   fontSize: FONT_16,
          //   color: BLACK_SHADE,
          // ),
          AppBar(
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
              'FAQ\'s',
              style: GoogleFonts.poppins(
                fontSize: FONT_20,
                fontWeight: FontWeight.w500,
                color: BLACK_CLR,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  _showBottomSheet(context);

                  // Handle question mark icon button tap
                },
                icon: const Icon(
                  Icons.help_outline,
                  size: 24,
                  color: BLACK_CLR, // Customize the icon color
                ),
              ),
            ],
          ),
          Positioned(
            top: mediaQueryH(context) * 0.12,
            left: 15,
            right: 15,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Card(
                          elevation: 2,
                          child: TextFormField(
                            controller: _controller.textEditingController,
                            onChanged: _controller.setSearchQuery,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              filled: true,
                              fillColor: WHITE_CLR,
                              hintText: 'Search Help',
                              hintStyle: GoogleFonts.poppins(
                                fontSize: FONT_XSS,
                                fontWeight: FontWeight.w400,
                                color: const Color(0XFF858585),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              disabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                size: SIZE_IC,
                                color: Color(0XFF272727),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: SPACING_M),
                  SizedBox(
                    // Wrap Expanded with Container
                    height: MediaQuery.of(context).size.height *
                        0.7, // Adjust the height as needed
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: faqItems.length,
                      itemBuilder: (context, index) {
                        final faqItem = faqItems[index];
                        if (_controller.searchQuery.isNotEmpty &&
                            !faqItem.title.toLowerCase().contains(
                                _controller.searchQuery.toLowerCase())) {
                          return const SizedBox.shrink();
                        }
                        return FAQButton(
                          title: faqItem.title,
                          description: faqItem.description,
                        );
                      },
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

Future<dynamic> _showBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    barrierColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        color: Colors.white,
        height: 125,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Still stuck? Help us a mail away',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: FONT_16,
                color: BLACK_CLR,
              ),
            ),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpDeskScreen(
                        isRaiseTicketSelected: false,
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(BTN_BLUE_CLR),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: Text(
                  "Send a message",
                  style: GoogleFonts.poppins(
                    fontSize: FONT_M,
                    fontWeight: FontWeight.bold,
                    color: WHITE_CLR,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class FAQButton extends StatefulWidget {
  final String title;
  final String description;

  const FAQButton({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<FAQButton> createState() => _FAQButtonState();
}

class _FAQButtonState extends State<FAQButton> {
  bool _showDescription = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shadowColor: const Color(0XFFE9E9E9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              color: Color(0XFFE9E9E9),
            ),
          ),
          surfaceTintColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(
                top: PADDING_XS, bottom: PADDING_XS, left: PADDING_XS),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showDescription = !_showDescription;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        maxLines: 2,
                        text: TextSpan(
                          text: widget.title,
                          // spellOut: false,
                          style: GoogleFonts.poppins(
                            fontSize: FONT_14,
                            fontWeight: FontWeight.w600,
                            color: _showDescription
                                ? BTN_BLUE_CLR
                                : const Color(0XFF686868),
                          ),
                        ),
                      ),
                      Icon(
                        _showDescription
                            ? Icons.keyboard_arrow_up_outlined
                            : Icons.keyboard_arrow_down_outlined,
                        size: 30,
                        color: _showDescription
                            ? BTN_BLUE_CLR
                            : const Color(0XFF686868),
                      ),
                    ],
                  ),
                ),
                if (_showDescription)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: SPACING_XS),
                      const Divider(color: DIVIDER_CLR),
                      const SizedBox(height: SPACING_XS),
                      Text(
                        widget.description,
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0XFF858585),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: SPACING_SM),
      ],
    );
  }
}

class FAQItem {
  final String title;
  final String description;

  FAQItem({
    required this.title,
    required this.description,
  });
}

List<FAQItem> faqItems = [
  FAQItem(
    title: 'What is the NovaSmart App?',
    description:
        'The NovaSmart app is a mobile application designed specifically for managing electrical control panels. It provides users with a range of tools and features to streamline the control panel assembly, monitoring, and management process.',
  ),
  FAQItem(
    title: 'How do I download NovaSmart?',
    description:
        'You can download NovaSmart from the App Store for iOS devices or the Google Play Store for Android devices. Simply search for "NovaSmart" and follow the instructions to install it on your device.',
  ),
  FAQItem(
    title: 'Is my data secure in NovaSmart?',
    description:
        'Yes, NovaSmart prioritizes the security of user data and employs robust security measures to protect it.',
  ),
  FAQItem(
    title: 'Can I provide feedback for NovaSmart?',
    description:
        'Yes, NovaSmart welcomes feedback to improve the app. You can submit feedback through the app or contact support directly.',
  ),
];
