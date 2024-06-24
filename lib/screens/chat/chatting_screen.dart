import 'package:diginova/controller/help_desk_controller/chatting_controller.dart';
import 'package:diginova/global/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen({
    super.key,
  });

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  final ChattingController _chattingController = Get.put(ChattingController());
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
          AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 18,
              ),
            ),
            title: Text(
              'Bhaskar',
              style: GoogleFonts.poppins(
                fontSize: FONT_14,
                fontWeight: FontWeight.bold,
                color: BLACK_CLR,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: PADDING_MD,
                ),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color(0XFFEAF2FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/Avatar1.png',
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 120,
              left: PADDING_MD,
              right: PADDING_MD,
            ),
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: WHITE_CLR,
                        borderRadius: BorderRadius.circular(
                          PADDING_MD,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bhaskar',
                              style: GoogleFonts.inter(
                                fontSize: FONT_XSS,
                                fontWeight: FontWeight.bold,
                                color: WARM_GRAY_CLR,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Hey Ram!',
                              style: GoogleFonts.inter(
                                fontSize: FONT_14,
                                fontWeight: FontWeight.w400,
                                color: BLACK_SHADE,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: SPACING_SM,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: WHITE_CLR,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(PADDING_MD),
                          topRight: Radius.circular(PADDING_MD),
                          bottomRight: Radius.circular(PADDING_MD),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'How\'s your project going?',
                          style: GoogleFonts.inter(
                            fontSize: FONT_14,
                            fontWeight: FontWeight.w400,
                            color: BLACK_SHADE,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: SELECTED_ICON_CLR,
                          borderRadius: BorderRadius.circular(
                            PADDING_MD,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ram',
                                style: GoogleFonts.inter(
                                  fontSize: FONT_XSS,
                                  fontWeight: FontWeight.bold,
                                  color: BLUE_CLR_SHADE,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Hi Bhaskar!',
                                style: GoogleFonts.inter(
                                  fontSize: FONT_14,
                                  fontWeight: FontWeight.w400,
                                  color: WHITE_CLR,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: SPACING_SM,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: SELECTED_ICON_CLR,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(PADDING_MD),
                            topRight: Radius.circular(PADDING_MD),
                            bottomLeft: Radius.circular(PADDING_MD),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            'It\'s going well. Thanks for asking!',
                            style: GoogleFonts.inter(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w400,
                              color: WHITE_CLR,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: WHITE_CLR,
                        borderRadius: BorderRadius.circular(
                          PADDING_MD,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bhaskar',
                              style: GoogleFonts.inter(
                                fontSize: FONT_XSS,
                                fontWeight: FontWeight.bold,
                                color: WARM_GRAY_CLR,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.6,
                              ),
                              child: Text(
                                'No worries. Let me know if you need any help 😉',
                                style: GoogleFonts.inter(
                                  fontSize: FONT_14,
                                  fontWeight: FontWeight.w400,
                                  color: BLACK_SHADE,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    for (String message in _chattingController.messages)
                      buildMessage(message),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: SPACING_SM,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: BLUE_DARK_CLR,
                    size: SIZE_IC,
                  ),
                ),
                SizedBox(
                  height: 42,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextFormField(
                    controller: _chattingController.textEditingController,
                    cursorColor: TEXTFIELD_HINT_TXT_CLR,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      _chattingController.enteredText.value = value;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                      filled: true,
                      fillColor: TEXTFIELD_BG_CLR,
                      hintText: 'Typing......',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: FONT_SM,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF8F9098),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(71),
                        ),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(71),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(71),
                        ),
                      ),
                      alignLabelWithHint: true,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _chattingController.sendMessage(
                              _chattingController.textEditingController.text);
                        },
                        child: Image.asset(
                          'assets/images/Send.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMessage(String message) {
    return Container(
      decoration: BoxDecoration(
        color: WHITE_CLR,
        borderRadius: BorderRadius.circular(
          PADDING_MD,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bhaskar',
              style: GoogleFonts.inter(
                fontSize: FONT_XSS,
                fontWeight: FontWeight.bold,
                color: WARM_GRAY_CLR,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6,
              ),
              child: Text(
                message,
                style: GoogleFonts.inter(
                  fontSize: FONT_14,
                  fontWeight: FontWeight.w400,
                  color: BLACK_SHADE,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
