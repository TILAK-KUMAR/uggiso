class UpdateOrderModel {
  int? statusCode;
  String? message;
  Payload? payload;
  String? timeStamp;
  String? error;

  UpdateOrderModel(
      {this.statusCode, this.message, this.payload, this.timeStamp});

  UpdateOrderModel.fromJson(Map<String, dynamic> json) {
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
  UpdateOrderModel.withError(String errorMessage) {
    error = errorMessage;
  }
}

class Payload {
  String? orderId;
  String? restaurantId;
  String? restaurantName;
  String? customerId;
  String? paymentType;
  String? orderStatus;
  String? orderType;
  String? travelMode;
  Null? timeSlot;
  double? totalAmount;
  double? discount;
  String? comments;
  String? orderDate;
  String? orderTime;

  Payload(
      {this.orderId,
        this.restaurantId,
        this.restaurantName,
        this.customerId,
        this.paymentType,
        this.orderStatus,
        this.orderType,
        this.travelMode,
        this.timeSlot,
        this.totalAmount,
        this.discount,
        this.comments,
        this.orderDate,
        this.orderTime});

  Payload.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    restaurantId = json['restaurantId'];
    restaurantName = json['restaurantName'];
    customerId = json['customerId'];
    paymentType = json['paymentType'];
    orderStatus = json['orderStatus'];
    orderType = json['orderType'];
    travelMode = json['travelMode'];
    timeSlot = json['timeSlot'];
    totalAmount = json['totalAmount'];
    discount = json['discount'];
    comments = json['comments'];
    orderDate = json['orderDate'];
    orderTime = json['orderTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['restaurantId'] = this.restaurantId;
    data['restaurantName'] = this.restaurantName;
    data['customerId'] = this.customerId;
    data['paymentType'] = this.paymentType;
    data['orderStatus'] = this.orderStatus;
    data['orderType'] = this.orderType;
    data['travelMode'] = this.travelMode;
    data['timeSlot'] = this.timeSlot;
    data['totalAmount'] = this.totalAmount;
    data['discount'] = this.discount;
    data['comments'] = this.comments;
    data['orderDate'] = this.orderDate;
    data['orderTime'] = this.orderTime;
    return data;
  }
}