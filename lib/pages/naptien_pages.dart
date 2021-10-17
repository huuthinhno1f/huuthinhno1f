import 'package:app_earn_money/controllers/store_controller.dart';
import 'package:app_earn_money/pages/giaodichnaptien_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NapTienPages extends StatelessWidget {
  const NapTienPages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = Get.put(StoreController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nạp tiền"),
          backgroundColor: Colors.lightGreen,
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          height: 600,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white30, Colors.lightGreen, Colors.black12],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 20, height: 1, color: Colors.black),
                  const Text("Số dư khả dụng", style: TextStyle(fontSize: 12)),
                  Text(
                    "VND${store.sodu}",
                    style: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  const Text(", vui lòng chọn phương thức nạp tiền",
                      style: TextStyle(fontSize: 12)),
                  Container(width: 20, height: 1, color: Colors.black),
                ],
              ),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    Get.to(() => const ThanhToanNapTienPages());
                  },
                  child: itembank("VIETCOMBANK")),
            ],
          ),
        ));
  }

  Widget itembank(String name) {
    return Row(
      children: [
        const SizedBox(width: 5),
        Image.asset(
          "assets/iconvietcombank.png",
          width: 30,
          height: 30,
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 16)),
              const Text(
                "Số tiền tối thiểu VND350.000, tối đa là VND50.000.000",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
        const Icon(Icons.navigate_next)
      ],
    );
  }
}
