import 'package:flutter/material.dart';

class ThanhVienWidget extends StatelessWidget {
  final String img, sdt, soNV, soTien;
  const ThanhVienWidget({
    Key? key,
    required this.soTien,
    required this.img,
    required this.sdt,
    required this.soNV,
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
              "Hôm nay đã làm $soNV nhiệm vụ, và được $soTien.000đ",
              style: const TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ],
    );
  }
}
