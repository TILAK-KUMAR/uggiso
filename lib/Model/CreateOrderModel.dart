class CreateOrderModel {
  int? statusCode;
  String? message;
  List<Payload>? payload;
  String? timeStamp;

  CreateOrderModel(
      {this.statusCode, this.message, this.payload, this.timeStamp});

  CreateOrderModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['payload'] != null) {
      payload = <Payload>[];
      json['payload'].forEach((v) {
        payload!.add(new Payload.fromJson(v));
      });
    }
    timeStamp = json['timeStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.payload != null) {
      data['payload'] = this.payload!.map((v) => v.toJson()).toList();
    }
    data['timeStamp'] = this.timeStamp;
    return data;
  }
}

class Payload {
  String? orderId;
  String? restaurantId;
  String? customerId;
  String? paymentType;
  String? orderStatus;
  String? orderType;
  String? travelMode;
  List<Menus>? menus;
  String? timeSlot;
  int? totalAmount;
  int? discount;
  String? comments;
  String? orderDate;
  String? orderTime;
  String? fcmToken;

  Payload(
      {this.orderId,
        this.restaurantId,
        this.customerId,
        this.paymentType,
        this.orderStatus,
        this.orderType,
        this.travelMode,
        this.menus,
        this.timeSlot,
        this.totalAmount,
        this.discount,
        this.comments,
        this.orderDate,
        this.orderTime,
        this.fcmToken});

  Payload.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    restaurantId = json['restaurantId'];
    customerId = json['customerId'];
    paymentType = json['paymentType'];
    orderStatus = json['orderStatus'];
    orderType = json['orderType'];
    travelMode = json['travelMode'];
    if (json['menus'] != null) {
      menus = <Menus>[];
      json['menus'].forEach((v) {
        menus!.add(new Menus.fromJson(v));
      });
    }
    timeSlot = json['timeSlot'];
    totalAmount = json['totalAmount'];
    discount = json['discount'];
    comments = json['comments'];
    orderDate = json['orderDate'];
    orderTime = json['orderTime'];
    fcmToken = json['fcmToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['restaurantId'] = this.restaurantId;
    data['customerId'] = this.customerId;
    data['paymentType'] = this.paymentType;
    data['orderStatus'] = this.orderStatus;
    data['orderType'] = this.orderType;
    data['travelMode'] = this.travelMode;
    if (this.menus != null) {
      data['menus'] = this.menus!.map((v) => v.toJson()).toList();
    }
    data['timeSlot'] = this.timeSlot;
    data['totalAmount'] = this.totalAmount;
    data['discount'] = this.discount;
    data['comments'] = this.comments;
    data['orderDate'] = this.orderDate;
    data['orderTime'] = this.orderTime;
    data['fcmToken'] = this.fcmToken;
    return data;
  }
}

class Menus {
  int? orderedMenuId;
  String? orderId;
  String? menuId;
  int? quantityAmount;
  int? quantity;
  int? parcelAmount;

  Menus(
      {this.orderedMenuId,
        this.orderId,
        this.menuId,
        this.quantityAmount,
        this.quantity,
        this.parcelAmount});

  Menus.fromJson(Map<String, dynamic> json) {
    orderedMenuId = json['orderedMenuId'];
    orderId = json['orderId'];
    menuId = json['menuId'];
    quantityAmount = json['quantityAmount'];
    quantity = json['quantity'];
    parcelAmount = json['parcelAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderedMenuId'] = this.orderedMenuId;
    data['orderId'] = this.orderId;
    data['menuId'] = this.menuId;
    data['quantityAmount'] = this.quantityAmount;
    data['quantity'] = this.quantity;
    data['parcelAmount'] = this.parcelAmount;
    return data;
  }
}