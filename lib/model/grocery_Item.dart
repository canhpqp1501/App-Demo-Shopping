

import 'category.dart';

class GroceryItem {
  const GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });
  final String id;
  final String name;
  final int quantity;
  final Category category;
}
// tạo class mặt hàng gồm id, tên, số lượng, loại mặt hàng.