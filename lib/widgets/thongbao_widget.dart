import 'package:flutter/material.dart';

class ThongBaoWidget extends StatelessWidget {
  final String soDT, vip, soTien;
  const ThongBaoWidget({
    Key? key,
    required this.soDT,
    required this.vip,
    required this.soTien,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Xin chúc mừng Hội viên ***$soDT đã mời thành công VIP $vip, nhận $soTien.000VND tiền giới thiệu",
      style: const TextStyle(color: Colors.black87),
    );
  }
}
