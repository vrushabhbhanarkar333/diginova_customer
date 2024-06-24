import 'package:diginova/controller/my_orders_controller.dart';
import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final MyOrdersController _myOrdersController = MyOrdersController();
  final OrderStatus orderStatus = OrderStatus('#878675', [
    OrderStatusItem('Order received', DateTime(2023, 7, 16, 19, 43)),
    OrderStatusItem('Order being ready', DateTime(2023, 7, 16, 19, 51)),
    OrderStatusItem('Order ready', DateTime(2023, 7, 16, 19, 53)),
    OrderStatusItem('Order out for delivery', DateTime(2023, 7, 16, 19, 57)),
    OrderStatusItem('Order delivered', DateTime(2023, 7, 16, 20, 53)),
  ]);
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
            title: 'My Orders',
            fontWeight: FontWeight.w600,
            fontSize: FONT_16,
            color: BLACK_SHADE,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              top: mediaQueryH(context) * 0.12,
              left: PADDING_MD,
              right: PADDING_MD,
            ),
            child: Column(
              children: [
                ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) =>
                              OrderStatusBottomSheet(orderStatus: orderStatus),
                        );
                        // _showBottomSheet(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: WHITE_CLR,
                          borderRadius: BorderRadius.circular(BORDER_RADIUS_M),
                          border: Border.all(color: LIGHT_GREY_CLR),
                        ),
                        padding:
                            const EdgeInsets.symmetric(horizontal: PADDING_XS),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                                'assets/images/order-removebg-preview.png'),
                            const SizedBox(width: SPACING_MD),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: SPACING_MD),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Project No : ',
                                        style: FONT_14_SEMI_BOLD_TXT_STYLE,
                                      ),
                                      TextSpan(
                                        text: 'D1234',
                                        style: TEXT_STYLE_SM,
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Customer ID : ',
                                        style: FONT_14_SEMI_BOLD_TXT_STYLE,
                                      ),
                                      TextSpan(
                                        text: 'E4r3',
                                        style: TEXT_STYLE_SM,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '12 feb 2023, 4.00 pm',
                                  style: TEXT_STYLE_XSS_NORMAL.copyWith(
                                      color: GREY_BLUE_SHADE_CLRS),
                                )
                              ],
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
        ],
      ),
    );
  }
}

class OrderStatus {
  final String orderId;
  final List<OrderStatusItem> statusItems;

  OrderStatus(this.orderId, this.statusItems);
}

class OrderStatusItem {
  final String status;
  final DateTime timestamp;

  OrderStatusItem(this.status, this.timestamp);
}

class OrderStatusBottomSheet extends StatelessWidget {
  final OrderStatus orderStatus;

