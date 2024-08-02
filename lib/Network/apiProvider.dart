import 'package:dio/dio.dart';
import 'package:uggiso/Model/AddFavoriteMenuModel.dart';
import 'package:uggiso/Model/GetNearByResaturantModel.dart';
import 'package:uggiso/Model/MenuListModel.dart';
import 'package:uggiso/Model/MyOrdersModel.dart';
import 'package:uggiso/Model/RegisterUserModel.dart';
import 'package:uggiso/Model/RestaurantByMenuTypeModel.dart';
import 'package:uggiso/Model/RestaurantDetailsModel.dart';
import 'package:uggiso/Model/VerifyOtpModel.dart';
import 'package:uggiso/Model/otpModel.dart';
import 'package:uggiso/Network/constants.dart';

import '../Model/GetFavMenuModel.dart';
import '../Model/GetFavRestaurantModel.dart';
import '../Model/OrderCheckoutModel.dart';
import '../Model/SaveIntroducerModel.dart';
import '../Model/WalletDetailsModel.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = Constants.baseUrl;

  Future<OtpModel> getOtp(String number) async {
    try {
      Response response = await _dio
          .post('${_url}${Constants.getOtp}', data: {"phoneNumber": number});
      print("${response.data}");
      return OtpModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OtpModel.withError("Data not found / Connection issue");
    }
  }

  Future<VerifyOtpModel> verifyOtp(String? number, String otp) async {
    print('this is rewuest : $number and $otp');
    try {
      Response response = await _dio.post('${_url}${Constants.verifyOtp}',
          data: {"phoneNumber": number, "otp": otp});
      print("${response.data}");

      return VerifyOtpModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return VerifyOtpModel.withError("Data not found / Connection issue");
    }
  }

  Future<RegisterUserModel> registerUser(String name, String number,
      String userType, String deviceId, String token) async {
    try {
      Response response =
          await _dio.post('${_url}${Constants.registerUser}', data: {
        "name": name,
        "phoneNumber": number,
        "userType": userType,
        "deviceData": deviceId,
        "fcmToken": token
      });
      print("${response.data}");

      return RegisterUserModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return RegisterUserModel.withError("Data not found / Connection issue");
    }
  }

  Future<RestaurantDetailsModel> getRestaurantDetails(String id) async {
    try {
      Response response =
          await _dio.get('${_url}${Constants.restaurantDetails}$id');
      print("${response.data}");

      return RestaurantDetailsModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return RestaurantDetailsModel.withError(
          "Data not found / Connection issue");
    }
  }

  Future<MenuListModel> getMenuList(String id,String restId) async {
    try {
      Response response = await _dio.post('${_url}${Constants.getFavMenu}',
          data:{
            "userId": id,
            "restaurantId":restId
          });
      print("${response.data}");

      return MenuListModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MenuListModel.withError("Data not found / Connection issue");
    }
  }

  Future<AddFavoriteMenuModel> addFavMenu(String userId, String menuId) async {
    try {
      Response response = await _dio.post('${_url}${Constants.addFavMenu}',
          data: {"userId": userId, "menuId": menuId});
      print("${response.data}");

      return AddFavoriteMenuModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return AddFavoriteMenuModel.withError(
          "Data not found / Connection issue");
    }
  }

  Future<String> deleteFavMenu(String userId) async {
    try {
      Response response = await _dio.delete(
          '${_url}${Constants.getFavMenu}$userId');
      print("${response.data}");
      if (response.statusCode == 200) {
        return 'Success';
      } else {
        return 'error';
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return 'error';
    }
  }

  Future<String> addFavRestaurant(String userId, String restId) async {
    try {
      Response response = await _dio.post(
          '${_url}${Constants.addFavRestaurant}',
          data: {"userId": userId, "restaurantId": restId});
      print("${response.data}");
      if (response.statusCode == 200) {
        return 'Success';
      } else {
        return 'error';
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return 'error';
    }
  }

  Future<String> deleteFavRestaurant(String userId) async {
    try {
      Response response = await _dio.delete(
          '${_url}${Constants.getFavRestaurant}$userId');
      print("${response.data}");
      if (response.statusCode == 200) {
        return 'Success';
      } else {
        return 'error';
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return 'error';
    }
  }

  Future<GetNearByRestaurantModel> getNearByRestaurant(
      String userId, double lat, double lag, double distance,String mode) async {
    print('calling api : $lat and $lag');
    try {
      Response response = await _dio
          .post('${_url}${Constants.restaurantNearBy}', data: {
        "userId": userId,
        "lat": lat,
        "lng": lag,
        "distance": distance,
        "mode": mode
      });
      print("${response.data}");

      return GetNearByRestaurantModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return GetNearByRestaurantModel.withError(
          "Data not found / Connection issue");
    }
  }

  Future<GetNearByRestaurantModel> getFavHotelList(String userId) async {
    try {
      Response response =
          await _dio.get('${_url}${Constants.getFavRestaurant}$userId');
      print("${response.data}");

      return GetNearByRestaurantModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return GetNearByRestaurantModel.withError(
          "Data not found / Connection issue");
    }
  }

  Future<GetFavMenuModel> getFavMenuList(String userId, String restaurantID) async {
    try {
      Response response =
          await _dio.post('${_url}${Constants.getFavMenu}',data:{
          "userId": userId,
          "restaurantId":restaurantID
          });
      print("${response.data}");

      return GetFavMenuModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return GetFavMenuModel.withError("Data not found / Connection issue");
    }
  }

  Future<OrderCheckoutModel> createOrder(
      String restaurantId,
      String restaurantName,
      String customerId,
      List menuData,
      String orderType,
      String paymentType,
      String orderStatus,
      int totalAmount,
      String comments,
      String timeSlot,
      String transMode) async {
    print(
        'this is request data :{ restaurantId: $restaurantId, restaurantName: $restaurantName,"customerId": $customerId,"menus": $menuData'
        ',"orderType":$orderType,"paymentType": $paymentType,"orderStatus": $orderStatus,"totalAmount": $totalAmount'
        ',"comments": $comments,"timeSlot": $timeSlot,"transMode":$transMode');
    try {
      Response response =
          await _dio.post('${_url}${Constants.createOrder}', data: {
        "restaurantId": restaurantId,
        "restaurantName": restaurantName,
        "customerId": customerId,
        "menus": menuData,
        "orderType": orderType,
        "paymentType": paymentType,
        "orderStatus": orderStatus,
        "totalAmount": totalAmount,
        "comments": comments,
        "timeSlot": null,
        "travelMode": transMode
      });
      print("${response.data}");

      return OrderCheckoutModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderCheckoutModel.withError("Data not found / Connection issue");
    }
  }

  Future<MyOrdersModel> getMyOrders(String userId) async {
    try {
      Response response = await _dio.get('${_url}${Constants.myOrders}$userId');
      print("${response.data}");

      return MyOrdersModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MyOrdersModel.withError("Data not found / Connection issue");
    }
  }

  Future<RestaurantByMenuTypeModel> getRestaurantDetailsByMenuType(
      String menuType) async {
    try {
      Response response = await _dio
          .get('${_url}${Constants.getRestaurantByMenuType}$menuType');
      print("${response.data}");

      return RestaurantByMenuTypeModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return RestaurantByMenuTypeModel.withError(
          "Data not found / Connection issue");
    }
  }

  Future<WalletDetailsModel> getWalletDetails(String id) async {
    try {
      Response response = await _dio.get('${_url}${Constants.getMyWallet}$id');
      print("${response.data}");

      return WalletDetailsModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return WalletDetailsModel.withError(
          "Data not found / Connection issue");
    }
  }

  Future<SaveIntroducerModel> saveIntroducers(
      String acceptorUuid, String introducerPhone) async {
    try {
      Response response = await _dio.post('${_url}${Constants.saveIntroducers}',
          data: {
            "acceptorUuid": acceptorUuid,
            "introducerPhone": introducerPhone,
            "referenceType": "CUSTOMER"
          });
      print("${response.data}");

      return SaveIntroducerModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SaveIntroducerModel.withError(
          "Data not found / Connection issue");
    }
  }
  Future<SaveIntroducerModel> getRestaurantOnway(
      String userId, String originLat,String originLang,String destinationLat, String destinationLang,String mode) async {
    try {
      Response response = await _dio.post('${_url}${Constants.restaurantOnway}',
          data: {
            "userId": userId,
            "originLat":originLat,
            "originLang":originLang,
            "destinationLat":destinationLat,
            "destinationLang":destinationLang,
            "mode":mode
          });
      print("${response.data}");

      return SaveIntroducerModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SaveIntroducerModel.withError(
          "Data not found / Connection issue");
    }
  }

/*  Future<void> paymentDetails(
      String orderId,String receiverId,String senderId,String payerName,String status,
      String statusCode,String responseCode,String sabpaisaTxnId,String bankName,String bankMessage,
      String bankTxnId,String sabpaisaErrorCode,String refundStatusCode,String bankErrorCode, String transactionId,
      String chargeBackStatus,String settlementStatus) async {
    try {
      Response response = await _dio.post('${_url}${Constants.saveIntroducers}',
          data: {
            "orderId":orderId,
            "receiverId": receiverId,
            "senderId": senderId,
            "payerName": payerName,
            "status": status,
            "statusCode": statusCode,
            "responseCode": responseCode,
            "sabpaisaTxnId": sabpaisaTxnId,
            "bankName": bankName,
            "bankMessage": bankMessage,
            "bankTxnId": bankTxnId,
            "sabpaisaErrorCode": sabpaisaErrorCode,
            "refundStatusCode": refundStatusCode,
            "bankErrorCode": bankErrorCode,
            "transactionId": transactionId,
            "chargeBackStatus": chargeBackStatus,
            "settlementStatus": settlementStatus
          });
      print("${response.data}");

      return SaveIntroducerModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SaveIntroducerModel.withError(
          "Data not found / Connection issue");
    }
  }*/
}
