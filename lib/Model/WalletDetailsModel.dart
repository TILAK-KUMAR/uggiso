class WalletDetailsModel {
  int? statusCode;
  String? message;
  Payload? payload;
  String? timeStamp;
  String? error;


  WalletDetailsModel(
      {this.statusCode, this.message, this.payload, this.timeStamp});

  WalletDetailsModel.fromJson(Map<String, dynamic> json) {
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
  WalletDetailsModel.withError(String errorMessage) {
    error = errorMessage;
  }
}

class Payload {
  String? userId;
  double? balance;

  Payload({this.userId, this.balance});

  Payload.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['balance'] = this.balance;
    return data;
  }
}
