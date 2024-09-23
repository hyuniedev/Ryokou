import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou/firebase/fire_accounts.dart';
import 'package:ryokou/ui/item/itemAcc.dart';
import 'package:ryokou/ui/page/account/acc_container.dart';
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
                  const AccContainer(
                      column: Column(
                    children: [
                      ItemAcc(
                          isLine: false,
                          title: "Mật khẩu & Bảo mật",
                          subtitle: "Nhấn để thay đổi mật khẩu")
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
                          subtitle: "",
                        ),
                        ItemAcc(
                          isLine: true,
                          title: "Chính sách và quyền riêng tư",
                          subtitle: "",
                        ),
                        ItemAcc(
                          isLine: false,
                          title: "About us",
                          subtitle: "",
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
                        auth.signOut();
                        context.push('/');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Nền trắng
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Bo góc 10
                          side: const BorderSide(
                              color: Color(0xFF00C5A7), width: 2), // Viền màu
                        ),
                      ),
                      child: const Text(
                        "Đăng xuất",
                        style: TextStyle(
                          color: Color(0xFF00C5A7),
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
