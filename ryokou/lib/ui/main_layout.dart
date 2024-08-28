import 'package:flutter/material.dart';
import 'package:ryokou/main.dart';
import 'package:ryokou/themes/colors_theme.dart';
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
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: 'Home',
                backgroundColor: ColorsTheme.primaryColor),
            BottomNavigationBarItem(
                icon: const Icon(Icons.search),
                label: 'Search',
                backgroundColor: ColorsTheme.primaryColor),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: 'Favourite',
                backgroundColor: ColorsTheme.primaryColor),
            BottomNavigationBarItem(
                icon: const Icon(Icons.tour),
                label: 'My Tour',
                backgroundColor: ColorsTheme.primaryColor),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: 'Account',
                backgroundColor: ColorsTheme.primaryColor),
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
