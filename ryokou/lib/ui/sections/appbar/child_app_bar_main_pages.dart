import 'package:flutter/material.dart';

Widget childAppBarMainPages() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(
        child: Row(
          children: [
            Icon(
              Icons.place,
              size: 30,
            ),
            Text(
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
            icon: const Icon(Icons.sticky_note_2_sharp),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
    ],
  );
}
