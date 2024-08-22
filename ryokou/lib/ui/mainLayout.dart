import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ryokou/main.dart';

class MainLayout extends State<MyHomePage> {
  int indexNav = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chu'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Yeu thich'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Tim kiem'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tai khoan'),
        ],
        currentIndex: 0,
        onTap: (newIndex) {
          indexNav = newIndex;
        },
      ),
      body: Container(
        alignment: Alignment.center,
      ),
    );
  }
}
