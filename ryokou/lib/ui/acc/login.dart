import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou/firebase/fire_accounts.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/item/itemField.dart';
import 'package:ryokou/ui/progress_anim/loading.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController tecUsername = TextEditingController();
  TextEditingController tecPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();

    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                getAppBar(
                  context,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ryokou',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/image/appbar_ryokou.png',
                        fit: BoxFit.contain,
                        height: MediaQuery.of(context).size.width * 0.2,
                      ),
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
                      ItemField(
                        title: 'Email',
                        tec: tecUsername,
                      ),
                      ItemField(
                        title: 'Password',
                        tec: tecPassword,
                      ),
                      const SizedBox(height: 21),
                      InkWell(
                        onTap: () async {
                          User? user = await authService.signIn(
                              tecUsername.text, tecPassword.text);
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return const Loading();
                            },
                          );
                          if (user != null) {
                            Navigator.of(context).pop();
                            context.push('/');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Dang nhap that bai')));
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
                        onTap: () async {
                          User? user =
                              await authService.signinWithGoogleAccount();

                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return const Loading();
                            },
                          );
                          if (user != null) {
                            Navigator.of(context).pop();

                            context.push('/');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Dang nhap that bai')));
                          }
                        },
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
                          GestureDetector(
                            onTap: () {
                              context.push('/register');
                            },
                            child: Text(
                              'Đăng ký',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.amber[800],
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.amber[900]),
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
      ),
    );
  }
}
