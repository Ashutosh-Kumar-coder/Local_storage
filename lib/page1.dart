import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_data/person_state.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    print("PAge 1");
    return Consumer<PersonState>(
      builder: (context, value, child) {
        return Column(
          children: [
            TextButton(onPressed: (){
              value.doSomeThing();
            }, child: Text("Check")),
            Container(
              child: Text("${value.data}"),
            ),
          ],
        );
      },
    );
  }
}
