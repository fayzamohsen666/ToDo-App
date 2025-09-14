import 'package:flutter/material.dart';
import 'AppBar.dart';
import 'SpecialContainer.dart';

List<SpecialContainer> completeContainers = [];

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});
  static const String routeName = '/forth_screen';
  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD8D6F2),

      appBar: MyAppBar(title: "Completed Task"),

      body: ListView(children: completeContainers),
    );
  }
}
