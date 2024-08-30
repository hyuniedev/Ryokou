import 'package:flutter/material.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/themes/colors_theme.dart';

PreferredSizeWidget getAppBar(BuildContext context, Widget childAppBar,
    {bool isHome = false}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(isHome ? 184 : 100), // chiều cao AppBar
    child: Stack(
      children: [
        Container(
          height: 100,
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
        Container(
          height: 90,
          width: MediaQuery.of(context).size.width / 1.1,
          margin: EdgeInsets.symmetric(
              horizontal: (MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width / 1.1) /
                  2,
              vertical: 60),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.primaryColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: DataController().user == null
              ? Row(
                  children: [],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Đăng kì thánh viên! Hưởng nhiều ưu đãi',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 26,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Center(
                          child: Text(
                            'Đăng nhập/ Đăng ký',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        )
      ],
    ),
  );
}
