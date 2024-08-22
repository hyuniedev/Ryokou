import 'package:flutter/material.dart';
import 'package:ryokou/main.dart';

class MainLayout extends State<MyHomePage> {
  int indexNav = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Trang chu',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Yeu thich',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Tim kiem',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Tai khoan',
              backgroundColor: Colors.green),
        ],
        currentIndex: indexNav,
        onTap: (newIndex) {
          setState(() {
            indexNav = newIndex;
          });
        },
      ),
      body: Container(
        alignment: Alignment.center,
      ),
    );
  }
}
