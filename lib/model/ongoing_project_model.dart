class OngoingProjectDataModel {
  String? sId;
  List<AssignedTo>? assignedTo;
  String? category;
  String? createdBy;
  String? companyId;
  String? endDate;
  String? imageUrl; // Changed Null? to String?
  String? projectAddress;
  String? projectDescription;
  String? projectDetails;
  String? projectID;
  String? projectName;
  String? selectedStatus;
  String? startDate;
  String? taskDetails;
  List<Steps>? steps;
  String? createdDate;
  int? iV;

  OngoingProjectDataModel(
      {this.sId,
      this.assignedTo,
      this.category,
      this.createdBy,
      this.companyId,
      this.endDate,
      this.imageUrl,
      this.projectAddress,
      this.projectDescription,
      this.projectDetails,
      this.projectID,
      this.projectName,
      this.selectedStatus,
      this.startDate,
      this.taskDetails,
      this.steps,
      this.createdDate,
      this.iV});

  OngoingProjectDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['assignedTo'] != null) {
      assignedTo = <AssignedTo>[];
      json['assignedTo'].forEach((v) {
        assignedTo!.add(AssignedTo.fromJson(v));
      });
    }
    category = json['category'];
    createdBy = json['createdBy'];
    companyId = json['companyId'];
    endDate = json['endDate'];
    imageUrl = json['imageUrl'];
    projectAddress = json['projectAddress'];
    projectDescription = json['projectDescription'];
    projectDetails = json['projectDetails'];
    projectID = json['projectID'];
    projectName = json['projectName'];
    selectedStatus = json['selectedStatus'];
    startDate = json['startDate'];
    taskDetails = json['taskDetails'];
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(Steps.fromJson(v));
      });
    }
    createdDate = json['createdDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (assignedTo != null) {
      data['assignedTo'] = assignedTo!.map((v) => v.toJson()).toList();
    }
    data['category'] = category;
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
    if (steps != null) {
      data['steps'] = steps!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = createdDate;
    data['__v'] = iV;
    return data;
  }
}

class AssignedTo {
  String? sId;

  AssignedTo({this.sId});

  AssignedTo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    return data;
  }
}

class Steps {
  String? status;
  int? stepNumber;
  String? title;
  List<String>? media;
  String? sId;

  Steps({this.status, this.stepNumber, this.title, this.media, this.sId});

  Steps.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    stepNumber = json['stepNumber'];
    title = json['title'];
    media = json['media'].cast<String>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['stepNumber'] = stepNumber;
    data['title'] = title;
    data['media'] = media;
    data['_id'] = sId;
    return data;
  }
}
