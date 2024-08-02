class RestaurantDetailsModel {
  int? statusCode;
  String? message;
  Payload? payload;
  String? timeStamp;
  String? error;

  RestaurantDetailsModel(
      {this.statusCode, this.message, this.payload, this.timeStamp});

  RestaurantDetailsModel.fromJson(Map<String, dynamic> json) {
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

  RestaurantDetailsModel.withError(String errorMessage) {
    error = errorMessage;
  }
}

class Payload {
  String? restaurantId;
  String? ownerId;
  String? restaurantName;
  bool? veg;
  bool? opened;
  String? phoneNumber;
  String? address;
  String? landmark;
  Null? latitude;
  Null? longitude;
  String? city;
  String? state;
  Null? accountNumber;
  Null? ifscCode;
  Null? upiData;
  Null? imageUrl;
  Null? openTime;
  Null? closeTime;
  Null? userStatus;
  Null? restaurantType;
  String? createdDate;

  Payload(
      {this.restaurantId,
        this.ownerId,
        this.restaurantName,
        this.veg,
        this.opened,
        this.phoneNumber,
        this.address,
        this.landmark,
        this.latitude,
        this.longitude,
        this.city,
        this.state,
        this.accountNumber,
        this.ifscCode,
        this.upiData,
        this.imageUrl,
        this.openTime,
        this.closeTime,
        this.userStatus,
        this.restaurantType,
        this.createdDate});

  Payload.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurantId'];
    ownerId = json['ownerId'];
    restaurantName = json['restaurantName'];
    veg = json['veg'];
    opened = json['opened'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    landmark = json['landmark'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    city = json['city'];
    state = json['state'];
    accountNumber = json['accountNumber'];
    ifscCode = json['ifscCode'];
    upiData = json['upiData'];
    imageUrl = json['imageUrl'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    userStatus = json['userStatus'];
    restaurantType = json['restaurantType'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurantId'] = this.restaurantId;
    data['ownerId'] = this.ownerId;
    data['restaurantName'] = this.restaurantName;
    data['veg'] = this.veg;
    data['opened'] = this.opened;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['landmark'] = this.landmark;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['city'] = this.city;
    data['state'] = this.state;
    data['accountNumber'] = this.accountNumber;
    data['ifscCode'] = this.ifscCode;
    data['upiData'] = this.upiData;
    data['imageUrl'] = this.imageUrl;
    data['openTime'] = this.openTime;
    data['closeTime'] = this.closeTime;
    data['userStatus'] = this.userStatus;
    data['restaurantType'] = this.restaurantType;
    data['createdDate'] = this.createdDate;
    return data;
  }
}