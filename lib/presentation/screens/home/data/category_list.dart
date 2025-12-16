// Category list
import 'package:flutter/material.dart';
import 'package:technest/core/constants/app_assets.dart';
import 'package:technest/presentation/screens/home/model/category.dart';

List<ItemCategory> categoryList = [
  ItemCategory(title: 'Computer', image: AssetImage(Assets.lcd)),
  ItemCategory(title: 'Accessories', image: AssetImage(Assets.mouse)),
  ItemCategory(title: 'Audio', image: AssetImage(Assets.speaker)),
  ItemCategory(title: 'Laptop', image: AssetImage(Assets.laptop)),
];