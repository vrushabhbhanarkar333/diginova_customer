
class ProjectDetails {
    String? id;
    List<CustomerId>? customerId;
    String? assignedTo;
    Category? category;
    String? createdBy;
    String? companyId;
    String? endDate;
    String? projectAddress;
    String? projectLocationIframe;
    String? projectDescription;
    String? projectDetails;
    String? projectId;
    String? projectName;
    String? selectedStatus;
    String? startDate;
    String? taskDetails;
    List<Step>? steps;
    String? createdDate;
    int? v;
    String? imageUrl;

    ProjectDetails({
        this.id,
        this.customerId,
        this.assignedTo,
        this.category,
        this.createdBy,
        this.companyId,
        this.endDate,
        this.projectAddress,
        this.projectLocationIframe,
        this.projectDescription,
        this.projectDetails,
        this.projectId,
        this.projectName,
        this.selectedStatus,
        this.startDate,
        this.taskDetails,
        this.steps,
        this.createdDate,
        this.v,
        this.imageUrl,
    });

    factory ProjectDetails.fromJson(Map<String, dynamic> json) => ProjectDetails(
        id: json["_id"],
        customerId: json["customerId"] == null ? [] : List<CustomerId>.from(json["customerId"]!.map((x) => CustomerId.fromJson(x))),
        assignedTo: json["assignedTo"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        createdBy: json["createdBy"],
        companyId: json["companyId"],
        endDate: json["endDate"],
        projectAddress: json["projectAddress"],
        projectLocationIframe: json["projectLocationIframe"],
        projectDescription: json["projectDescription"],
        projectDetails: json["projectDetails"],
        projectId: json["projectID"],
        projectName: json["projectName"],
        selectedStatus: json["selectedStatus"],
        startDate: json["startDate"],
        taskDetails: json["taskDetails"],
        steps: json["steps"] == null ? [] : List<Step>.from(json["steps"]!.map((x) => Step.fromJson(x))),
        createdDate: json["createdDate"],
        v: json["__v"],
        imageUrl: json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "customerId": customerId == null ? [] : List<dynamic>.from(customerId!.map((x) => x.toJson())),
        "assignedTo": assignedTo,
        "category": category?.toJson(),
        "createdBy": createdBy,
        "companyId": companyId,
        "endDate": endDate,
        "projectAddress": projectAddress,
        "projectLocationIframe": projectLocationIframe,
        "projectDescription": projectDescription,
        "projectDetails": projectDetails,
        "projectID": projectId,
        "projectName": projectName,
        "selectedStatus": selectedStatus,
        "startDate": startDate,
        "taskDetails": taskDetails,
        "steps": steps == null ? [] : List<dynamic>.from(steps!.map((x) => x.toJson())),
        "createdDate": createdDate,
        "__v": v,
        "imageUrl": imageUrl,
    };
}

class Category {
    String? id;
    String? categoryName;

    Category({
        this.id,
        this.categoryName,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        categoryName: json["categoryName"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "categoryName": categoryName,
    };
}

class CustomerId {
    String? id;
    String? customerId;
    String? email;
    String? firstName;
    String? lastName;

    CustomerId({
        this.id,
        this.customerId,
        this.email,
        this.firstName,
        this.lastName,
    });

    factory CustomerId.fromJson(Map<String, dynamic> json) => CustomerId(
        id: json["_id"],
        customerId: json["customerId"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "customerId": customerId,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
    };
}

class Step {
    String? status;
    int? stepNumber;
    String? title;
    List<dynamic>? media;
    String? id;

    Step({
        this.status,
        this.stepNumber,
        this.title,
        this.media,
        this.id,
    });

    factory Step.fromJson(Map<String, dynamic> json) => Step(
        status: json["status"],
        stepNumber: json["stepNumber"],
        title: json["title"],
        media: json["media"] == null ? [] : List<dynamic>.from(json["media"]!.map((x) => x)),
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "stepNumber": stepNumber,
        "title": title,
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
        "_id": id,
    };
}
