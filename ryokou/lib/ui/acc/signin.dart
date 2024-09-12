import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/item/itemField.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
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
                  Container(
                    padding: const EdgeInsets.only(top: 60, bottom: 40),
                    child: Image.asset('assets/image/logo_welcome.png'),
                  ),
                  const ItemField(title: 'Họ và tên', isRequired: true),
                  const ItemField(title: 'Tên đăng nhập', isRequired: true),
                  const ItemField(
                    title: 'Giới tính',
                    isRequired: true,
                    isSexField: true,
                  ),
                  const ItemField(title: 'Số điện thoại', isRequired: true),
                  const ItemField(title: 'Email', isRequired: true),
                  const ItemField(title: 'Mật khẩu', isRequired: true),
                  const ItemField(title: 'Xác nhận mật khẩu', isRequired: true),
                  const SizedBox(height: 45),
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
                          'Đăng ký',
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
                            'Đăng ký bằng Google',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 75)
          ],
        ),
      )),
    );
  }
}
