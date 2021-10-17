import 'package:flutter/material.dart';

class DoanhThuScreen extends StatelessWidget {
  const DoanhThuScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Image.asset(
      "assets/gioithieu.jpg",
    ));
  }
}
