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
  String? restaurantName;
  String? restaurantMenuType;
  String? phoneNumber;
  String? address;
  String? landmark;
  double? lat;
  double? lng;
  double? ratings;
  String? duration;
  String? distance;
  bool? favourite;

  Payload(
      {this.restaurantId,
        this.restaurantName,
        this.restaurantMenuType,
        this.phoneNumber,
        this.address,
        this.landmark,
        this.lat,
        this.lng,
        this.ratings,
        this.duration,
        this.distance,
        this.favourite});

  Payload.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurantId'];
    restaurantName = json['restaurantName'];
    restaurantMenuType = json['restaurantMenuType'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    landmark = json['landmark'];
    lat = json['lat'];
    lng = json['lng'];
    ratings = json['ratings'];
    duration = json['duration'];
    distance = json['distance'];
    favourite = json['favourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurantId'] = this.restaurantId;
    data['restaurantName'] = this.restaurantName;
    data['restaurantMenuType'] = this.restaurantMenuType;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['landmark'] = this.landmark;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['ratings'] = this.ratings;
    data['duration'] = this.duration;
    data['distance'] = this.distance;
    data['favourite'] = this.favourite;
    return data;
  }
}