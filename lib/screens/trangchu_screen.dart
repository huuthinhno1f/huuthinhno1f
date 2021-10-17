import 'package:app_earn_money/controllers/index_controller.dart';
import 'package:app_earn_money/controllers/store_controller.dart';
import 'package:app_earn_money/dialog/ngonngu_dialog.dart';
import 'package:app_earn_money/widgets/nhiemvu_widget.dart';
import 'package:app_earn_money/widgets/quangcao_widget.dart';
import 'package:app_earn_money/widgets/thanhvien_widget.dart';
import 'package:app_earn_money/widgets/thongbao_widget.dart';
import 'package:app_earn_money/widgets/thuonggiavip_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TrangChuScreen extends StatefulWidget {
  const TrangChuScreen({Key? key}) : super(key: key);
  @override
  _TrangChuScreenState createState() => _TrangChuScreenState();
}

class _TrangChuScreenState extends State<TrangChuScreen>
    with SingleTickerProviderStateMixin {
  final store = Get.put(StoreController());
  late TabController _tabController;
  final indexController = Get.put(IndexController());
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    setState(() {
      store.getItem();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          height: 50,
          width: double.infinity,
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(left: 5),
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.link,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Text(
                'FOREVER',
                style: GoogleFonts.alegreya(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: () {
                        Get.dialog(const NgonNguDialog());
                      },
                      child: const Text(
                        "Ngôn ngữ",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  )),
            ],
          ),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.yellowAccent, Colors.green],
                end: Alignment.centerLeft,
                begin: Alignment.centerRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                )
              ]),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white30, Colors.lightGreen, Colors.black12],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            children: [
              const QuangCaoWidget(),
              Row(
                children: [
                  const Icon(Icons.volume_up_sharp),
                  Expanded(
                    flex: 1,
                    child: CarouselSlider(
                        items: const [
                          ThongBaoWidget(soDT: "9845", soTien: "90", vip: "2"),
                          ThongBaoWidget(soDT: "9770", soTien: "60", vip: "1"),
                          ThongBaoWidget(soDT: "8741", soTien: "30", vip: "1"),
                          ThongBaoWidget(soDT: "2541", soTien: "90", vip: "2"),
                          ThongBaoWidget(soDT: "5412", soTien: "100", vip: "2"),
                          ThongBaoWidget(soDT: "8974", soTien: "120", vip: "2"),
                          ThongBaoWidget(soDT: "6541", soTien: "210", vip: "3"),
                          ThongBaoWidget(soDT: "8745", soTien: "300", vip: "4"),
                        ],
                        options: CarouselOptions(
                          height: 50,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 2000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          // onPageChanged: callbackFunction,
                          scrollDirection: Axis.vertical,
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Image.asset("assets/moiban.PNG"),
              const SizedBox(height: 10),
              const Text(
                'Khu vực nhiệm vụ',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                height: 55,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 4 / 1,
                  children: [
                    NhiemVuWidget(
                      title: "Youtube",
                      img: "assets/youtube.png",
                      onPressed: () {
                        setState(() {
                          indexController.onItemTapped(1);
                          indexController.onItemTabbar(0);
                        });
                      },
                    ),
                    NhiemVuWidget(
                      title: "Tiktok",
                      img: "assets/tiktok.png",
                      onPressed: () {
                        indexController.onItemTapped(1);
                        indexController.onItemTabbar(1);
                      },
                    )
                  ],
                ),
              ),
              const Text(
                'Công bố nhiệm vụ',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                height: 55,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 1,
                  children: [
                    NhiemVuWidget(
                      title: "Youtube",
                      img: "assets/youtube.png",
                      onPressed: () {
                        print("y");
                      },
                    ),
                    NhiemVuWidget(
                      title: "Tiktok",
                      img: "assets/tiktok.png",
                      onPressed: () {
                        print("t");
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TabBar(
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  //indicator: Decoration,
                  tabs: [
                    Tab(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.wallet_membership,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Danh sách thành viên",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.track_changes,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Danh sách thương gia",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
              SizedBox(
                height: 80,
                width: double.infinity,
                child: TabBarView(
                  children: [
                    CarouselSlider(
                        items: const [
                          ThanhVienWidget(
                              soTien: "210",
                              img: "assets/avatar1.jpg",
                              sdt: "3648",
                              soNV: "30"),
                          ThanhVienWidget(
                              soTien: "418",
                              img: "assets/avatar2.jpg",
                              sdt: "8715",
                              soNV: "35"),
                          ThanhVienWidget(
                              soTien: "230",
                              img: "assets/avatar3.jpg",
                              sdt: "1654",
                              soNV: "30"),
                          ThanhVienWidget(
                              soTien: "360",
                              img: "assets/avatar2.jpg",
                              sdt: "6541",
                              soNV: "31"),
                          ThanhVienWidget(
                              soTien: "590",
                              img: "assets/avatar1.jpg",
                              sdt: "6441",
                              soNV: "60"),
                          ThanhVienWidget(
                              soTien: "260",
                              img: "assets/avatar3.jpg",
                              sdt: "2451",
                              soNV: "40"),
                        ],
                        options: CarouselOptions(
                          height: 50,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 2000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          // onPageChanged: callbackFunction,
                          scrollDirection: Axis.vertical,
                        )),
                    CarouselSlider(
                        items: const [
                          ThuongGiaVipWidget(
                              img: "assets/avatar1.jpg",
                              sdt: "3650",
                              vip: "ĐỒNG"),
                          ThuongGiaVipWidget(
                              img: "assets/avatar2.jpg",
                              sdt: "8715",
                              vip: "VÀNG"),
                          ThuongGiaVipWidget(
                              img: "assets/avatar3.jpg",
                              sdt: "6541",
                              vip: "BẠC"),
                          ThuongGiaVipWidget(
                              img: "assets/avatar1.jpg",
                              sdt: "1654",
                              vip: "BẠCH KIM"),
                          ThuongGiaVipWidget(
                              img: "assets/avatar1.jpg",
                              sdt: "6441",
                              vip: "BẠCH KIM"),
                          ThuongGiaVipWidget(
                              img: "assets/avatar1.jpg",
                              sdt: "2451",
                              vip: "ĐỒNG"),
                          ThuongGiaVipWidget(
                              img: "assets/avatar1.jpg",
                              sdt: "8451",
                              vip: "BẠC"),
                          ThuongGiaVipWidget(
                              img: "assets/avatar1.jpg",
                              sdt: "6545",
                              vip: "ĐỒNG"),
                          ThuongGiaVipWidget(
                              img: "assets/avatar1.jpg",
                              sdt: "9746",
                              vip: "ĐỒNG"),
                        ],
                        options: CarouselOptions(
                          height: 50,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 2000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          // onPageChanged: callbackFunction,
                          scrollDirection: Axis.vertical,
                        )),
                  ],
                  controller: _tabController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
