import 'package:flutter/material.dart';

Widget itemNhiemVu(Color start, Color colorName, String name, String number,
    {VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: colorName,
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 5),
            )
          ],
          gradient: LinearGradient(
              colors: [start, Colors.black26],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
                fontSize: 18, color: colorName, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Nhiệm vụ mỗi ngày: $number lần",
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    ),
  );
}
