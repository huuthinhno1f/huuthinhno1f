import 'dart:math';

import 'package:app_earn_money/models/user_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StoreController extends GetxController {
  final CollectionReference _user =
      FirebaseFirestore.instance.collection('User');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future<void> sendItem() async {
    UserModels userModels = UserModels(
        sodu: 0,
        sonhiemvu: 0,
        sotaikhoan: "",
        tennganhang: "",
        tenthat: "",
        id: _auth.currentUser!.uid,
        vip: 0,
        magioithieu: getRandomString(10),
        nvconlai: 10,
        nvhoanthanh: 0,
        account: "${_auth.currentUser!.email}");
    _user.add(userModels.toJson());
  }

  var magioithieu, account, sodu, nvhoanthanh, nvconlai, vip;
  var formatter = NumberFormat('#,###');

  Future<void> getItem() async {
    QuerySnapshot querySnapshot =
        await _user.where("id", isEqualTo: _auth.currentUser!.uid).get();
    for (var doc in querySnapshot.docs) {
      magioithieu = doc["magioithieu"];
      account = doc["account"];
      sodu = formatter.format(RxInt(doc["sodu"]).toInt());
      nvhoanthanh = doc["nvhoanthanh"];
      nvconlai = doc["nvconlai"];
      vip = doc["vip"];
      print(doc["nvconlai"]);
      // update();
    }
    update();
  }

  final _number = '1234567890';
  final Random _random = Random();

  String getRandomNumber(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _number.codeUnitAt(_random.nextInt(_number.length))));

//////////////////////////////////////////////
  Future<void> nhanNV() async {
    QuerySnapshot querySnapshot =
        await _user.where("id", isEqualTo: _auth.currentUser!.uid).get();
    for (var doc in querySnapshot.docs) {
      _user.doc(doc.reference.id).update({"nvconlai": nvconlai - 1});
    }
    update();
  }
}
