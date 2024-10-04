import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/sections/appbar/child_app_bar_main_pages.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';

class MyTourPage extends StatefulWidget {
  const MyTourPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyTourPageState();
}

class _MyTourPageState extends State<MyTourPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          getAppBar(context, childAppBarMainPages()),
          DataController().getUser == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/image/bill_cross.png',
                      scale: 0.85,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Đăng nhập hoặc Đăng ký để quản lý đặt chỗ của bạn dễ dàng. Sử dụng tài khoản đã đăng ký của bạn để đăng nhập vào ứng dụng và quản lý tour của bạn.',
                        style: TextStyle(
                            fontSize: 16, color: AppColors.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    DataController().getUser == null
                        ? Container(
                            color: Colors.transparent,
                            height: 100,
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () {
                                      context.go('/login');
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: AppColors.primaryColor)),
                                      child: const Center(
                                        child: Text(
                                          'Đăng nhập',
                                          style: TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primaryColor),
                                        ),
                                      ),
                                    )),
                                InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () {
                                      context.push('/register');
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.primaryColor,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Đăng ký',
                                          style: TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                )
              : const Column()
        ],
      ),
    ));
  }
}
