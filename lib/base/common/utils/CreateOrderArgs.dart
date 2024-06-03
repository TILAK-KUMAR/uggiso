class CreateOrderArgs {
  final List<Map<String, dynamic>> orderlist;
  final String? restaurantId;
  final String? restaurantName;

  CreateOrderArgs({required this.orderlist, required this.restaurantId,required this.restaurantName});
}
