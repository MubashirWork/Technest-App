import 'package:flutter/material.dart';
import 'package:technest/presentation/screens/home/home_screen.dart';
import 'package:technest/presentation/screens/profile/profile_screen.dart';
import 'package:technest/presentation/screens/shop/shop_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  // Selected index
  int _selected = 0;

  // All screens
  final _screens = [HomeScreen(), ShopScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected,
        onTap: (value) {
          setState(() {
            _selected = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
          ),
        ],
      ),
      body: _screens[_selected],
    );
  }
}
