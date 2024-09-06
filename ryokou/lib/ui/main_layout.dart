import 'package:flutter/material.dart';
import 'package:ryokou/main.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/page/account/account_page.dart';
import 'package:ryokou/ui/page/favourite/favourite_page..dart';
import 'package:ryokou/ui/page/home/home_page.dart';
import 'package:ryokou/ui/page/my_tour/my_tour_page.dart';
import 'package:ryokou/ui/page/search/search_page.dart';

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
                backgroundColor: AppColors.primaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: AppColors.primaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favourite',
                backgroundColor: AppColors.primaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.tour),
                label: 'My Tour',
                backgroundColor: AppColors.primaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
                backgroundColor: AppColors.primaryColor),
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
