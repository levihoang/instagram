// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../widgets/like_animation_widget.dart';

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
  Widget build(BuildContext context) {
    final icon = isLiked ? Icons.favorite : Icons.favorite_outline;
    final hearIconColor = isLiked ? Colors.red : Colors.white;
    return Scaffold(
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
            AnimatedOpacity(
              opacity: isHeartAnimating ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: LikeAnimation(
                isAnimating: isHeartAnimating,
                child: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 100,
                ),
                duration: const Duration(microseconds: 400),
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
        LikeAnimation(
            child: IconButton(
              icon: Icon(icon, color: hearIconColor),
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
            ),
            isAnimating: isLiked)
      ]),
    );
  }
}
