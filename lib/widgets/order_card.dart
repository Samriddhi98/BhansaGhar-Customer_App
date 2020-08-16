import 'package:BhansaGhar/providers/cart.dart';
import 'package:BhansaGhar/providers/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderCard extends StatelessWidget {
  // final int counter = 0;
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String image;

  OrderCard(this.id, this.productId, this.price, this.quantity, this.title,
      this.image);

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<Counter>(context);
    final cart = Provider.of<Cart>(context);
    final String total = (price * counterModel.getCounter()).toString();
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.yellow,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Are you sure?'),
                  content: Text(
                    'Do you want to remove the item from the cart?',
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                    ),
                    FlatButton(
                      child: Text('Yes'),
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                    ),
                  ],
                ));
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItems(productId);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 75.0,
                width: 45.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.yellow[700]),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        cart.increaseTotalFromCounter(price: price);
                        counterModel.incrementCounter();
                      },
                      child: Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.yellow[700],
                      ),
                    ),
                    Text(
                      counterModel.getCounter().toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        cart.decreaseTotalFromCounter(price: price,counter: counterModel.getCounter());
                        counterModel.decrementCounter();
                      },
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.yellow[700],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(37.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      offset: Offset(2.0, 2.0),
                    )
                  ],
                ),
              ),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'Rs.' '${price.toString()}',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text('Total: Rs.' '${total}'),
                  // Text('Total: RS.''${cart.perItemTotalAmount(counterModel.getCounter())}')
                ],
              ),
              Spacer(),
              InkWell(
                child: Icon(
                  Icons.cancel,
                  color: Colors.grey,
                ),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
