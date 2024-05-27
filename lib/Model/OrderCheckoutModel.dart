class OrderCheckoutModel {
  int? statusCode;
  String? message;
  Payload? payload;
  String? timeStamp;
  String? error;


  OrderCheckoutModel(
      {this.statusCode, this.message, this.payload, this.timeStamp});

  OrderCheckoutModel.fromJson(Map<String, dynamic> json) {
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

  OrderCheckoutModel.withError(String errorMessage) {
    error = errorMessage;
  }
}

class Payload {
  String? orderId;
  String? restaurantId;
  String? customerId;
  String? paymentType;
  String? orderStatus;
  String? timeSlot;
  double? totalAmount;
  double? discount;
  String? comments;
  String? orderDate;
  String? orderTime;

  Payload(
      {this.orderId,
        this.restaurantId,
        this.customerId,
        this.paymentType,
        this.orderStatus,
        this.timeSlot,
        this.totalAmount,
        this.discount,
        this.comments,
        this.orderDate,
        this.orderTime});

  Payload.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    restaurantId = json['restaurantId'];
    customerId = json['customerId'];
    paymentType = json['paymentType'];
    orderStatus = json['orderStatus'];
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
    data['customerId'] = this.customerId;
    data['paymentType'] = this.paymentType;
    data['orderStatus'] = this.orderStatus;
    data['timeSlot'] = this.timeSlot;
    data['totalAmount'] = this.totalAmount;
    data['discount'] = this.discount;
    data['comments'] = this.comments;
    data['orderDate'] = this.orderDate;
    data['orderTime'] = this.orderTime;
    return data;
  }
}