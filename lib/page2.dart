import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';
import 'package:test_data/moor_test/orders.dart';

class Page2 extends StatefulWidget {


  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  var productNameController = TextEditingController();
  var priceController = TextEditingController();
  late AppDatabase database;

  getDatabase() async {
    database = Provider.of<AppDatabase>(context, listen: false);
  }

  @override
  void initState() {
    // TODO: implement initState
    getDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("page2");
    return Scaffold(
      body: Container(
        height: 200,

        child: ListView(
          children:[
            TextField(
              decoration: InputDecoration(hintText: 'Product Name'),
              keyboardType: TextInputType.text,
              controller: productNameController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Product Price'),
              keyboardType: TextInputType.number,
              controller: priceController,
            ),
            RaisedButton(
              onPressed: () async {
                database.insertNewOrder(Order(
                    device_id: productNameController.text,
                    id: int.parse(priceController.text)));
              },
              color: Colors.green,
              child: Text("Place Order"),
            ),
          ]
        ),
      ),
    );
  }
}


// TextField(
// decoration: InputDecoration(hintText: 'Product Name'),
// keyboardType: TextInputType.text,
// controller: productNameController,
// ),
// TextField(
// decoration: InputDecoration(hintText: 'Product Price'),
// keyboardType: TextInputType.number,
// controller: priceController,
// ),
// RaisedButton(
// onPressed: () async {
// database.insertNewOrder(Order(
// device_id: productNameController.text,
// id: int.parse(priceController.text)));
// },
// color: Colors.green,
// child: Text("Place Order"),
// ),