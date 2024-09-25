import 'package:flutter/material.dart';

class MyTourPage extends StatefulWidget {
  const MyTourPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyTourPageState();
}

class _MyTourPageState extends State<MyTourPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Column(
            children: [
              Text('data'),
              Icon(Icons.accessibility_outlined),
            ],
          )),
    );
  }
}
