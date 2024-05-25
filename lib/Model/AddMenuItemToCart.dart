class AddMenuItemToCart{
  final String menuId;
  final String menuName;
  final String menuType;
  final double price;
  int quantity;

  AddMenuItemToCart({
    required this.menuId,
    required this.menuName,
    required this.menuType,
    required this.price,
    this.quantity = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'menuId': menuId,
      'menuName': menuName,
      'menuType': menuType,
      'price': price,
      'quantity': quantity,
    };
  }

  factory AddMenuItemToCart.fromJson(Map<String, dynamic> json) {
    return AddMenuItemToCart(
      menuId: json['menuId'],
      menuName: json['menuName'],
      menuType: json['menuType'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  @override
  String toString() {
    return 'AddMenuItemToCart{menuId: $menuId, menuName: $menuName, menuType: $menuType, price: $price, quantity: $quantity}';
  }
}