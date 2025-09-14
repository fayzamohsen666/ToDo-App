import 'package:flutter/material.dart';

class SpecialButton extends StatelessWidget {
  final String text;
  final int color;
  final void Function() onPressed;

  const SpecialButton({
    super.key,
    required this.text,
    this.color = 0xff380565,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 170,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontFamily: "Jost",
          ),
        ),
      ),
    );
  }
}
