import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/item/itemField.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController tecCurrentPassword = TextEditingController();
    TextEditingController tecNewPassword = TextEditingController();
    TextEditingController tecConfirmPassword = TextEditingController();

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
                    'Đổi mật khẩu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
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
                  Image.asset('assets/image/imgPass.png'),
                  const SizedBox(
                    height: 40,
                  ),
                  ItemField(
                      title: 'Mật khẩu hiện tại', tec: tecCurrentPassword),
                  const SizedBox(
                    height: 30,
                  ),
                  ItemField(title: 'Mật khẩu mới', tec: tecNewPassword),
                  const SizedBox(
                    height: 30,
                  ),
                  ItemField(
                      title: 'Xác nhận mật khẩu mới', tec: tecConfirmPassword),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.borderDeal_Home,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Xác nhận',
                        style: TextStyle(
                          color: Colors.white,
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
