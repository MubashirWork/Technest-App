import 'package:flutter/material.dart';
import 'package:technest/core/constants/app_assets.dart';
import 'package:technest/data/model/item.dart';

List<Item> saleList = [
  Item(
    title: 'Headphone P9',
    image: AssetImage(Assets.headphones),
    price: 650.00,
    description:
    'Headphone P9 – Stylish wireless headphones with clear sound and comfortable fit for daily listening.',
    category: 'Audio',
  ),
  Item(
    title: 'Lenovo ThinkPad',
    image: AssetImage(Assets.laptop),
    price: 29999.00,
    description:
    'Lenovo ThinkPad – Durable laptop with powerful performance, trusted for work and business use.',
    category: "Laptop",
  ),
  Item(
    title: 'Hp Mouse Wireless',
    image: AssetImage(Assets.mouse),
    price: 1900.00,
    description:
    'HP Wireless Mouse – Smooth wireless performance with ergonomic comfort and long battery life.',
    category: "Accessories",
  ),
  Item(
    title: 'Tower Pc 6Gen Dell',
    image: AssetImage(Assets.desktop),
    price: 41000.00,
    description:
    'Dell Tower PC 6th Gen – Reliable desktop with 6th Gen Intel power, built for smooth multitasking and office work.',
    category: "Computer",
  ),
];