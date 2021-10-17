import 'package:app_earn_money/controllers/index_controller.dart';
import 'package:app_earn_money/widgets/nhiemvutiktok_widget.dart';
import 'package:app_earn_money/widgets/nhiemvuyoutube_widget.dart';
import 'package:app_earn_money/widgets/quangcao_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NhiemVuScreen extends StatefulWidget {
  const NhiemVuScreen({Key? key}) : super(key: key);

  @override
  State<NhiemVuScreen> createState() => _NhiemVuScreenState();
}

class _NhiemVuScreenState extends State<NhiemVuScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final indexController = Get.put(IndexController());
  @override
  void initState() {
    tabController = TabController(
        length: 2,
        vsync: this,
        initialIndex: indexController.selectedIndexTabbar.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white30, Colors.lightGreen, Colors.black12],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          children: [
            const QuangCaoWidget(),
            TabBar(
              tabs: const [
                Tab(
                  text: "Youtube",
                ),
                Tab(
                  text: "Tiktok",
                )
              ],
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.black,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              indicatorColor: Colors.black,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.black, width: 3),
                insets: EdgeInsets.only(left: 80, right: 80, bottom: 5),
              ),
              unselectedLabelColor: Colors.white,
            ),
            SizedBox(
              height: 380,
              width: double.infinity,
              child: TabBarView(
                children: const [NhiemVuYoutubeWidget(), NhiemVuTikTokWidget()],
                controller: tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
