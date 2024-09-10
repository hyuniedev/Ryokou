import 'package:flutter/material.dart';
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
                Container(
                  child: Row(
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
                ),
                haveLeading: true,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Column(
                  children: [
                    Image.asset('assets/image/login_imgDulich.png'),
                    ItemField(title: 'Tên đăng nhập'),
                    ItemField(title: 'Mật khẩu')
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
