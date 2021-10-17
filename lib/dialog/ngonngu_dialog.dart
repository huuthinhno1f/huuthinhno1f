import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NgonNguDialog extends StatelessWidget {
  const NgonNguDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Chọn ngôn ngữ",
        style: TextStyle(color: Colors.blue),
      ),
      content: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Row(
          children: [
            Image.asset(
              'assets/vn.png',
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Việt Nam",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
