class MenuListModel {
  int? statusCode;
  String? message;
  List<Payload>? payload;
  String? timeStamp;
  String? error;

  MenuListModel({this.statusCode, this.message, this.payload, this.timeStamp});

  MenuListModel.fromJson(Map<String, dynamic> json) {
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

  MenuListModel.withError(String errorMessage) {
    error = errorMessage;
  }
}

class Payload {
  String? menuId;
  String? restaurantId;
  String? menuName;
  String? photo;
  String? description;
  String? menuType;
  String? restaurantMenuType;
  bool? veg;
  double? price;
  bool? bestSeller;
  double? ratings;
  double? parcelCharges;
  bool? favourite;

  Payload(
      {this.menuId,
      this.restaurantId,
      this.menuName,
      this.photo,
      this.description,
      this.menuType,
      this.restaurantMenuType,
      this.veg,
      this.price,
      this.bestSeller,
      this.ratings,
      this.parcelCharges,
      this.favourite});

  Payload.fromJson(Map<String, dynamic> json) {
    menuId = json['menuId'];
    restaurantId = json['restaurantId'];
    menuName = json['menuName'];
    photo = json['photo'];
    description = json['description'];
    menuType = json['menuType'];
    restaurantMenuType = json['restaurantMenuType'];
    veg = json['veg'];
    price = json['price'];
    bestSeller = json['bestSeller'];
    ratings = json['ratings'];
    parcelCharges = json['parcelCharges'];
    favourite = json['favourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menuId'] = this.menuId;
    data['restaurantId'] = this.restaurantId;
    data['menuName'] = this.menuName;
    data['photo'] = this.photo;
    data['description'] = this.description;
    data['menuType'] = this.menuType;
    data['restaurantMenuType'] = this.restaurantMenuType;
    data['veg'] = this.veg;
    data['price'] = this.price;
    data['bestSeller'] = this.bestSeller;
    data['ratings'] = this.ratings;
    data['parcelCharges'] = this.parcelCharges;
    data['favourite'] = this.favourite;
    return data;
  }
}
