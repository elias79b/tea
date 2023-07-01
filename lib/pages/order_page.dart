import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea/models/drink.dart';
import 'package:tea/models/shop.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;

  OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  double sweetValue = 0.5;

  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }
  double IceValue = 0.5;

  void customizeIce(double newValue) {
    setState(() {
      IceValue = newValue;
    });
  }
  double PearlsValue = 0.5;

  void customizePearls(double newValue) {
    setState(() {
      PearlsValue = newValue;
    });
  }

  void addToCart(){
    Provider.of<BubbleTeaShop>(context,listen: false).addToCart(widget.drink);
    Navigator.pop(context);
    showDialog(context: context, builder: (context)=> AlertDialog(
      title: Text("Successfully added to cart"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink.name),
      ),
      backgroundColor: Colors.brown[200],
      body: Column(
        children: [
          Image.asset(widget.drink.ImagePath),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 100,
                        child: Text("Sweet")),
                    Expanded(
                        child: Slider(
                      value: sweetValue,
                      label: sweetValue.toString(),
                      onChanged: (value) => customizeSweet(value),
                      divisions: 4,
                    )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 100,
                        child: Text("Ice")),
                    Expanded(
                        child: Slider(
                          value: IceValue,
                          label: IceValue.toString(),
                          onChanged: (value) => customizeIce(value),
                          divisions: 4,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 100,
                        child: Text("Pearls")),
                    Expanded(
                        child: Slider(
                          value: PearlsValue,
                          label: PearlsValue.toString(),
                          onChanged: (value) => customizePearls(value),
                          divisions: 4,
                        )),
                  ],
                ),
              ],
            ),
          ),
          MaterialButton(onPressed: addToCart,
          height: 50,
          animationDuration: Duration(microseconds: 200),
          elevation: 2,

          color: Colors.brown,
          child: Text("Add to cart",style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }
}
