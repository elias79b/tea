import 'package:flutter/material.dart';
import 'package:tea/components/bottom_nav_bar.dart';
import 'package:tea/pages/cart_page.dart';
import 'package:tea/pages/shop_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int _selectedIndex = 0;
  void navigateBottomBar(int NewIndex){
    setState(() {
      _selectedIndex =NewIndex;
    });
  }
  final List<Widget> _pages = [
    ShopPage(),
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.brown[200],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index)=> navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
