import 'dart:async';

import 'package:flutter/cupertino.dart';


class PersonState extends ChangeNotifier {
  String data = "data";

  Future<void> doSomeThing()async{
    await Future.delayed(Duration(seconds: 4),(){
      data="Ashutosh";
    });
    await Future.delayed(Duration(seconds: 8),(){
      data="Patel";
    });
    notifyListeners();
  }
}