  const OrderStatusBottomSheet({super.key, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Close',
                          style: GoogleFonts.poppins(
                            fontSize: FONT_XSS,
                            fontWeight: FontWeight.w400,
                            color: BTN_BLUE_CLR,
                          ),
                        ),
                      ),
                      const SizedBox(width: SPACING_XL),
                      Text(
                        'Orders Information',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_SM,
                          fontWeight: FontWeight.w500,
                          color: BLACK_CLR_SHADE,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(color: DIVIDER_CLR),
              Padding(
                padding: const EdgeInsets.only(
                  left: PADDING_XL,
                  right: PADDING_LG,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Orders ID',
                      style: GoogleFonts.poppins(
                        fontSize: FONT_14,
                        fontWeight: FontWeight.w500,
                        color: BLACK_CLR_SHADE,
                      ),
                    ),
                    Text(
                      '#878675',
                      style: GoogleFonts.poppins(
                        fontSize: FONT_14,
                        fontWeight: FontWeight.w500,
                        color: BLACK_CLR_SHADE,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: orderStatus.statusItems.length,
                  itemBuilder: (context, index) {
                    final statusItem = orderStatus.statusItems[index];
                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: PADDING_SM),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 5.0),
                              Text(
                                '16 feb 2024',
                                style: TEXT_STYLE.copyWith(fontSize: FONT_XS),
                              ),
                              Text(
                                '20.53',
                                style: TEXT_STYLE.copyWith(fontSize: FONT_XS),
                              )
                            ],
                          ),
                          const SizedBox(width: 8.0),
                          Column(
                            children: [
                              // Container(height: 5, width: 1, color: GREY_CLR),
                              // const SizedBox(height: 2.0),
                              const Icon(Icons.circle, color: Colors.grey),
                              const SizedBox(height: 2.0),
                              Container(height: 45, width: 1, color: GREY_CLR)
                            ],
                          ),
                          const SizedBox(width: 8.0),
                          Container(
                            width: mediaQueryW(context) * 0.6,
                            padding: const EdgeInsets.all(PADDING_XS),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(BORDER_RADIUS_MD),
                                color: Color.fromARGB(255, 226, 223, 223)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(statusItem.status,
                                    style: TEXT_STYLE_SM_BOLD),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
//   Future<void> _showBottomSheet(BuildContext context) async {
//     return await showModalBottomSheet(
//       // isScrollControlled: true,
//       barrierColor: Colors.transparent,
//       context: context,
//       builder: (BuildContext context) {
//         return Stack(
//           children: [
//             Container(
//               width: double.infinity,
//               color: Colors.white,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // const SizedBox(height: SPACING_XS),
//                   Padding(
//                     padding: const EdgeInsets.all(PADDING_XS),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: Text(
//                             'Close',
//                             style: GoogleFonts.poppins(
//                               fontSize: FONT_XSS,
//                               fontWeight: FontWeight.w400,
//                               color: BTN_BLUE_CLR,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: SPACING_XL),
//                         Text(
//                           'Orders Information',
//                           style: GoogleFonts.poppins(
//                             fontSize: FONT_SM,
//                             fontWeight: FontWeight.w500,
//                             color: BLACK_CLR_SHADE,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Divider(color: DIVIDER_CLR),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       left: PADDING_XL,
//                       right: PADDING_LG,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Orders ID',
//                           style: GoogleFonts.poppins(
//                             fontSize: FONT_14,
//                             fontWeight: FontWeight.w500,
//                             color: BLACK_CLR_SHADE,
//                           ),
//                         ),
//                         Text(
//                           '#878675',
//                           style: GoogleFonts.poppins(
//                             fontSize: FONT_14,
//                             fontWeight: FontWeight.w500,
//                             color: BLACK_CLR_SHADE,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 50, top: 10),
//                     child: Stepper(
//                       stepIconBuilder: (context, index) {
//                         final currentStepValue =
//                             _myOrdersController.currentStep.value;
//                         final isActive = index == currentStepValue;
//                         return ClipOval(
//                           child: Container(
//                             color: isActive ? Colors.blue : Colors.grey,
//                           ),
//                         );
//                       },
//                       controlsBuilder: (context, details) => const SizedBox(),
//                       margin: EdgeInsets.zero,
//                       connectorColor:
//                           const MaterialStatePropertyAll(GREY_COLOR),
//                       currentStep: _myOrdersController.currentStep.value,
//                       steps: steps,
//                       type: StepperType.vertical,
//                       onStepTapped: (step) {
//                         setState(() {
//                           _myOrdersController.updateCurrentStep(step);
//                         });
//                       },
//                       onStepContinue: () {
//                         setState(() {
//                           final currentStepValue =
//                               _myOrdersController.currentStep.value;
//                           if (currentStepValue < steps.length - 1) {
//                             _myOrdersController
//                                 .updateCurrentStep(currentStepValue + 1);
//                           } else {
//                             _myOrdersController.updateCurrentStep(0);
//                           }
//                         });
//                       },
//                       onStepCancel: () {
//                         setState(() {
//                           final currentStepValue =
//                               _myOrdersController.currentStep.value;
//                           if (currentStepValue > 0) {
//                             _myOrdersController
//                                 .updateCurrentStep(currentStepValue - 1);
//                           } else {
//                             _myOrdersController.updateCurrentStep(0);
//                           }
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                 top: 105,
//                 left: 30,
//               ),
//               child: ListView.separated(
//                 physics: const NeverScrollableScrollPhysics(),
//                 separatorBuilder: (context, index) => const SizedBox(
//                   height: 25,
//                 ),
//                 itemCount: time.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(
//                       top: 10,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '16 Jul',
//                           style: GoogleFonts.poppins(
//                             fontSize: FONT_XSS,
//                             fontWeight: FontWeight.w500,
//                             color: DARK_BLUE_CLR,
//                           ),
//                         ),
//                         Text(
//                           time[index].toString(),
//                           style: GoogleFonts.poppins(
//                             fontSize: FONT_XSS,
//                             fontWeight: FontWeight.w500,
//                             color: const Color(0XFF85939B),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
List<Step> steps = [
  Step(
    title: Container(
      decoration: BoxDecoration(
        color: BG_GREY_SHADE_CLR,
        borderRadius: BorderRadius.circular(3.85),
      ),
      height: 50,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 20,
        ),
        child: Text(
          'Order delivered',
          style: GoogleFonts.poppins(
            fontSize: FONT_XSS,
            fontWeight: FontWeight.w400,
            color: DARK_BLUE_CLR,
          ),
        ),
      ),
    ),
    content: const SizedBox(),
    isActive: false,
  ),
  Step(
    title: Container(
      decoration: BoxDecoration(
        color: BG_GREY_SHADE_CLR,
        borderRadius: BorderRadius.circular(3.85),
      ),
      height: 50,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 20,
        ),
        child: Text(
          'Order out for delivery',
          style: GoogleFonts.poppins(
            fontSize: FONT_XSS,
            fontWeight: FontWeight.w400,
            color: DARK_BLUE_CLR,
          ),
        ),
      ),
    ),
    content: const SizedBox(),
    isActive: false,
  ),
  Step(
    title: Container(
      decoration: BoxDecoration(
        color: BG_GREY_SHADE_CLR,
        borderRadius: BorderRadius.circular(3.85),
      ),
      height: 50,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 20,
        ),
        child: Text(
          'Order ready',
          style: GoogleFonts.poppins(
            fontSize: FONT_XSS,
            fontWeight: FontWeight.w400,
            color: DARK_BLUE_CLR,
          ),
        ),
      ),
    ),
    content: const SizedBox(),
    isActive: false,
  ),
  Step(
    title: Container(
      decoration: BoxDecoration(
        color: BG_GREY_SHADE_CLR,
        borderRadius: BorderRadius.circular(3.85),
      ),
      height: 50,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 20,
        ),
        child: Text(
          'Order being ready',
          style: GoogleFonts.poppins(
            fontSize: FONT_XSS,
            fontWeight: FontWeight.w400,
            color: DARK_BLUE_CLR,
          ),
        ),
      ),
    ),
    content: const SizedBox(),
    state: StepState.complete,
    isActive: false,
  ),
  Step(
    title: Container(
      decoration: BoxDecoration(
        color: BG_GREY_SHADE_CLR,
        borderRadius: BorderRadius.circular(3.85),
      ),
      height: 50,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 20,
        ),
        child: Text(
          'Order received',
          style: GoogleFonts.poppins(
            fontSize: FONT_XSS,
            fontWeight: FontWeight.w400,
            color: DARK_BLUE_CLR,
          ),
        ),
      ),
    ),
    content: const SizedBox(),
    state: StepState.complete,
    isActive: true,
  ),
];

List<String> time = [
  '20:53',
  '19:57',
  '19:53',
  '19:51',
  '19:43',
];
