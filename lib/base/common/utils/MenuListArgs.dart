import '../../../Model/GetNearByResaturantModel.dart';

class MenuListArgs{
  final String? restaurantId;
  final String? name;
  final String? foodType;
  final double? ratings;
  final String? landmark;
  final String? distance;
  final String? duration;
  final Payload? payload;

  MenuListArgs({required this.restaurantId, required this.name, required this.foodType,
    required this.ratings, required this.landmark,required this.distance,required this.duration,required this.payload});
}