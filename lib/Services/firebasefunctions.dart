import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static Future<void> saveUser(
    String name,
    String email,
    String customerId,
    String projectId,
    String phoneNumber,
    String uid,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('firebase').doc(uid).set({
        'email': email,
        'name': name,
        'customerId': customerId,
        'projectId': projectId,
        'phoneNumber': phoneNumber,
        'uid': uid,
      });
    } catch (e) {
      // Handle errors
      print('Error saving user: $e');
    }
  }

  static Future<void> saveProjectFile(
    String projectId,
    String fileName,
    String fileUrl,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('Project Files')
          .doc(projectId)
          .collection('Files')
          .doc()
          .set({
        'fileName': fileName,
        'fileUrl': fileUrl,
      });
    } catch (e) {
      // Handle errors
      print('Error saving project file: $e');
    }
  }

  // Method to fetch data from the 'projectData' collection
  static Stream<QuerySnapshot> getAllProjectData() {
    return FirebaseFirestore.instance.collection('projectData').snapshots();
  }

  void retrieveOne() {
    FirebaseFirestore.instance.collection("projectData").get().then((value) => {
          value.docs.forEach((result) {
            print(result.data());
          }),
        });
  }

  static Stream<QuerySnapshot> getProcessSubCollection(String projectId) {
    return FirebaseFirestore.instance
        .collection('projectData')
        .doc(projectId)
        .collection('process')
        .snapshots();
  }
}
