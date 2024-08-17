class CreateOrderArgs {
  final List<Map<String, dynamic>> orderlist;
  final String? restaurantId;
  final String? restaurantName;
  final double? restaurantLat;
  final double? restaurantLng;

  CreateOrderArgs({required this.orderlist, required this.restaurantId,required this.restaurantName,
    required this.restaurantLat,required this.restaurantLng});
}
