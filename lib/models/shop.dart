import 'package:flutter/material.dart';

import 'drink.dart';

class BubbleTeaShop extends ChangeNotifier{
  final List<Drink> _shop = [
    Drink(
        name: "Pearl Milk Tea", price: "4.00", ImagePath: "img/bubble-tea.png")
  ];

  final List<Drink> _userCart = [];

  List<Drink> get shop => _shop;

  List<Drink> get cart => _userCart;

  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  void removeFormcart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
