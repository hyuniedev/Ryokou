import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';

Widget childAppBarMainPages() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: Image.asset(
                'assets/image/logoRyokou.jpg',
                fit: BoxFit.fill,
                scale: 7.5,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Ryokou',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.sticky_note_2_sharp,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ],
  );
}
