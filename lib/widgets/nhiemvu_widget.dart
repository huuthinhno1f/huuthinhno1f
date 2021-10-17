import 'package:flutter/material.dart';

class NhiemVuWidget extends StatelessWidget {
  final String title, img;

  final Function onPressed;
  const NhiemVuWidget(
      {Key? key,
      required this.title,
      required this.img,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.blue),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Row(
          children: <Widget>[
            Expanded(child: Image.asset(img)),
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Text(title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.amber, fontWeight: FontWeight.bold)),
                    const Text("Thích theo dõi",
                        style: TextStyle(color: Colors.white))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
