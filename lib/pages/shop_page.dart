import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea/components/drink_tile.dart';
import 'package:tea/models/drink.dart';
import 'package:tea/models/shop.dart';
import 'package:tea/pages/order_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void goToOrderPage(Drink drink) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderPage(
                  drink: drink,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
        builder: (context, value, child) => SafeArea(
                child: Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Text(
                    "Bubble tea Shop",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                      child: ListView.builder(
                          itemCount: value.shop.length,
                          itemBuilder: (context, index) {
                            Drink individuaDrink = value.shop[index];

                            return DrinkTile(
                              drink: individuaDrink,
                              onTap: () => goToOrderPage(individuaDrink),
                              trailing: Icon(Icons.arrow_forward),
                            );
                          }))
                ],
              ),
            )));
  }
}
