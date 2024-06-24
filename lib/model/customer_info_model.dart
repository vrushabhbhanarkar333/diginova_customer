class CustomerinfoModel {
  CustomerinfoModel({
    required this.projectId,
    required this.id,
    required this.customerId,
    required this.noProjects,
    required this.status,
    required this.companyId,
    required this.createdBy,
    required this.customerSince,
    required this.createdDate,
    required this.V,
    required this.userId,
  });
  late final List<dynamic> projectId;
  late final String id;
  late final String customerId;
  late final int noProjects;
  late final String status;
  late final String companyId;
  late final String createdBy;
  late final String customerSince;
  late final String createdDate;
  late final int V;
  late final String userId;

  CustomerinfoModel.fromJson(Map<String, dynamic> json) {
    projectId = List.castFrom<dynamic, dynamic>(json['projectId']);
    id = json['_id'];
    customerId = json['customerId'];
    noProjects = json['noProjects'];
    status = json['status'];
    companyId = json['companyId'];
    createdBy = json['createdBy'];
    customerSince = json['customerSince'];
    createdDate = json['createdDate'];
    V = json['__v'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['projectId'] = projectId;
    data['_id'] = id;
    data['customerId'] = customerId;
    data['noProjects'] = noProjects;
    data['status'] = status;
    data['companyId'] = companyId;
    data['createdBy'] = createdBy;
    data['customerSince'] = customerSince;
    data['createdDate'] = createdDate;
    data['__v'] = V;
    data['userId'] = userId;
    return data;
  }
}
