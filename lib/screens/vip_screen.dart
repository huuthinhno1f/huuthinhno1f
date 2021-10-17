import 'package:app_earn_money/widgets/quangcao_widget.dart';
import 'package:app_earn_money/widgets/vip_widget.dart';
import 'package:flutter/material.dart';

class VipScreen extends StatefulWidget {
  const VipScreen({Key? key}) : super(key: key);
  @override
  _VipScreenState createState() => _VipScreenState();
}

class _VipScreenState extends State<VipScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 820,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white30, Colors.lightGreen, Colors.black12],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          children: [
            const QuangCaoWidget(),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              padding: const EdgeInsets.only(left: 5, right: 5),
              height: 80,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(
                      colors: [Colors.blue, Colors.black26],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Cấp độ hiện tại: PHỔ THÔNG",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Nhiệm vụ mỗi ngày: 10 lần",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Column(
                        children: const [
                          Text("Thời gian có hiệu lực",
                              style: TextStyle(color: Colors.white)),
                          Text("Hiệu lực vĩnh viễn",
                              style: TextStyle(color: Colors.white))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const VipWidget(),
          ],
        ),
      ),
    );
  }
}
