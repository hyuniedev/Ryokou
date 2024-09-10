import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/item/itemField.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              getAppBar(
                context,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Ryokou',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Image.asset('assets/image/appbar_ryokou.png'),
                  ],
                ),
                haveLeading: true,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Image.asset('assets/image/login_imgDulich.png'),
                    ),
                    ItemField(title: 'Tên đăng nhập'),
                    ItemField(title: 'Mật khẩu'),
                    const SizedBox(height: 21),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: const Center(
                          child: Text(
                            'Đăng nhập',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 27),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/image/icon_GG.png'),
                            const SizedBox(width: 16),
                            const Text(
                              'Đăng nhập bằng Google',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 23),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Nếu chưa có tài khoản.  ',
                          style: TextStyle(
                              fontSize: 18, color: AppColors.primaryColor),
                        ),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {},
                          child: Text(
                            'Đăng ký',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.amber[800],
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.amber[800]),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
