import 'package:app_earn_money/pages/naptien_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NangCapVipDialog extends StatelessWidget {
  final String sotien, capvip;
  final Color color;
  const NangCapVipDialog(
      {Key? key,
      required this.sotien,
      required this.capvip,
      required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurpleAccent,
      title: Text(
        "Lời nhắc nhở",
        textAlign: TextAlign.center,
        style:
            TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 25),
      ),
      content: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: SizedBox(
          width: double.infinity,
          height: 140,
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  const TextSpan(
                      text: "Xác định tốn phí ",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  TextSpan(
                      text: sotien,
                      style: TextStyle(
                          color: color,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const TextSpan(
                      text: "VNĐ ",
                      style: TextStyle(color: Colors.black, fontSize: 12)),
                  const TextSpan(
                      text: "để nâng cấp bậc ",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  TextSpan(
                      text: capvip,
                      style: TextStyle(
                          color: color,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const TextSpan(
                      text: " hay không ?",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 120,
                    color: Colors.black45,
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "Hủy bỏ",
                        style: TextStyle(color: Colors.white70, fontSize: 20),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 120,
                    color: Colors.blue,
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => const NapTienPages());
                      },
                      child: const Text(
                        "Tham gia",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
