import 'package:app_earn_money/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'naptien_pages.dart';

class ViCuaToiPages extends StatefulWidget {
  const ViCuaToiPages({Key? key}) : super(key: key);
  @override
  _ViCuaToiPagesState createState() => _ViCuaToiPagesState();
}

class _ViCuaToiPagesState extends State<ViCuaToiPages>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  final store = Get.put(StoreController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ví của tôi"),
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
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  store.sodu,
                  style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const Text(
                  "VND",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => const NapTienPages());
                    },
                    child: const Text(
                      "NẠP TIỀN",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shadowColor: Colors.indigo,
                        elevation: 5),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "RÚT TIỀN",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shadowColor: Colors.indigo,
                        elevation: 5),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            TabBar(
              tabs: const [
                Tab(
                  text: "Hồ sơ nạp tiền",
                ),
                Tab(
                  text: "Hồ sơ rút tiền",
                )
              ],
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.black,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.blue, width: 2),
                insets: EdgeInsets.only(left: 80, right: 80, bottom: 5),
              ),
              unselectedLabelColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
