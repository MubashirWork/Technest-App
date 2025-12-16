import 'package:flutter/material.dart';
import 'package:technest/core/constants/app_assets.dart';
import 'package:technest/data/model/item.dart';

// All items
List<Item> itemList = [
  Item(
    title: 'Hp Mouse Wireless',
    image: AssetImage(Assets.mouse),
    price: 1900.00,
    description:
    'HP Wireless Mouse – Smooth wireless performance with ergonomic comfort and long battery life.',
    category: 'Accessories',
  ),
  Item(
    title: 'Dell P4 LCD',
    image: AssetImage(Assets.lcd),
    price: 26999.00,
    description:
    'Dell P4 LCD – Clear display with sharp visuals, reliable for everyday work and browsing.',
    category: 'Computer',
  ),
  Item(
    title: 'Lenovo ThinkPad',
    image: AssetImage(Assets.laptop),
    price: 29999.00,
    description:
    'Lenovo ThinkPad – Durable laptop with powerful performance, trusted for work and business use.',
    category: 'Laptop',
  ),
  Item(
    title: 'Tower Pc 6Gen Dell',
    image: AssetImage(Assets.desktop),
    price: 41000.00,
    description:
    'Dell Tower PC 6th Gen – Reliable desktop with 6th Gen Intel power, built for smooth multitasking and office work.',
    category: 'Computer',
  ),
  Item(
    title: 'Headphone P9',
    image: AssetImage(Assets.headphones),
    price: 650.00,
    description:
    'Headphone P9 – Stylish wireless headphones with clear sound and comfortable fit for daily listening.',
    category: 'Audio',
  ),
  Item(
    title: 'DDR 3 8GB Ram',
    image: AssetImage(Assets.ram),
    price: 2600.00,
    description:
    'DDR3 8GB RAM – Fast and reliable memory upgrade for smoother multitasking and improved PC performance.',
    category: 'Accessories',
  ),
  Item(
    title: 'Speaker MP3',
    image: AssetImage(Assets.speaker),
    price: 799.00,
    description:
    'Speaker MP3 – Portable speaker with clear sound and MP3 playback for music on the go.',
    category: 'Audio',
  ),
  Item(
    title: 'Evo Sata SSD 500GB',
    image: AssetImage(Assets.ssd),
    price: 2999.00,
    description:
    'Evo SATA SSD 500GB – High-speed storage with 500GB capacity for faster boot, load, and file transfer.',
    category: 'Accessories',
  ),
];