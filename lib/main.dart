import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'SecondScreen.dart';
import 'ThirdScreen.dart';
import 'FourthScreen.dart';

void main() {
  runApp(const ToDoList());
}

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SecondScreen.routeName: (_) => SecondScreen(),
        ThirdScreen.routeName: (_) => ThirdScreen(),
        FourthScreen.routeName: (_) => FourthScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
