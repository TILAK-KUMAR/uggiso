import '../../../Model/AddMenuItemToCart.dart';

class Cart {
  final List<AddMenuItemToCart> items = [];

  void addItem(AddMenuItemToCart item) {
    int index = items.indexWhere((element) => element.menuId == item.menuId);
    if (index != -1) {
      items[index].quantity++;
    } else {
      items.add(item);
      item.quantity++;
    }
  }

  void removeItem(AddMenuItemToCart item) {
    int index = items.indexWhere((element) => element.menuId == item.menuId);
    if (index != -1) {
      if (items[index].quantity > 1) {
        items[index].quantity--;
      } else {
        items.removeAt(index);
      }
    }
  }
}