import 'dart:convert';
import 'package:http/http.dart';
import 'package:uggiso/Model/AddFavoriteMenuModel.dart';
import 'package:uggiso/Model/MenuListModel.dart';
import 'package:uggiso/Model/RegisterUserModel.dart';
import 'package:uggiso/Model/RestaurantDetailsModel.dart';
import 'package:uggiso/Model/VerifyOtpModel.dart';
import 'package:uggiso/Model/otpModel.dart';
import 'package:uggiso/Network/apiProvider.dart';

import '../Model/GetFavMenuModel.dart';
import '../Model/GetFavRestaurantModel.dart';
import '../Model/GetNearByResaturantModel.dart';

class ApiRepository {
  final _provider = ApiProvider();

  String userUrl = 'https://reqres.in/api/users?page=2';

  Future<OtpModel> getOtp(String number) {
    return _provider.getOtp(number);
  }

  Future<VerifyOtpModel> verifyOtp(String? number,String otp) {
    return _provider.verifyOtp(number,otp);
  }

  Future<RegisterUserModel> registerUser(String name,String number,String userType,String deviceId,String token) {
    return _provider.registerUser(name,number,userType,deviceId,token);
  }

  Future<RestaurantDetailsModel> getResaturantDetails(String id) {
    return _provider.getRestaurantDetails(id);
  }

  Future<GetNearByRestaurantModel> getNearbyRestaurant(String lat, String lag, double distance) {
    return _provider.getNearByRestaurant(lat,lag,distance);
  }

  Future<MenuListModel> getMenuList(String? id) {
    return _provider.getMenuList(id!);
  }

  Future<AddFavoriteMenuModel> addFavMenu(String userId, String menuId) {
    return _provider.addFavMenu(userId,menuId);
  }

  Future<String> addFavHotel(String userId, String restId) {
    return _provider.addFavRestaurant(userId,restId);
  }

  Future<GetNearByRestaurantModel> getFavHotel(String restId) {
    return _provider.getFavHotelList(restId);
  }

  Future<GetFavMenuModel> getFavMenu(String menuId) {
    return _provider.getFavMenuList(menuId);
  }


}