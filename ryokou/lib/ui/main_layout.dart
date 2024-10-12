import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/page/account/account_page.dart';
import 'package:ryokou/ui/page/favourite/favourite_page..dart';
import 'package:ryokou/ui/page/home/home_page.dart';
import 'package:ryokou/ui/page/my_tour/my_tour_page.dart';
import 'package:ryokou/ui/page/search/search_page.dart';

class MainLayout extends StatefulWidget {
  static int index = 0;
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final List<Widget> _arrPage = [
    const HomePage(),
    const SearchPage(),
    const FavoritePage(),
    // const MyHomePage(), // thoi tiet
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
              label: 'Favorite',
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
        currentIndex: MainLayout.index,
        onTap: (newIndex) {
          setState(() {
            MainLayout.index = newIndex;
          });
        },
      ),
      body: SafeArea(child: _arrPage[MainLayout.index]),
    );
  }
}
