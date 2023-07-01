import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea/components/drink_tile.dart';
import 'package:tea/models/drink.dart';
import 'package:tea/models/shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Drink drink){
    Provider.of<BubbleTeaShop>(context,listen: false).removeFormcart(drink);

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
        builder: (context, value, child) =>
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Text(
                      "Your Cart",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                        child: ListView.builder(
                          itemCount: value.cart.length,
                            itemBuilder: (context, index) {
                              Drink drink = value.cart[index];
                              return DrinkTile(drink: drink,
                                  onTap:()=>removeFromCart(drink),
                                  trailing: Icon(Icons.delete));
                            })),
                    MaterialButton(onPressed: (){},
                    child: Text("PAY",style: TextStyle(color: Colors.white),),
                      color: Colors.brown,
                    )
                  ],
                ),
              ),
            ));
  }
}
