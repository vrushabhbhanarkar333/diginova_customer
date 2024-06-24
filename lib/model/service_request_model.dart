class ServiceRequestModel {
  String? sId;
  CustomerId? customerId;
  ProjectId? projectId;
  String? scheduleTime;
  String? scheduleDate;
  String? problem;
  List<String>? mediaFIle;
  String? companyId;
  CreatedBy? createdBy;
  String? status;
  String? createdDate;
  int? iV;

  ServiceRequestModel(
      {this.sId,
      this.customerId,
      this.projectId,
      this.scheduleTime,
      this.scheduleDate,
      this.problem,
      this.mediaFIle,
      this.companyId,
      this.createdBy,
      this.status,
      this.createdDate,
      this.iV});

  ServiceRequestModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    customerId = json['customerId'] != null
        ? new CustomerId.fromJson(json['customerId'])
        : null;
    projectId = json['projectId'] != null
        ? new ProjectId.fromJson(json['projectId'])
        : null;
    scheduleTime = json['scheduleTime'];
    scheduleDate = json['ScheduleDate'];
    problem = json['problem'];
    mediaFIle = json['mediaFIle'].cast<String>();
    companyId = json['companyId'];
    createdBy = json['createdBy'] != null
        ? new CreatedBy.fromJson(json['createdBy'])
        : null;
    status = json['status'];
    createdDate = json['createdDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.customerId != null) {
      data['customerId'] = this.customerId!.toJson();
    }
    if (this.projectId != null) {
      data['projectId'] = this.projectId!.toJson();
    }
    data['scheduleTime'] = this.scheduleTime;
    data['ScheduleDate'] = this.scheduleDate;
    data['problem'] = this.problem;
    data['mediaFIle'] = this.mediaFIle;
    data['companyId'] = this.companyId;
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    data['status'] = this.status;
    data['createdDate'] = this.createdDate;
    data['__v'] = this.iV;
    return data;
  }
}

class CustomerId {
  String? sId;
  String? customerId;
  int? noProjects;
  String? status;
  String? companyId;
  String? createdBy;
  String? customerSince;
  String? createdDate;
  int? iV;
  String? userId;
  List<String>? projectId;

  CustomerId(
      {this.sId,
      this.customerId,
      this.noProjects,
      this.status,
      this.companyId,
      this.createdBy,
      this.customerSince,
      this.createdDate,
      this.iV,
      this.userId,
      this.projectId});

  CustomerId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    customerId = json['customerId'];
    noProjects = json['noProjects'];
    status = json['status'];
    companyId = json['companyId'];
    createdBy = json['createdBy'];
    customerSince = json['customerSince'];
    createdDate = json['createdDate'];
    iV = json['__v'];
    userId = json['userId'];
    projectId = json['projectId'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['customerId'] = this.customerId;
    data['noProjects'] = this.noProjects;
    data['status'] = this.status;
    data['companyId'] = this.companyId;
    data['createdBy'] = this.createdBy;
    data['customerSince'] = this.customerSince;
    data['createdDate'] = this.createdDate;
    data['__v'] = this.iV;
    data['userId'] = this.userId;
    data['projectId'] = this.projectId;
    return data;
  }
}

class ProjectId {
  String? sId;
  List<String>? assignedTo;
  String? createdBy;
  String? companyId;
  String? endDate;
  String? imageUrl;
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

  ProjectId(
      {this.sId,
      this.assignedTo,
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

  ProjectId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    assignedTo = json['assignedTo'].cast<String>();
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
        steps!.add(new Steps.fromJson(v));
      });
    }
    createdDate = json['createdDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['assignedTo'] = this.assignedTo;
    data['createdBy'] = this.createdBy;
    data['companyId'] = this.companyId;
    data['endDate'] = this.endDate;
    data['imageUrl'] = this.imageUrl;
    data['projectAddress'] = this.projectAddress;
    data['projectDescription'] = this.projectDescription;
    data['projectDetails'] = this.projectDetails;
    data['projectID'] = this.projectID;
    data['projectName'] = this.projectName;
    data['selectedStatus'] = this.selectedStatus;
    data['startDate'] = this.startDate;
    data['taskDetails'] = this.taskDetails;
    if (this.steps != null) {
      data['steps'] = this.steps!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = this.createdDate;
    data['__v'] = this.iV;
    return data;
  }
}

class Steps {
  String? status;
  int? stepNumber;
  String? title;
  String? sId;

  Steps({this.status, this.stepNumber, this.title, this.sId});

  Steps.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    stepNumber = json['stepNumber'];
    title = json['title'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['stepNumber'] = this.stepNumber;
    data['title'] = this.title;
    data['_id'] = this.sId;
    return data;
  }
}

class CreatedBy {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? role;

  CreatedBy({this.sId, this.firstName, this.lastName, this.email, this.role});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}
