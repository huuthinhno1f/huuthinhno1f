import 'package:app_earn_money/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThanhToanNapTienPages extends StatefulWidget {
  const ThanhToanNapTienPages({Key? key}) : super(key: key);

  @override
  State<ThanhToanNapTienPages> createState() => _ThanhToanNapTienPagesState();
}

class _ThanhToanNapTienPagesState extends State<ThanhToanNapTienPages> {
  List<String> list = ["500.000", "1.500.000", "4.000.000"];
  List<bool> listColor = [true, true, true];

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
                Row(
                  children: [
                    const Text(
                      "Số tiền thường dùng",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 20,
                        child: ListView.builder(
                          itemCount: listColor.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  listColor[index] = !listColor[index];
                                  print(listColor);
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: listColor[index]
                                        ? Colors.white
                                        : Colors.blue),
                                child: Text(
                                  list[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: listColor[index]
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }

  Widget soTien(String sotien) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black), color: Colors.white),
      child: Text(
        sotien,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
