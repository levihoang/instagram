// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../widgets/heart_animation_widget.dart';

class Temp extends StatefulWidget {
  const Temp({Key? key}) : super(key: key);

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  final String numberPhone = '112222';
  final String url =
      'https://image.thanhnien.vn/w1024/Uploaded/2022/znetns/2022_05_06/son-tung-1-944.jpg';

  bool isLiked = false;
  bool isHeartAnimating = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Hello"),
        ),
        body: ListView(children: [
          GestureDetector(
            child: Stack(alignment: Alignment.center, children: [
              Image.network(
                url,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: isHeartAnimating ? 1 : 0,
                child: HeartAnimationWidget(
                  isAnimating: isHeartAnimating,
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 100,
                  ),
                  duration: const Duration(microseconds: 700),
                  onEnd: () => setState(() {
                    isHeartAnimating = false;
                    isLiked = true;
                  }),
                ),
              )
            ]),
            onDoubleTap: () {
              setState(() {
                isHeartAnimating = true;
                isLiked = true;
              });
            },
          ),
          InkWell(
            child: isLiked
                ? const Icon(
                    Icons.favorite,
                    size: 30,
                  )
                : const Icon(
                    Icons.favorite_outline,
                    size: 30,
                  ),
            onTap: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
          )
        ]),
      );
}
