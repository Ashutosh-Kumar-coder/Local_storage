import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_data/moor_test/orders.dart';
import 'package:test_data/my_home_page.dart';
import 'package:test_data/person_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ListenableProvider<PersonState>(
            create: (_) => PersonState(),
          ),
          Provider<AppDatabase>(
            create: (context) => AppDatabase(),
            dispose: (context, db) => db.close(),
          ),
        ],
        child: MyHomePage(),
      ),
    );
  }
}
