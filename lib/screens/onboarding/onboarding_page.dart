import 'package:diginova/global/constant.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  final String title;
  final String image;
  final String titleText;
  final String subtitleText;
  final int pageIndex;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.image,
    required this.titleText,
    required this.subtitleText,
    required this.pageIndex,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage(BACKGROUNDIMAGE),
            fit: BoxFit.cover,
          ),
          Positioned(
            top: PADDING_XXL,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                widget.title,
                style: NOVASMART_TXT_STYLE,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Image(
              image: AssetImage(widget.image),
            ),
          ),
          Positioned(
            bottom: 250,
            left: 0,
            right: 0,
            child: Align(
              child: Text(
                widget.titleText,
                style: TEXT_STYLE_MD,
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Align(
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(
                  height: 42,
                  width: 315,
                ),
                child: Text(
                  widget.subtitleText,
                  style: TEXT_STYLE_SM,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            left: 170,
            child: Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: (widget.pageIndex == 0)
                          ? DEFAULT_CLR
                          : GREY_SHADE_CLR,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: (widget.pageIndex == 1)
                          ? DEFAULT_CLR
                          : GREY_SHADE_CLR,
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
