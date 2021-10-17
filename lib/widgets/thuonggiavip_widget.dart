import 'package:flutter/material.dart';

class ThuongGiaVipWidget extends StatelessWidget {
  final String img, sdt, vip;
  const ThuongGiaVipWidget({
    Key? key,
    required this.img,
    required this.sdt,
    required this.vip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
          backgroundImage: AssetImage(
            img,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Xin chúc mừng: ****$sdt",
              style: const TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.bold),
            ),
            Text(
              "Đã nâng cấp thành công, tăng lên cấp $vip",
              style: const TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ],
    );
  }
}
