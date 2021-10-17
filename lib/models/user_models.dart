// To parse this JSON data, do
//
//     final userModels = userModelsFromJson(jsonString);

import 'dart:convert';

UserModels userModelsFromJson(String str) =>
    UserModels.fromJson(json.decode(str));

String userModelsToJson(UserModels data) => json.encode(data.toJson());

class UserModels {
  UserModels({
    required this.id,
    required this.vip,
    required this.magioithieu,
    required this.account,
    required this.sodu,
    required this.tennganhang,
    required this.sotaikhoan,
    required this.tenthat,
    required this.sonhiemvu,
    required this.nvhoanthanh,
    required this.nvconlai,
  });

  String id;
  int vip;
  String magioithieu;
  String account;
  int sodu;
  String tennganhang;
  String sotaikhoan;
  String tenthat;
  int sonhiemvu;
  int nvhoanthanh;
  int nvconlai;

  factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
        id: json["id"],
        vip: json["vip"],
        magioithieu: json["magioithieu"],
        account: json["account"],
        sodu: json["sodu"],
        tennganhang: json["tennganhang"],
        sotaikhoan: json["sotaikhoan"],
        tenthat: json["tenthat"],
        sonhiemvu: json["sonhiemvu"],
        nvhoanthanh: json["nvhoanthanh"],
        nvconlai: json["nvconlai"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vip": vip,
        "magioithieu": magioithieu,
        "account": account,
        "sodu": sodu,
        "tennganhang": tennganhang,
        "sotaikhoan": sotaikhoan,
        "tenthat": tenthat,
        "sonhiemvu": sonhiemvu,
        "nvhoanthanh": nvhoanthanh,
        "nvconlai": nvconlai,
      };
}
