class ProjectDataModel {
  ProjectDataModel({
    required this.id,
    required this.assignedTo,
    required this.createdBy,
    required this.companyId,
    required this.endDate,
    required this.imageUrl,
    required this.projectAddress,
    required this.projectDescription,
    required this.projectDetails,
    required this.projectID,
    required this.projectName,
    required this.selectedStatus,
    required this.startDate,
    required this.taskDetails,
    required this.steps,
    required this.createdDate,
    required this.V,
  });
  late final String id;
  late final List<String> assignedTo;
  late final String createdBy;
  late final String companyId;
  late final String endDate;
  late final String imageUrl;
  late final String projectAddress;
  late final String projectDescription;
  late final String projectDetails;
  late final String projectID;
  late final String projectName;
  late final String selectedStatus;
  late final String startDate;
  late final String taskDetails;
  late final List<Steps> steps;
  late final String createdDate;
  late final int V;

  ProjectDataModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? "";
    assignedTo = List.castFrom<dynamic, String>(json['assignedTo'] ?? "");
    createdBy = json['createdBy'] ?? "";
    companyId = json['companyId'] ?? "";
    endDate = json['endDate'] ?? "";
    imageUrl = json['imageUrl'] ?? "";
    projectAddress = json['projectAddress'] ?? "";
    projectDescription = json['projectDescription'] ?? "";
    projectDetails = json['projectDetails'] ?? "";
    projectID = json['projectID'] ?? "";
    projectName = json['projectName'] ?? "";
    selectedStatus = json['selectedStatus'] ?? "";
    startDate = json['startDate'] ?? "";
    taskDetails = json['taskDetails'] ?? "";
    steps =
        List.from(json['steps'] ?? "").map((e) => Steps.fromJson(e)).toList();
    createdDate = json['createdDate'] ?? "";
    V = json['__v'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['assignedTo'] = assignedTo;
    data['createdBy'] = createdBy;
    data['companyId'] = companyId;
    data['endDate'] = endDate;
    data['imageUrl'] = imageUrl;
    data['projectAddress'] = projectAddress;
    data['projectDescription'] = projectDescription;
    data['projectDetails'] = projectDetails;
    data['projectID'] = projectID;
    data['projectName'] = projectName;
    data['selectedStatus'] = selectedStatus;
    data['startDate'] = startDate;
    data['taskDetails'] = taskDetails;
    data['steps'] = steps.map((e) => e.toJson()).toList();
    data['createdDate'] = createdDate;
    data['__v'] = V;
    return data;
  }
}

class Steps {
  Steps({
    required this.status,
    required this.stepNumber,
    required this.title,
    required this.id,
  });
  late final String status;
  late final int stepNumber;
  late final String title;
  late final String id;

  Steps.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? "";
    stepNumber = json['stepNumber'] ?? "";
    title = json['title'] ?? "";
    id = json['_id'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['stepNumber'] = stepNumber;
    data['title'] = title;
    data['_id'] = id;
    return data;
  }
}

// class ProjectData {
//   ProjectData({
//     required this.endDate,
//     required this.selectedStatus,
//     required this.projectDetails,
//     required this.assignedTo,
//     required this.imageUrl,
//     required this.projectDescription,
//     required this.customerId,
//     required this.projectAddress,
//     required this.category,
//     required this.projectName,
//     required this.projectID,
//     required this.startDate,
//     required this.taskDetails,
//   });
//   late final String endDate;
//   late final String selectedStatus;
//   late final String projectDetails;
//   late final String assignedTo;
//   late final String imageUrl;
//   late final String projectDescription;
//   late final String customerId;
//   late final String projectAddress;
//   late final String category;
//   late final String projectName;
//   late final String projectID;
//   late final String startDate;
//   late final String taskDetails;

//   ProjectData.fromJson(Map<String, dynamic> json) {
//     endDate = json['endDate'] ?? "";
//     selectedStatus = json['selectedStatus'] ?? "";
//     projectDetails = json['projectDetails'] ?? "";
//     assignedTo = json['assignedTo'] ?? "";
//     imageUrl = json['imageUrl'] ?? "";
//     projectDescription = json['projectDescription'] ?? "";
//     customerId = json['customerId'] ?? "";
//     projectAddress = json['projectAddress'] ?? "";
//     category = json['category'] ?? "";
//     projectName = json['projectName'] ?? "";
//     projectID = json['projectID'] ?? "";
//     startDate = json['startDate'] ?? "";
//     taskDetails = json['taskDetails'] ?? "";
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['endDate'] = endDate;
//     data['selectedStatus'] = selectedStatus;
//     data['projectDetails'] = projectDetails;
//     data['assignedTo'] = assignedTo;
//     data['imageUrl'] = imageUrl;
//     data['projectDescription'] = projectDescription;
//     data['customerId'] = customerId;
//     data['projectAddress'] = projectAddress;
//     data['category'] = category;
//     data['projectName'] = projectName;
//     data['projectID'] = projectID;
//     data['startDate'] = startDate;
//     data['taskDetails'] = taskDetails;
//     return data;
//   }
// }

// class CreatedAt {
  // CreatedAt({
  //   required this.seconds,
  //   required this.nanoseconds,
  // });
  // late final int seconds;
  // late final int nanoseconds;

  // CreatedAt.fromJson(Map<String, dynamic> json) {
  //   seconds = json['seconds'];
  //   nanoseconds = json['nanoseconds'];
  // }

  // Map<String, dynamic> toJson() {
  //   final data = <String, dynamic>{};
  //   data['seconds'] = seconds;
  //   data['nanoseconds'] = nanoseconds;
  //   return data;
  // }
// }
