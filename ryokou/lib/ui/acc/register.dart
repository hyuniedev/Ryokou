import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou/entity/enumSex/e_sex.dart';
import 'package:ryokou/entity/user.dart' as myuser;
import 'package:ryokou/firebase/fire_accounts.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/item/itemField.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ryokou',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/image/appbar_ryokou.png',
                    height: 75,
                  ),
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
                  ItemField(
                      title: 'Họ và tên', isRequired: true, tec: tecFullname),
                  ItemField(
                    title: 'Tên đăng nhập',
                    isRequired: true,
                    tec: tecUsername,
                  ),
                  ItemField(
                    title: 'Giới tính',
                    isRequired: true,
                    isSexField: true,
                    tec: tecSex,
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
                              content: Text('Vui lòng nhập tên người dùng')),
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
                      myuser.User user = myuser.User(
                          userName: tecUsername.text,
                          password: tecPassword.text,
                          fullName: tecFullname.text,
                          email: tecEmail.text,
                          numberphone: tecNumberphone.text,
                          sex: tecSex.text == 'male' ? ESex.male : ESex.female);

                      try {
                        UserCredential? result =
                            await authService.register(user);
                        print('DANG KY THANH CONG');
                        context.go('/');
                      } catch (e) {
                        // Xử lý ngoại lệ và thông báo lỗi
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Lỗi: ${e.toString()}')),
                        );
                      }
                    },
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
