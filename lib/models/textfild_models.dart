import 'package:flutter/material.dart';

class TextfildModels extends StatelessWidget {
  final String hint;
  final IconData icon, iconHide;
  final bool isPassword;
  final controller;
  final VoidCallback onPressed;
  final Color colors;

  const TextfildModels(
      {required this.hint,
      required this.icon,
      this.isPassword = false,
      this.controller,
      required this.iconHide,
      required this.onPressed,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
          ]),
      child: TextField(
        cursorColor: Colors.green,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black38),
          suffixIcon: IconButton(
              onPressed: onPressed,
              icon: Icon(
                iconHide,
                color: colors,
              )),
          prefixIcon: Icon(
            icon,
            color: Colors.green,
          ),
          contentPadding: const EdgeInsets.all(15),
        ),
      ),
    );
  }
}
