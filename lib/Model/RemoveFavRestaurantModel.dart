class RemoveFavRestaurantModel {
  int? statusCode;
  String? message;
  Null? payload;
  String? timeStamp;
  String? error;

  RemoveFavRestaurantModel(
      {this.statusCode, this.message, this.payload, this.timeStamp});

  RemoveFavRestaurantModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    payload = json['payload'];
    timeStamp = json['timeStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    data['payload'] = this.payload;
    data['timeStamp'] = this.timeStamp;
    return data;
  }
  RemoveFavRestaurantModel.withError(String errorMessage) {
    error = errorMessage;
  }
}