import 'dart:convert';
import 'package:http/http.dart';
import 'package:uggiso/Model/AddFavoriteMenuModel.dart';
import 'package:uggiso/Model/MenuListModel.dart';
import 'package:uggiso/Model/MyOrdersModel.dart';
import 'package:uggiso/Model/PaymentDetailsModel.dart';
import 'package:uggiso/Model/RegisterUserModel.dart';
import 'package:uggiso/Model/RestaurantDetailsModel.dart';
import 'package:uggiso/Model/UpdateOrderModel.dart';
import 'package:uggiso/Model/VerifyOtpModel.dart';
import 'package:uggiso/Model/otpModel.dart';
import 'package:uggiso/Network/apiProvider.dart';

import '../Model/GetFavMenuModel.dart';
import '../Model/GetFavRestaurantModel.dart';
import '../Model/GetNearByResaturantModel.dart';
import '../Model/OrderCheckoutModel.dart';
import '../Model/RemoveFavRestaurantModel.dart';
import '../Model/RestaurantByMenuTypeModel.dart';
import '../Model/SaveIntroducerModel.dart';
import '../Model/WalletDetailsModel.dart';

class ApiRepository {
  final _provider = ApiProvider();

  String userUrl = 'https://reqres.in/api/users?page=2';

  Future<OtpModel> getOtp(String number) {
    return _provider.getOtp(number);
  }

  Future<VerifyOtpModel> verifyOtp(String? number,String otp) {
    return _provider.verifyOtp(number,otp);
  }

  Future<RegisterUserModel> registerUser(String name,String number,String userType,String deviceId,String token, String status) {
    return _provider.registerUser(name,number,userType,deviceId,token,status);
  }

  Future<RestaurantDetailsModel> getResaturantDetails(String id) {
    return _provider.getRestaurantDetails(id);
  }

  Future<GetNearByRestaurantModel> getNearbyRestaurant(String userId,double lat, double lag, double distance,String mode) {
    return _provider.getNearByRestaurant(userId,lat,lag,distance,mode);
  }

  Future<MenuListModel> getMenuList(String? id,String? restId) {
    return _provider.getMenuList(id!,restId!);
  }

  Future<AddFavoriteMenuModel> addFavMenu(String userId, String menuId) {
    return _provider.addFavMenu(userId,menuId);
  }

  Future<String> deleteFavMenu(String userId) {
    return _provider.deleteFavRestaurant(userId);
  }

  Future<String> addFavHotel(String userId, String restId) {
    return _provider.addFavRestaurant(userId,restId);
  }
  Future<String> deleteFavHotel(String userId) {
    return _provider.deleteFavRestaurant(userId);
  }

  Future<GetNearByRestaurantModel> getFavHotel(String restId) {
    return _provider.getFavHotelList(restId);
  }

  Future<GetFavMenuModel> getFavMenu(String menuId,String restaurantId) {
    return _provider.getFavMenuList(menuId,restaurantId);
  }

  Future<OrderCheckoutModel> createOrder(String restaurantId,String restaurantName,String customerId,
      List menuData,String orderType,String paymentType,
      String orderStatus,int totalAmount,String comments,
      String timeSlot,String transMode) {
    return _provider.createOrder(restaurantId,restaurantName,customerId,menuData,orderType,paymentType,orderStatus,
    totalAmount,comments,timeSlot,transMode);
  }

  Future<WalletDetailsModel> getWalletDetails(String userId) {
    return _provider.getWalletDetails(userId);
  }

  Future<SaveIntroducerModel> saveIntroducers(String acceptorUuid, String introducerPhone) {
    return _provider.saveIntroducers(acceptorUuid,introducerPhone);
  }

  Future<MyOrdersModel> getMyOrders(String userId) {
    return _provider.getMyOrders(userId);
  }

  Future<SaveIntroducerModel> getRestaurantOnway(String userId, String originLat,String originLang,String destinationLat, String destinationLang,String mode) {
    return _provider.getRestaurantOnway( userId,originLat, originLang, destinationLat,destinationLang,mode);
  }

  Future<UpdateOrderModel> updateOrderStatus(String orderId,String orderStatus) {
    return _provider.updateOrderStatus( orderId,orderStatus);
  }

  Future<RemoveFavRestaurantModel> removeFavRestaurant(String userId, String restaurantId) {
    return _provider.removeFavRestaurant( userId,restaurantId);
  }

  Future<RemoveFavRestaurantModel> removeFavMenu(String userId, String menuId) {
    return _provider.removeFavMenu( userId,menuId);
  }

  Future<PaymentDetailsModel> addPayDetails(String orderId, String receiverId,String senderId,String status,String transactionId) {
    return _provider.addPayDetails( orderId,receiverId,senderId,status,transactionId);
  }


}