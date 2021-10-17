import 'package:app_earn_money/dialog/nangcapvip_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VipWidget extends StatelessWidget {
  const VipWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        itemVip(
            Colors.blue, Colors.white, "PHỔ THÔNG", "1.500", "0.00", "450.000",
            onTap: () {
          print("Thịnh");
        }),
        itemVip(Colors.orangeAccent, Colors.orangeAccent, "ĐỒNG", "3.000",
            "350.000", "1.800.000",
            onTap: () => Get.dialog(NangCapVipDialog(
                sotien: "350.000", capvip: "ĐỒNG", color: Colors.orange))),
        itemVip(Colors.grey, Colors.white54, "BẠC", "4.000", "1.400.000",
            "3.000.000",
            onTap: () => Get.dialog(NangCapVipDialog(
                sotien: "1.400.000", capvip: "BẠC", color: Colors.white))),
        itemVip(Colors.yellowAccent, Colors.yellowAccent, "VÀNG", "4.800",
            "2.900.000", "5.080.000",
            onTap: () => Get.dialog(NangCapVipDialog(
                sotien: "2.900.000",
                capvip: "VÀNG",
                color: Colors.yellowAccent))),
        itemVip(Colors.greenAccent, Colors.greenAccent, "BẠCH KIM", "8.500",
            "5.900.000", "11.475.000",
            onTap: () => Get.dialog(NangCapVipDialog(
                sotien: "5.900.000",
                capvip: "BẠCH KIM",
                color: Colors.greenAccent))),
      ],
    );
  }
}

Widget itemVip(Color start, Color colorName, String name, String number,
    String money, String moneyMonth,
    {VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 20,
                    color: colorName,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "$money VNĐ",
                style: const TextStyle(color: Colors.yellowAccent),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Đơn giá 1 nhiệm vụ: $number VNĐ",
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Doanh thu tháng: $moneyMonth VNĐ",
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    ),
  );
}
