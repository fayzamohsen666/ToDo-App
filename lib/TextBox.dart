import 'package:flutter/material.dart';

class Textbox extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const Textbox({super.key, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            color: Color(0xff8B8787),
            fontSize: 14,
            fontWeight: FontWeight.w100,
            fontFamily: "Jost",
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff8B8787)),
          ),
        ),
      ),
    );
  }
}
