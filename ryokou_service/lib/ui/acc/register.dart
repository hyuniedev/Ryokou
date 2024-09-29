import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou_service/themes/colors_theme.dart';
import 'package:ryokou_service/ui/item/itemField.dart';
import 'package:ryokou_service/ui/sections/appBar/chill_app_bar.dart';
import 'package:ryokou_service/ui/sections/appBar/top_app_bar.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController tecUsername = TextEditingController();
    TextEditingController tecFullname = TextEditingController();
    TextEditingController tecSex = TextEditingController();
    TextEditingController tecNumberphone = TextEditingController();
    TextEditingController tecEmail = TextEditingController();
    TextEditingController tecPassword = TextEditingController();
    TextEditingController tecCheckPassword = TextEditingController();

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            getAppBar(
              context,
              childAppBarMainPages(),
              haveLeading: true,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 60, bottom: 40),
                    child: Image.asset('assets/image/logoWelcome.png'),
                  ),
                  ItemField(
                      title: 'Tên doanh nghiệp',
                      isRequired: true,
                      tec: tecFullname),
                  ItemField(
                    title: 'Tên đăng nhập',
                    isRequired: true,
                    tec: tecUsername,
                  ),
                  ItemField(
                    title: 'Số điện thoại',
                    isRequired: true,
                    tec: tecNumberphone,
                  ),
                  ItemField(
                    title: 'Email',
                    isRequired: true,
                    tec: tecEmail,
                  ),
                  ItemField(
                    title: 'Mật khẩu',
                    isRequired: true,
                    tec: tecPassword,
                  ),
                  ItemField(
                    title: 'Xác nhận mật khẩu',
                    isRequired: true,
                    tec: tecCheckPassword,
                  ),
                  const SizedBox(height: 45),
                  InkWell(
                    onTap: () async {
                      if (tecCheckPassword.text != tecPassword.text) {
                        // Hiển thị thông báo lỗi nếu mật khẩu không khớp
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Mật khẩu không khớp')),
                        );
                        return;
                      }
// =========================================================================
                      if (tecUsername.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Vui lòng nhập tên doanh nghiệp')),
                        );
                        return;
                      }

                      if (tecPassword.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Vui lòng nhập mật khẩu')),
                        );
                        return;
                      }

                      if (tecFullname.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Vui lòng nhập họ và tên')),
                        );
                        return;
                      }

                      if (tecEmail.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Vui lòng nhập địa chỉ email')),
                        );
                        return;
                      }

                      if (tecNumberphone.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Vui lòng nhập số điện thoại')),
                        );
                        return;
                      }

                      if (tecSex.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Vui lòng chọn giới tính ${tecSex.text}')),
                        );
                        return;
                      }
//====================================================================
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
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
                        border: Border.all(color: AppColor.primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/image/iconGG.png'),
                          const SizedBox(width: 16),
                          const Text(
                            'Đăng ký bằng Google',
                            style: TextStyle(
                                color: AppColor.primaryColor,
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
