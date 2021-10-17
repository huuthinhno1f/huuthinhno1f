import 'package:app_earn_money/controllers/store_controller.dart';
import 'package:app_earn_money/dialog/nangcapnhiemvu_dialog.dart';
import 'package:app_earn_money/models/itemnhiemvu_models.dart';
import 'package:app_earn_money/pages/bangnhiemvu_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NhiemVuYoutubeWidget extends StatefulWidget {
  const NhiemVuYoutubeWidget({Key? key}) : super(key: key);

  @override
  State<NhiemVuYoutubeWidget> createState() => _NhiemVuYoutubeWidgetState();
}

class _NhiemVuYoutubeWidgetState extends State<NhiemVuYoutubeWidget> {
  final store = Get.put(StoreController());
  String capvip = "";
  @override
  void initState() {
    print("vip hiện tại ${RxInt(store.vip)}");

    if (store.vip == 0) {
      capvip = "PHỔ THÔNG";
    }
    if (store.vip == 1) {
      capvip = "ĐỒNG";
    }
    if (store.vip == 2) {
      capvip = "BẠC";
    }
    if (store.vip == 3) {
      capvip = "VÀNG";
    }
    if (store.vip == 4) {
      capvip = "BẠCH KIM";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        itemNhiemVu(Colors.blue, Colors.white, "PHỔ THÔNG", "10", onTap: () {
          if (store.vip >= 0) {
            Get.to(() => const BangNhiemVuPages(
                lever: "PHỔ THÔNG",
                price: "1500",
                color: Colors.blue,
                name: "Youtube",
                image: "assets/youtube.png"));
          } else {
            Get.dialog(NangCapNhiemVuDialog(
              capbachientai: capvip,
              capvip: "PHỔ THÔNG",
              color: Colors.blue,
            ));
          }
        }),
        itemNhiemVu(Colors.orangeAccent, Colors.orangeAccent, "ĐỒNG", "20",
            onTap: () {
          if (store.vip >= 1) {
            Get.to(() => const BangNhiemVuPages(
                  lever: "ĐỒNG",
                  price: "3000",
                  color: Colors.orangeAccent,
                  name: "Youtube",
                  image: "assets/youtube.png",
                ));
          } else {
            Get.dialog(NangCapNhiemVuDialog(
              capbachientai: capvip,
              capvip: "ĐỒNG",
              color: Colors.orangeAccent,
            ));
          }
        }),
        itemNhiemVu(Colors.grey, Colors.white54, "BẠC", "25", onTap: () {
          if (store.vip >= 2) {
            Get.to(() => const BangNhiemVuPages(
                  lever: "BẠC",
                  price: "4000",
                  color: Colors.grey,
                  name: "Youtube",
                  image: "assets/youtube.png",
                ));
          } else {
            Get.dialog(NangCapNhiemVuDialog(
              capbachientai: capvip,
              capvip: "BẠC",
              color: Colors.grey,
            ));
          }
        }),
        itemNhiemVu(Colors.yellowAccent, Colors.yellowAccent, "VÀNG", "35",
            onTap: () {
          if (store.vip >= 3) {
            Get.to(() => const BangNhiemVuPages(
                  lever: "VÀNG",
                  price: "4800",
                  color: Colors.yellowAccent,
                  name: "Youtube",
                  image: "assets/youtube.png",
                ));
          } else {
            Get.dialog(NangCapNhiemVuDialog(
              capbachientai: capvip,
              capvip: "VÀNG",
              color: Colors.yellowAccent,
            ));
          }
        }),
        itemNhiemVu(Colors.greenAccent, Colors.greenAccent, "BẠCH KIM", "45",
            onTap: () {
          if (store.vip >= 4) {
            Get.to(() => const BangNhiemVuPages(
                  lever: "BẠCH KIM",
                  price: "8500",
                  color: Colors.greenAccent,
                  name: "Youtube",
                  image: "assets/youtube.png",
                ));
          } else {
            Get.dialog(NangCapNhiemVuDialog(
              capbachientai: capvip,
              capvip: "BẠCH KIM",
              color: Colors.greenAccent,
            ));
          }
        }),
      ],
    );
  }
}
