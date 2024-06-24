import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WarrentyScreen extends StatefulWidget {
  const WarrentyScreen({super.key});

  @override
  State<WarrentyScreen> createState() => _WarrentyScreenState();
}

class _WarrentyScreenState extends State<WarrentyScreen> {
  String appBarTitle = 'Warrenty';
  bool isComplete = true;
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
            onPressed: () {
              Navigator.pop(context);
            },
            title: 'Warrenty',
            fontWeight: FontWeight.w500,
            fontSize: FONT_M,
            color: BLACK_CLR,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 100),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  WarrentyCard(
                    projectNumber: 'DG8797',
                    customerID: '56657',
                    onPressed: () {
                      // Handle completion button press
                    },
                    isComplete: true,
                  ),
                  WarrentyCard(
                    projectNumber: 'DG8797',
                    customerID: '56657',
                    onPressed: () {
                      // Handle completion button press
                    },
                    isComplete: true,
                  ),
                  WarrentyCard(
                    projectNumber: 'DG8797',
                    customerID: '56657',
                    onPressed: () {
                      // Handle completion button press
                    },
                    isComplete: false,
                  ),
                  WarrentyCard(
                    projectNumber: 'DG8797',
                    customerID: '56657',
                    onPressed: () {
                      // Handle completion button press
                    },
                    isComplete: true,
                  ),
                  WarrentyCard(
                    projectNumber: 'DG8797',
                    customerID: '56657',
                    onPressed: () {
                      // Handle completion button press
                    },
                    isComplete: false,
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

class WarrentyCard extends StatelessWidget {
  final String projectNumber;
  final String customerID;
  final VoidCallback onPressed;
  final bool isComplete;

  const WarrentyCard({
    super.key,
    required this.projectNumber,
    required this.customerID,
    required this.onPressed,
    required this.isComplete,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BORDER_RADIUS_M),
          side: const BorderSide(
            color: LIGHT_GREY_CLR,
          ),
        ),
        elevation: 0.1,
        color: WHITE_CLR,
        child: Padding(
          padding: const EdgeInsets.all(SPACING_MD),
          child: Row(
            children: [
              Image.asset('assets/images/order-removebg-preview.png'),
              const SizedBox(width: SPACING_MD),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Project No : ',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_XSS,
                              fontWeight: FontWeight.bold,
                              color: BLACK_CLR_SHADE,
                            ),
                          ),
                          TextSpan(
                            text: projectNumber,
                            style: GoogleFonts.poppins(
                              fontSize: FONT_16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: SPACING_SM),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Customer ID: ',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_XSS,
                              fontWeight: FontWeight.bold,
                              color: BLACK_CLR_SHADE,
                            ),
                          ),
                          TextSpan(
                            text: customerID,
                            style: GoogleFonts.poppins(
                              fontSize: FONT_XSS,
                              fontWeight: FontWeight.bold,
                              color: Colors.black26,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: SPACING_SM),
                    SizedBox(
                      height: 18.16,
                      width: 73,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            if (isComplete) {
                              return GREEN_SHADE_CLR; // Completed: Green color
                            } else {
                              return RED_SHADE_CLRS; // Expired: Red color
                            }
                          }),
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: onPressed,
                        child: Text(
                          'Completed',
                          style: GoogleFonts.poppins(
                            fontSize: FONT_XS,
                            fontWeight: FontWeight.w500,
                            color: WHITE_SHADE_CLR,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: SPACING_XS),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class Cardswidget extends StatelessWidget {
//   final int index;
//   const Cardswidget({
//     super.key,
//     required this.index,
//   });

//   @override
//   Widget build(BuildContext context) {
//     String appBarTitle = 'Warrenty';

//     bool isCancelled = index == 3;

//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(
//           BORDER_RADIUS_M,
//         ),
//         side: const BorderSide(
//           color: LIGHT_GREY_CLR,
//         ),
//       ),
//       elevation: 5,
//       surfaceTintColor: Colors.transparent,
//       child: Row(
//         children: [
//           Image.asset(
//             'assets/images/transformers.jpg',
//             height: 124,
//             width: 148,
//           ),
//           Positioned(
//             left: 20,
//             right: 20,
//             top: 70,
//             child: ListView.separated(
//               shrinkWrap: true,
//               itemCount: 3,
//               separatorBuilder: (context, index) =>
//                   const SizedBox(height: SPACING_MD),
//               itemBuilder: (context, index) {
//                 return Cardswidget(
//                   index: index + 1,
//                 );
//               },
//             ),
//           ),
//           AppBarNova(
//             title: appBarTitle,
//             fontWeight: FontWeight.w600,
//             fontSize: FONT_M,
//             color: BLACK_SHADE,
//             onPressed: () => Navigator.pop(context),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Cardswidgets extends StatelessWidget {
//   final int index;
//   const Cardswidgets({
//     super.key,
//     required this.index,
//   });

//   @override
//   Widget build(BuildContext context) {
//     bool isCancelled = index == 3;

//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(
//           BORDER_RADIUS_M,
//         ),
//         side: const BorderSide(
//           color: LIGHT_GREY_CLR,
//         ),
//       ),
//       elevation: 5,
//       surfaceTintColor: Colors.transparent,
//       child: Row(
//         children: [
//           Image.asset(
//             'assets/images/transformers.jpg',
//             height: 124,
//             width: 148,
//           ),
//           const SizedBox(width: SPACING_MD),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: SPACING_MD),
//               RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: 'Project No:',
//                       style: FONT_16_TXT_STYLE,
//                     ),
//                     TextSpan(
//                       text: 'DG8797',
//                       style: GoogleFonts.poppins(
//                         fontSize: FONT_16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black45,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: SPACING_MD),
//               RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: 'Customer ID: ',
//                       style: GoogleFonts.poppins(
//                         fontSize: FONT_XSS,
//                         fontWeight: FontWeight.bold,
//                         color: BLACK_CLR_SHADE,
//                       ),
//                     ),
//                     TextSpan(
//                       text: '56657',
//                       style: GoogleFonts.poppins(
//                         fontSize: FONT_XSS,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black26,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: SPACING_MD),
//               SizedBox(
//                 height: 18.16,
//                 width: 73,
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStatePropertyAll(
//                       isCancelled ? Colors.red : GREEN_SHADE_CLR,
//                     ),
//                     padding: const MaterialStatePropertyAll(
//                       EdgeInsets.zero,
//                     ),
//                     shape: const MaterialStatePropertyAll(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(20),
//                         ),
//                       ),
//                     ),
//                   ),
//                   onPressed: () {},
//                   child: Text(
//                     isCancelled ? 'Cancel' : 'Warranty',
//                     style: GoogleFonts.poppins(
//                       fontSize: FONT_XS,
//                       fontWeight: FontWeight.w500,
//                       color: WHITE_SHADE_CLR,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: SPACING_XS),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
