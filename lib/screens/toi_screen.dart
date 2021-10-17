import 'package:app_earn_money/controllers/store_controller.dart';
import 'package:app_earn_money/pages/vicuatoi_pages.dart';
import 'package:app_earn_money/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ToiScreen extends StatefulWidget {
  const ToiScreen({Key? key}) : super(key: key);

  @override
  State<ToiScreen> createState() => _ToiScreenState();
}

class _ToiScreenState extends State<ToiScreen> {
  final store = Get.put(StoreController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white30, Colors.lightGreen, Colors.black12],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const SizedBox(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/avatar1.jpg',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<StoreController>(
                          builder: (s) => s.account == null
                              ? Container(
                                  alignment: Alignment.center,
                                  height: 15,
                                  width: 100,
                                  child: const SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2, color: Colors.green)),
                                )
                              : Text("${s.account}")),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          GetBuilder<StoreController>(
                              builder: (s) => s.account == null
                                  ? Container(
                                      alignment: Alignment.center,
                                      height: 15,
                                      width: 100,
                                      child: const SizedBox(
                                          width: 15,
                                          height: 15,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.green,
                                          )),
                                    )
                                  : Text(
                                      "Mã giới thiệu: ${s.magioithieu ?? ""}")),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(
                                  ClipboardData(text: "${store.magioithieu}"));
                              Get.showSnackbar(GetBar(
                                message: "Đã copy",
                                duration: const Duration(seconds: 1),
                              ));
                            },
                            child: const Icon(
                              Icons.copy,
                              color: Colors.blue,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAll(() => const LoginScreen());
                    EasyLoading.showSuccess("Logged out");
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.power_settings_new,
                        color: Colors.red,
                      ),
                      Text(
                        "Đăng xuất",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(right: 5, left: 5, top: 5),
              decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Số dư: ",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      GetBuilder<StoreController>(
                          builder: (s) => Text("${s.sodu ?? "0"}",
                              style: const TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))),
                      const Text("VNĐ",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                      const Expanded(
                          child: SizedBox(
                        width: 5,
                      )),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const ViCuaToiPages());
                        },
                        child: const Text(
                          "Ví",
                          style: TextStyle(color: Colors.white),
                        ),
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.blue),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Khóa TK",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      Container(
                        width: 50,
                        height: 2,
                        color: Colors.greenAccent,
                      ),
                      const Text(
                        "Hạn chế",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      Container(
                        width: 50,
                        height: 2,
                        color: Colors.greenAccent,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Tốt",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 12,
                            height: 12,
                            margin: const EdgeInsets.only(right: 5, left: 5),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.greenAccent),
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 7,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 2,
                        color: Colors.blueGrey,
                      ),
                      const Text(
                        "Xuất sắc",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Container(
                width: double.infinity,
                height: 350,
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 8 / 5,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: [
                    itemNumber(
                        "Số dư khả dụng(VND)",
                        GetBuilder<StoreController>(
                            builder: (s) => Text("${s.sodu ?? "0"}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18))),
                        context),
                    itemNumber(
                        "Hoa hồng hôm nay(VND)",
                        const Text("0",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        context),
                    itemNumber(
                        "Số tiền được hoàn tiền trong ngày(VND)",
                        const Text("0",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        context),
                    itemNumber(
                        "Thu nhập của ngày hôm nay(VND)",
                        const Text("0",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        context),
                    itemNumber(
                        "Thu nhập của ngày hôm qua(VND)",
                        const Text("0",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        context),
                    itemNumber(
                        "Lợi nhuận trong tuần này(VND)",
                        const Text("0",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        context),
                    itemNumber(
                        "Thu nhập tháng(VND)",
                        const Text("0",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        context),
                    itemNumber(
                        "Thu nhập tháng trước(VND)",
                        const Text("0",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        context),
                    itemNumber(
                        "Tổng doanh thu(VND)",
                        const Text("0",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        context),
                    itemNumber(
                        "Số nhiệm vụ đã hoàn thành hôm nay (Cái)",
                        GetBuilder<StoreController>(
                            builder: (s) => Text("${s.nvhoanthanh ?? "0"}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18))),
                        context),
                    itemNumber("", const Text(""), context),
                    itemNumber(
                        "Số nhiệm vụ còn lại trong ngày (Cái)",
                        GetBuilder<StoreController>(
                            builder: (s) => Text("${s.nvconlai ?? "0"}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18))),
                        context),
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 4 / 2.5,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  children: [
                    itemMenu(Icons.featured_play_list_rounded,
                        "Thông tin nhiệm vụ", context, const LoginScreen()),
                    itemMenu(Icons.fact_check, "Nhiệm vụ đang duyệt", context,
                        const LoginScreen()),
                    itemMenu(Icons.settings_display_outlined,
                        "Phát hành nhiệm vụ", context, const LoginScreen()),
                    itemMenu(Icons.person, "Thông tin cá nhân", context,
                        const LoginScreen()),
                    itemMenu(Icons.email, "Báo cáo Doanh thu ngày", context,
                        const LoginScreen()),
                    itemMenu(Icons.monetization_on, "Biến động dòng tiền",
                        context, const LoginScreen()),
                    itemMenu(Icons.person_add_rounded, "Mời bạn bè", context,
                        const LoginScreen()),
                    itemMenu(Icons.reply_all_outlined, "Báo cáo đội", context,
                        const LoginScreen()),
                    itemMenu(Icons.help, "Hướng dẫn trợ giúp", context,
                        const LoginScreen()),
                    itemMenu(Icons.recent_actors_sharp, "Trung tâm tín dụng",
                        context, const LoginScreen()),
                    itemMenu(Icons.download_rounded, "Tải xuống ứng dụng",
                        context, const LoginScreen()),
                    itemMenu(Icons.assignment_ind_sharp, "Trợ lý công việc",
                        context, const LoginScreen()),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget itemNumber(String ten, Widget sotien, BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.blue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ten,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(padding: const EdgeInsets.only(top: 2), child: sotien)
        ],
      ),
    );
  }

  Widget itemMenu(IconData icons, String ten, BuildContext context, var page) {
    return Container(
      decoration: const BoxDecoration(color: Colors.teal),
      child: TextButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => page)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icons,
              color: Colors.white,
            ),
            Text(
              ten,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
