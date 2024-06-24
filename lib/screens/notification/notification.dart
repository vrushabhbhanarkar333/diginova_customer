import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
            title: 'Notification',
            fontWeight: FontWeight.w500,
            fontSize: FONT_M,
            color: BLACK_CLR,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 70,
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent',
                    style: TEXT_STYLE_M_SEMI_BOLD,
                  ),
                  const SizedBox(
                    height: SPACING_SM,
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      color: DIVIDER_CLR,
                    ),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(bottom: PADDING_XS),
                          child: CircleAvatar(
                            backgroundColor: AVATAR_BG_CLR,
                            backgroundImage: AssetImage(AVATAR),
                          ),
                        ),
                        title: Text(
                          'You received an new update on your',
                          style: FONT_14_MEDIUM_TXT_STYLE
                            ..copyWith(
                              color: BLACK_CLR,
                            ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Control AMPS',
                              style: FONT_14_BOLD_TXT_STYLE
                                ..copyWith(
                                  color: BLACK_CLR,
                                ),
                            ),
                            Text(
                              "09:20 AM",
                              style: TEXT_STYLE_XSS_MEDIUM
                                ..copyWith(
                                  color: const Color(0XFF8F9098),
                                ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Divider(
                    color: DIVIDER_CLR,
                  ),
                  const SizedBox(
                    height: SPACING_XS,
                  ),
                  Center(
                      child: Text(
                    'No More',
                    style: TEXT_STYLE_XSS_MEDIUM
                      ..copyWith(
                        color: const Color(0XFF8F9098),
                      ),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
