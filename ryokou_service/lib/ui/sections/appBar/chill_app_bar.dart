import 'package:flutter/material.dart';

Widget childAppBarMainPages() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Ryokou',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Image.asset('assets/image/iconLogo.png'),
    ],
  );
}
