import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou/firebase/fire_accounts.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/item/itemAcc.dart';
import 'package:ryokou/ui/page/account/acc_container.dart';
import 'package:ryokou/ui/progress_anim/loading.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';

class AccSettings extends StatelessWidget {
  const AccSettings({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService auth = AuthService();
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            getAppBar(
              context,
              const Row(
                children: [
                  Text(
                    "Cài đặt",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  )
                ],
              ),
              haveLeading: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Column(
                children: [
                  Image.asset('assets/image/settingsImg.png'),
                  const SizedBox(
                    height: 16,
                  ),
                  AccContainer(
                      column: Column(
                    children: [
                      ItemAcc(
                        isLine: false,
                        title: "Thông tin tài khoản",
                        subtitle: "Nhấn để thay đổi thông tin tài khoản",
                        onTap: () {
                          context.push('/infoUser');
                        },
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 54,
                  ),
                  const AccContainer(
                    column: Column(
                      children: [
                        ItemAcc(
                          isLine: true,
                          isSetting: true,
                          title: "Ngôn ngữ",
                          subtitle: "Tiếng Việt",
                        ),
                        ItemAcc(
                          isLine: true,
                          title: "Điều khoản & Điều kiện",
                        ),
                        ItemAcc(
                          isLine: true,
                          title: "Chính sách và quyền riêng tư",
                        ),
                        ItemAcc(
                          isLine: false,
                          title: "About us",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return const Loading(
                              isLogOut: true,
                            );
                          },
                        );
                        Future.delayed(const Duration(seconds: 1), () {
                          auth.signOut();
                          context.pop();
                          context.go('/');
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Nền trắng
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Bo góc 10
                          side: const BorderSide(
                              color: AppColors.primaryColor,
                              width: 2), // Viền màu
                        ),
                      ),
                      child: const Text(
                        "Đăng xuất",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
