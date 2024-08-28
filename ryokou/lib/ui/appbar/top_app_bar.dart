import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';

// class GetAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final Widget childAppBar;
//   const GetAppBar({super.key, required this.childAppBar});

//   @override
//   Widget build(BuildContext context) {

//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(100.0);
// }

PreferredSizeWidget getAppBar(Widget childAppBar) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(100.0), // chiều cao AppBar
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: AppBar(
        backgroundColor: ColorsTheme.primaryColor,
        title: childAppBar,
        toolbarHeight: 100,
      ),
    ),
  );
}
