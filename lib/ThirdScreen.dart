import 'package:flutter/material.dart';
import 'AppBar.dart';
import 'SpecialButton.dart';
import 'TextBox.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});
  static const String routeName = '/third_screen';
  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: "Edit Task"),
      body: Column(
        children: [
          Textbox(text: "Title", controller: titleController),
          Textbox(text: "Detail", controller: detailController),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SpecialButton(
                  text: "Update",
                  onPressed: () {
                    Navigator.pop(context, {
                      "title": titleController.text,
                      "detail": detailController.text,
                    });
                  },
                ),
                SpecialButton(
                  text: "Cancel",
                  color: 0xff9395D3,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
