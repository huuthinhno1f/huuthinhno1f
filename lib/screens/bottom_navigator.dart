import 'package:app_earn_money/controllers/index_controller.dart';
import 'package:app_earn_money/screens/nhiemvu_screen.dart';
import 'package:app_earn_money/screens/toi_screen.dart';
import 'package:app_earn_money/screens/trangchu_screen.dart';
import 'package:app_earn_money/screens/vip_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

import 'doanhthu_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final authController = Get.put(IndexController());
  static const List<Widget> _widgetOptions = <Widget>[
    TrangChuScreen(),
    NhiemVuScreen(),
    VipScreen(),
    DoanhThuScreen(),
    ToiScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
          child: Obx(() => Scaffold(
                body: _widgetOptions
                    .elementAt(authController.selectedIndex.value),
                bottomNavigationBar: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white30, Colors.black12],
                      end: Alignment.centerLeft,
                      begin: Alignment.centerRight,
                    ),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    type: BottomNavigationBarType.fixed,
                    elevation: 0,
                    unselectedItemColor: Colors.black54,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Trang chủ',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.event_available),
                        label: 'Nhiệm vụ',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(FeatherIcons.star),
                        label: 'VIP',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.monetization_on),
                        label: 'Doanh thu',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Tôi',
                      ),
                    ],
                    currentIndex: authController.selectedIndex.value,
                    selectedItemColor: Colors.blue,
                    selectedLabelStyle:
                        const TextStyle(fontWeight: FontWeight.bold),
                    onTap: (value) {
                      setState(() {
                        authController.onItemTapped(value);
                      });
                    },
                  ),
                ),
                floatingActionButton: GestureDetector(
                  onTap: () {
                    setState(() {
                      authController.onItemTapped(3);
                    });
                  },
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.lightBlueAccent),
                          child: const Icon(
                            Icons.support_agent,
                            size: 40,
                            color: Colors.black54,
                          ),
                        ),
                        const Text(
                          "Chăm sóc khách hàng",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ))),
    );
  }
}
