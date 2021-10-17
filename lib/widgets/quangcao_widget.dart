import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class QuangCaoWidget extends StatefulWidget {
  const QuangCaoWidget({Key? key}) : super(key: key);
  @override
  State<QuangCaoWidget> createState() => _QuangCaoWidgetState();
}

class _QuangCaoWidgetState extends State<QuangCaoWidget> {
  final List<Image> listImg = [
    Image.asset("assets/img1.jpg"),
    Image.asset("assets/img2.jpg"),
    Image.asset("assets/img3.jpg"),
    Image.asset("assets/img4.jpg"),
    Image.asset("assets/img5.jpg"),
    Image.asset("assets/img6.jpg"),
    Image.asset("assets/img7.jpg"),
    Image.asset("assets/img8.jpg"),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items: listImg,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
              height: 150,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 2000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listImg.map((item) {
            int index = listImg.indexOf(item);
            return Container(
              width: 10.0,
              height: 10.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? const Color.fromRGBO(0, 0, 0, 0.8)
                    : const Color.fromRGBO(0, 0, 0, 0.3),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
