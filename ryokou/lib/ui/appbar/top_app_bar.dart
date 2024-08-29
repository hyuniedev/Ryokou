import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';

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
        backgroundColor: AppColors.primaryColor,
        title: childAppBar,
        toolbarHeight: 100,
      ),
    ),
  );
}
