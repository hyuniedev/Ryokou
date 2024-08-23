import 'package:flutter/material.dart';
import 'package:ryokou/main.dart';
import 'package:ryokou/ui/page/account_page.dart';
import 'package:ryokou/ui/page/favourite_page..dart';
import 'package:ryokou/ui/page/home_page.dart';
import 'package:ryokou/ui/page/my_tour_page.dart';
import 'package:ryokou/ui/page/search_page.dart';

class MainLayout extends State<MyHomePage> {
  int _indexNav = 0;
  final List<Widget> _arrPage = [
    const HomePage(),
    const SearchPage(),
    const FavouritePage(),
    const MyTourPage(),
    const AccountPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favourite',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.tour),
                label: 'My Tour',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
                backgroundColor: Colors.green),
          ],
          currentIndex: _indexNav,
          onTap: (newIndex) {
            setState(() {
              _indexNav = newIndex;
            });
          },
        ),
        body: _arrPage[_indexNav]);
  }
}
