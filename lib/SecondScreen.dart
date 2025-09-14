import 'package:flutter/material.dart';
import 'AppBar.dart';
import 'TextBox.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});
  static const String routeName = '/second_screen';
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: MyAppBar(title: "Add Task"),

      body: Column(
        children: [
          Textbox(text: "Title", controller: titleController),
          Textbox(text: "Detail", controller: detailController),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
            child: SizedBox(
              height: 65,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, {
                    "title": titleController.text,
                    "detail": detailController.text,
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff380565),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "ADD",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
