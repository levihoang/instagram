// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Temp extends StatefulWidget {
  const Temp({Key? key}) : super(key: key);

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  final String numberPhone = '112222';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("View"),
      ),
      body: Center(
        child: IconButton(
            onPressed: () => launch("tel://$numberPhone"),
            icon: const Icon(Icons.favorite)),
      ));
}
