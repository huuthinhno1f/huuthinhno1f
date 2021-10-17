import 'package:flutter/material.dart';

class ButtonModels extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ButtonModels({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(title,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 20,
          )),
      style: TextButton.styleFrom(
          primary: Colors.white,
          shadowColor: Colors.black,
          elevation: 10,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      onPressed: onPressed,
    );
  }
}
