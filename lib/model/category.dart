import 'package:flutter/material.dart';

enum Categories {
  milk,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other,
}
// tạo enum với các thực phẩm có sẵn

class Category {
  const Category(this.title, this.color);

  final String title;
  final Color color;
}
// tạo class để chứa các thuộc tính như tên, màu sác của thực phẩm.
