import 'package:app_earn_money/pages/naptien_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NangCapNhiemVuDialog extends StatelessWidget {
  final String capbachientai, capvip;
  final Color color;
  const NangCapNhiemVuDialog(
      {Key? key,
      required this.capbachientai,
      required this.capvip,
      required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      title: const Text(
        "Lời nhắc nhở",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 25),
      ),
      content: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: SizedBox(
          width: double.infinity,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  const TextSpan(
                      text:
                          "Cấp bậc hiện tại của bạn chỉ có thể nhận nhiệm vụ cấp bậc ",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  TextSpan(
                      text: capbachientai,
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const TextSpan(
                      text: "\nBạn có muốn tham gia cấp ",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  TextSpan(
                      text: "$capvip ",
                      style: TextStyle(
                          color: color,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const TextSpan(
                      text: "hay không ?",
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
