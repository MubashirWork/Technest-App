import 'package:flutter/cupertino.dart';

class Item {
  final String title;
  final AssetImage image;
  final double price;
  final String description;
  final String category;

  const Item({
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.category
  });
}
