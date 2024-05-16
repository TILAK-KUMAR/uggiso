class CreateOrderModel {
  String? restaurantId;
  String? customerId;
  List<Menus>? menus;
  String? paymentType;
  String? orderStatus;
  int? totalAmount;
  String? comments;

  CreateOrderModel(
      {this.restaurantId,
        this.customerId,
        this.menus,
        this.paymentType,
        this.orderStatus,
        this.totalAmount,
        this.comments});

  CreateOrderModel.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurantId'];
    customerId = json['customerId'];
    if (json['menus'] != null) {
      menus = <Menus>[];
      json['menus'].forEach((v) {
        menus!.add(new Menus.fromJson(v));
      });
    }
    paymentType = json['paymentType'];
    orderStatus = json['orderStatus'];
    totalAmount = json['totalAmount'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurantId'] = this.restaurantId;
    data['customerId'] = this.customerId;
    if (this.menus != null) {
      data['menus'] = this.menus!.map((v) => v.toJson()).toList();
    }
    data['paymentType'] = this.paymentType;
    data['orderStatus'] = this.orderStatus;
    data['totalAmount'] = this.totalAmount;
    data['comments'] = this.comments;
    return data;
  }
}

class Menus {
  String? menuId;
  int? quantity;
  int? quantityAmount;

  Menus({this.menuId, this.quantity, this.quantityAmount});

  Menus.fromJson(Map<String, dynamic> json) {
    menuId = json['menuId'];
    quantity = json['quantity'];
    quantityAmount = json['quantityAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menuId'] = this.menuId;
    data['quantity'] = this.quantity;
    data['quantityAmount'] = this.quantityAmount;
    return data;
  }
}