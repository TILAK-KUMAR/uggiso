class GetNearByRestaurantModel {
  int? statusCode;
  String? message;
  List<Payload>? payload;
  String? timeStamp;
  String? error;


  GetNearByRestaurantModel(
      {this.statusCode, this.message, this.payload, this.timeStamp});

  GetNearByRestaurantModel.fromJson(Map<String, dynamic> json) {
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

  GetNearByRestaurantModel.withError(String errorMessage) {
    error = errorMessage;
  }
}

class Payload {
  String? restaurantId;
  String? ownerId;
  String? restaurantName;
  String? phoneNumber;
  String? address;
  String? landmark;
  double? lat;
  double? lng;
  String? city;
  String? state;
  String? accountNumber;
  String? ifscCode;
  String? upiData;
  String? imageUrl;
  String? openTime;
  String? closeTime;
  String? restaurantStatus;
  String? restaurantMenuType;
  String? restaurantSize;
  String? createdDate;
  double? ratings;
  double? duration;
  double? distance;
  bool? favourite;

  Payload(
      {this.restaurantId,
        this.ownerId,
        this.restaurantName,
        this.phoneNumber,
        this.address,
        this.landmark,
        this.lat,
        this.lng,
        this.city,
        this.state,
        this.accountNumber,
        this.ifscCode,
        this.upiData,
        this.imageUrl,
        this.openTime,
        this.closeTime,
        this.restaurantStatus,
        this.restaurantMenuType,
        this.restaurantSize,
        this.createdDate,
      this.ratings,
      this.duration,
      this.distance,
      this.favourite,
      });

  Payload.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurantId'];
    ownerId = json['ownerId'];
    restaurantName = json['restaurantName'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    landmark = json['landmark'];
    lat = json['lat'];
    lng = json['lng'];
    city = json['city'];
    state = json['state'];
    accountNumber = json['accountNumber'];
    ifscCode = json['ifscCode'];
    upiData = json['upiData'];
    imageUrl = json['imageUrl'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    restaurantStatus = json['restaurantStatus'];
    restaurantMenuType = json['restaurantMenuType'];
    restaurantSize = json['restaurantSize'];
    createdDate = json['createdDate'];
    ratings = json['ratings'];
    duration = json['duration'];
    distance = json['distance'];
    favourite = json['favourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurantId'] = this.restaurantId;
    data['ownerId'] = this.ownerId;
    data['restaurantName'] = this.restaurantName;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['landmark'] = this.landmark;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['city'] = this.city;
    data['state'] = this.state;
    data['accountNumber'] = this.accountNumber;
    data['ifscCode'] = this.ifscCode;
    data['upiData'] = this.upiData;
    data['imageUrl'] = this.imageUrl;
    data['openTime'] = this.openTime;
    data['closeTime'] = this.closeTime;
    data['restaurantStatus'] = this.restaurantStatus;
    data['restaurantMenuType'] = this.restaurantMenuType;
    data['restaurantSize'] = this.restaurantSize;
    data['createdDate'] = this.createdDate;
    data['ratings'] = this.ratings;
    data['duration'] = this.duration;
    data['distance'] = this.distance;
    data['favourite'] = this.favourite;
    return data;
  }
}