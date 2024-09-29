import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou_service/themes/colors_theme.dart';

PreferredSizeWidget getAppBar(BuildContext context, Widget childAppBar,
    {bool haveLeading = false, double height = 100}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height), // chiều cao AppBar
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: AppBar(
        toolbarHeight: height,
        automaticallyImplyLeading: false,
        leading: haveLeading
            ? IconButton(
                onPressed: () {
                  context.go('/');
                },
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                ))
            : null,
        backgroundColor: AppColor.primaryColor,
        title: childAppBar,
      ),
    ),
  );
}
