class VerifyOtpModel {
  int? statusCode;
  String? message;
  Payload? payload;
  String? timeStamp;
  String? error;

  VerifyOtpModel({this.statusCode, this.message, this.payload, this.timeStamp});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    payload =
    json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    timeStamp = json['timeStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    data['timeStamp'] = this.timeStamp;
    return data;
  }
  VerifyOtpModel.withError(String errorMessage) {
    error = errorMessage;
  }
}

class Payload {
  String? userId;
  String? name;
  String? phoneNumber;
  String? userType;
  String? userStatus;
  Null? profilePic;
  String? createdDate;

  Payload(
      {this.userId,
        this.name,
        this.phoneNumber,
        this.userType,
        this.userStatus,
        this.profilePic,
        this.createdDate});

  Payload.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    userType = json['userType'];
    userStatus = json['userStatus'];
    profilePic = json['profilePic'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['userType'] = this.userType;
    data['userStatus'] = this.userStatus;
    data['profilePic'] = this.profilePic;
    data['createdDate'] = this.createdDate;
    return data;
  }
}
