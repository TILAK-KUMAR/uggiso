import 'package:dio/dio.dart';
import 'package:uggiso/Model/AddFavoriteMenuModel.dart';
import 'package:uggiso/Model/MenuListModel.dart';
import 'package:uggiso/Model/RegisterUserModel.dart';
import 'package:uggiso/Model/RestaurantDetailsModel.dart';
import 'package:uggiso/Model/VerifyOtpModel.dart';
import 'package:uggiso/Model/otpModel.dart';
import 'package:uggiso/Network/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = Constants.baseUrl;

  Future<OtpModel> getOtp(String number) async {
    try {
      Response response = await _dio.post('${_url}${Constants.getOtp}',data: {
        "phoneNumber": number
      });
      print("${response.data}");
      return OtpModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OtpModel.withError("Data not found / Connection issue");
    }
  }

  Future<VerifyOtpModel> verifyOtp(String number,String otp) async {
    try {
      Response response = await _dio.post('${_url}${Constants.verifyOtp}',data: {
        "phoneNumber":number,
        "otp":otp
      });
      print("${response.data}");

      return VerifyOtpModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return VerifyOtpModel.withError("Data not found / Connection issue");
    }
  }

  Future<RegisterUserModel> registerUser(String name,String number,String userType,String deviceId,String token) async {
    try {
      Response response = await _dio.post('${_url}${Constants.registerUser}',data: {
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
      Response response = await _dio.get('${_url}${Constants.restaurantDetails}$id');
      print("${response.data}");

      return RestaurantDetailsModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return RestaurantDetailsModel.withError("Data not found / Connection issue");
    }
  }

  Future<MenuListModel> getMenuList(String id) async {
    try {
      Response response = await _dio.get('${_url}${Constants.menuList}$id');
      print("${response.data}");

      return MenuListModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MenuListModel.withError("Data not found / Connection issue");
    }
  }

  Future<AddFavoriteMenuModel> addFavMenu(String userId,String menuId) async {
    try {
      Response response = await _dio.post('${_url}${Constants.addFavMenu}',data: {
        {
          "userId":userId,
          "menuId":menuId
        }
      });
      print("${response.data}");

      return AddFavoriteMenuModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return AddFavoriteMenuModel.withError("Data not found / Connection issue");
    }
  }
}