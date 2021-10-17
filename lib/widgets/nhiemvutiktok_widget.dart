import 'package:app_earn_money/models/itemnhiemvu_models.dart';
import 'package:app_earn_money/pages/bangnhiemvu_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NhiemVuTikTokWidget extends StatelessWidget {
  const NhiemVuTikTokWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        itemNhiemVu(Colors.blue, Colors.white, "PHỔ THÔNG", "10",
            onTap: () => Get.to(() => const BangNhiemVuPages(
                  lever: "PHỔ THÔNG",
                  price: "1500",
                  color: Colors.blue,
                  name: "TikTok",
                  image: "assets/tiktok.png",
                ))),
        itemNhiemVu(Colors.orangeAccent, Colors.orangeAccent, "ĐỒNG", "20",
            onTap: () => Get.to(() => const BangNhiemVuPages(
                  lever: "ĐỒNG",
                  price: "3000",
                  color: Colors.orangeAccent,
                  name: "TikTok",
                  image: "assets/tiktok.png",
                ))),
        itemNhiemVu(Colors.grey, Colors.white54, "BẠC", "25",
            onTap: () => Get.to(() => const BangNhiemVuPages(
                  lever: "BẠC",
                  price: "4000",
                  color: Colors.grey,
                  name: "TikTok",
                  image: "assets/tiktok.png",
                ))),
        itemNhiemVu(Colors.yellowAccent, Colors.yellowAccent, "VÀNG", "35",
            onTap: () => Get.to(() => const BangNhiemVuPages(
                  lever: "VÀNG",
                  price: "4800",
                  color: Colors.yellowAccent,
                  name: "TikTok",
                  image: "assets/tiktok.png",
                ))),
        itemNhiemVu(Colors.greenAccent, Colors.greenAccent, "BẠCH KIM", "45",
            onTap: () => Get.to(() => const BangNhiemVuPages(
                  lever: "BẠCH KIM",
                  price: "8500",
                  color: Colors.greenAccent,
                  name: "TikTok",
                  image: "assets/tiktok.png",
                ))),
      ],
    );
  }
}
