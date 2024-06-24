// ignore_for_file: unnecessary_import

import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/files/pdf_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppPdfFiles extends StatelessWidget {
  const AppPdfFiles({super.key});

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
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 15,
                weight: 20,
              ),
            ),
            title: Text(
              'Files',
              style: TEXT_STYLE_M,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                color: DEFAULT_CLR,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 70,
              left: 18,
              right: 18,
            ),
            child: GridView.builder(
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: SPACING_SM,
                mainAxisSpacing: SPACING_SM,
              ),
              itemBuilder: (context, index) {
                return const PdfBtn(
                  title: 'Diginova',
                  value: '42Files',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
