import 'package:app_earn_money/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class BangNhiemVuPages extends StatefulWidget {
  final String lever, price, name, image;
  final Color color;
  const BangNhiemVuPages(
      {Key? key,
      required this.lever,
      required this.price,
      required this.color,
      required this.name,
      required this.image})
      : super(key: key);
  @override
  _BangNhiemVuPagesState createState() => _BangNhiemVuPagesState();
}

class _BangNhiemVuPagesState extends State<BangNhiemVuPages> {
  bool selectButton = false;
  int indexnumber = 0;
  List<bool> listbool = List.generate(50, (index) => false);
  final store = Get.put(StoreController());
  List<String> listSDT = [];
  List<String> listCondu = [];
  Future<void> resetNv(int index) async {
    await store.nhanNV();
    store.getItem();
    setState(() {
      listbool[index] = true;
    });
  }

  @override
  void initState() {
    listSDT = List.generate(50, (index) => store.getRandomNumber(4));
    listCondu = List.generate(50, (index) => store.getRandomNumber(3));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Bảng nhiệm vụ"),
          backgroundColor: Colors.lightGreen,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
              store.getItem();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 600,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white30, Colors.lightGreen, Colors.black12],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: ListView.builder(
              itemCount: listbool.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(top: 5),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black45))),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(widget.name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 5,
                          ),
                          Image.asset(widget.image),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.lever,
                            style: TextStyle(
                                backgroundColor: widget.color,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Bên có nhu cầu ****${listSDT[index]}"),
                            const SizedBox(
                              height: 5,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              const TextSpan(
                                  text: "Còn dư: ",
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: "2${listCondu[index]}",
                                  style: const TextStyle(
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold))
                            ])),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("Yêu cầu Like và Follow")
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Trả",
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 22,
                              )),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(
                                text: "VND",
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 12)),
                            TextSpan(
                                text: widget.price,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold))
                          ])),
                          TextButton(
                              onPressed: () {
                                if (store.nvconlai <= 0) {
                                  setState(() {
                                    Fluttertoast.showToast(
                                        msg: "Hôm nay đã hết lượt",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        backgroundColor: Colors.blue,
                                        timeInSecForIosWeb: 1);
                                  });
                                } else {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => RegisterScreen(),
                                  //     ));
                                  Fluttertoast.showToast(
                                      msg: "Đã nhận",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.blue,
                                      timeInSecForIosWeb: 1);

                                  resetNv(index);
                                }
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: listbool[index]
                                      ? Colors.black45
                                      : Colors.blue),
                              child: const Text(
                                "Nhận",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
