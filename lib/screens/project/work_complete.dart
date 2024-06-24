import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/project/process_two.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinishedScreen extends StatelessWidget {
  const FinishedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProcessTwo()));
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: SELECTED_ICON_CLR),
          height: 150,
          width: 70,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      'Work Completed',
                      style: GoogleFonts.poppins(
                        fontSize: FONT_SM,
                        fontWeight: FontWeight.w600,
                        color: WHITE_CLR,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(
                      'Purchase',
                      style: GoogleFonts.poppins(
                        fontSize: FONT_SM,
                        fontWeight: FontWeight.normal,
                        color: WHITE_CLR,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          'assets/images/ProfileImage.png',
                        ),
                        Positioned(
                          left: 28,
                          child: Image.asset(
                            'assets/images/ProfileImage.png',
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text(
                        'Work by Username. ',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_SM,
                          fontWeight: FontWeight.normal,
                          color: WHITE_CLR,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
// =======
// <<<<<<< manoj_work
    // return Card(
    //     child: Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10), color: DEFAULT_CLR),
//       height: 150,
//       width: 70,
//       child: Column(children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20, left: 20),
//               child: Text(
//                 'Work Completed',
//                 style: GoogleFonts.poppins(
//                   fontSize: FONT_SM,
//                   fontWeight: FontWeight.w600,
//                   color: WHITE_CLR,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 20, top: 5),
//               child: Text(
//                 'Purchase',
//                 style: GoogleFonts.poppins(
//                   fontSize: FONT_SM,
//                   fontWeight: FontWeight.normal,
//                   color: WHITE_CLR,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 20.0, top: 10.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Image.asset(
//                     'assets/images/Avatar.png',
//                   ),
//                   Positioned(
//                     left: 28,
//                     child: Image.asset(
//                       'assets/images/Avatar.png',
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 40),
//                 child: Text(
//                   'Work by Username. ',
//                   style: GoogleFonts.poppins(
//                     fontSize: FONT_SM,
//                     fontWeight: FontWeight.normal,
//                     color: WHITE_CLR,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 20.0, top: 10.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Image.asset(
//                     'assets/images/ProfileImage.png',
//                   ),
//                   Positioned(
//                     left: 28,
//                     child: Image.asset(
//                       'assets/images/ProfileImage.png',
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 40),
//                 child: Text(
//                   'Work by Username. ',
//                   style: GoogleFonts.poppins(
//                     fontSize: FONT_SM,
//                     fontWeight: FontWeight.normal,
//                     color: WHITE_CLR,
//                   ),
//                 ),
//               ),
// =======
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const ProcessTwo(),
//           ),
//         );
//       },
//       child: Card(
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10), color: DEFAULT_CLR),
//           // height: 150,
//           width: 70,
//           child: Column(
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20, left: 20),
//                     child: Text(
//                       'Work Completed',
//                       style: GoogleFonts.poppins(
//                         fontSize: FONT_SM,
//                         fontWeight: FontWeight.w600,
//                         color: WHITE_CLR,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20, top: 5),
//                     child: Text(
//                       'Purchase',
//                       style: GoogleFonts.poppins(
//                         fontSize: FONT_SM,
//                         fontWeight: FontWeight.normal,
//                         color: WHITE_CLR,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: SPACING_SM,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20.0, top: 10.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Stack(
//                       clipBehavior: Clip.none,
//                       children: [
//                         CircleAvatar(
//                           maxRadius: 15,
//                           child: Image.asset(
//                             'assets/images/ProfileImage.png',
//                           ),
//                         ),
//                         Positioned(
//                           left: 18,
//                           child: CircleAvatar(
//                             maxRadius: 15,
//                             child: Image.asset(
//                               'assets/images/ProfileImage.png',
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 25),
//                       child: Text(
//                         'Work by Saurabh , Manoj ',
//                         style: GoogleFonts.poppins(
//                           fontSize: FONT_SM,
//                           fontWeight: FontWeight.normal,
//                           color: WHITE_CLR,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: SPACING_SM,
//               ),
// >>>>>>> main
    //         ],
    //       ),
    //     ),
    //   ]),
    // ));
// >>>>>>> main
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:diginova/Services/firebasefunctions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// class FinishedScreen extends StatelessWidget {
//   const FinishedScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: StreamBuilder<QuerySnapshot>(
//         stream: FirestoreServices.getAllProjectData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const SpinKitWave(
//               type: SpinKitWaveType.center,
//               color: Colors.blue, // Adjust color as needed
//               size: 30.0, // Adjust size as needed
//             ); // Loading indicator
//           }

//           // Filter project documents based on status
//           var projectDocuments = snapshot.data!.docs
//               .where((doc) =>
//                   (doc.data() as Map<String, dynamic>)['selectedStatus'] ==
//                   'Done')
//               .toList();

//           // Display project data
//           // var projectDocuments = snapshot.data!.docs;
//           if (projectDocuments.isNotEmpty) {
//             return ListView.builder(
//               itemCount: projectDocuments.length,
//               itemBuilder: (context, index) {
//                 var projectData =
//                     projectDocuments[index].data() as Map<String, dynamic>;

//                 // Extract data fields from the project document
//                 String title = projectData['projectName'] ?? '';
//                 String description = projectData['projectDescription'] ?? '';
//                 String imageUrl = projectData['imageUrl'] ?? '';
//                 String assignedTo = projectData['assignedTo'] ?? '';
//                 String category = projectData['category'] ?? '';
//                 String createdAt = projectData['createdAt'] != null
//                     ? (projectData['createdAt'] as Timestamp)
//                         .toDate()
//                         .toString()
//                     : '';
//                 String customerId = projectData['customerId'] ?? '';
//                 String endDate = projectData['endDate'] ?? '';
//                 String projectId = projectData['projectID'] ?? '';
//                 String projectAddress = projectData['projectAddress'] ?? '';
//                 String projectDetails = projectData['projectDetails'] ?? '';
//                 String selectedStatus = projectData['selectedStatus'] ?? '';
//                 String startDate = projectData['startDate'] ?? '';
//                 String taskDetails = projectData['taskDetails'] ?? '';

//                 return Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Display image at the top and center
//                         imageUrl.isNotEmpty
//                             ? Center(
//                                 child: Image.network(
//                                   imageUrl,
//                                   width: MediaQuery.of(context)
//                                       .size
//                                       .width, // Use full width
//                                   height: MediaQuery.of(context).size.height *
//                                       0.2, // Adjust height as needed
//                                   fit: BoxFit.cover, // Adjust image fit
//                                 ),
//                               )
//                             : Container(),
//                         const SizedBox(height: 16),
//                         Text(
//                           title,
//                           style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           description,
//                           style: const TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           'Assigned To: $assignedTo',
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                         Text(
//                           'Category: $category',
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                         Text(
//                           'Created At: $createdAt',
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                         Text(
//                           'Customer ID: $customerId',
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                         Text(
//                           'End Date: $endDate',
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                         Text(
//                           'Project ID: $projectId',
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                         Text(
//                           'Address: $projectAddress',
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                         Text(
//                           'Details: $projectDetails',
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                         Text(
//                           'Status: $selectedStatus',
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                         Text(
//                           'Start Date: $startDate',
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                         Text(
//                           'Task Details: $taskDetails',
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else {
//             return const Text('No completed project data available.');
//           }
//         },
//       ),
//     );
//   }
// }
