import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou_service/controller/account_controller.dart';
import 'package:ryokou_service/entity/company.dart';
import 'package:ryokou_service/themes/colors_theme.dart';
import 'package:ryokou_service/ui/item/itemField.dart';
import 'package:ryokou_service/ui/sections/appBar/chill_app_bar.dart';
import 'package:ryokou_service/ui/sections/appBar/top_app_bar.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    TextEditingController tecUsername = TextEditingController();
    TextEditingController tecPassword = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              getAppBar(
                context,
                childAppBarMainPages(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Image.asset('assets/image/loginImg.png'),
                    ),
                    ItemField(
                      title: 'Email đăng nhập',
                      tec: tecUsername,
                    ),
                    ItemField(
                      title: 'Mật khẩu',
                      tec: tecPassword,
                    ),
                    const SizedBox(height: 21),
                    InkWell(
                      onTap: () async {
                        try {
                          UserCredential? result =
                              await _auth.signInWithEmailAndPassword(
                                  email: tecUsername.text,
                                  password: tecPassword.text);

                          print('DEN DAY ROI 0');
                          DocumentSnapshot doc = await _firestore
                              .collection('companys')
                              .doc(result.user!.uid)
                              .get();

                          if (doc.exists) {
                            Map<String, dynamic>? data =
                                doc.data() as Map<String, dynamic>?;
                            AccountController().setCompany = Company(
                              id: result.user!.uid,
                              name: data?['name'],
                              username: data?['username'],
                              numberphone: data?['numberphone'],
                              email: data?['email'],
                              password: tecPassword.text,
                            );
                          } else {}
                          context.go('/');
                        } catch (e) {
                          print('Co loi: $e');
                        }
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
                          border: Border.all(color: AppColor.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/image/iconGG.png'),
                            const SizedBox(width: 16),
                            const Text(
                              'Đăng nhập bằng Google',
                              style: TextStyle(
                                  color: AppColor.primaryColor,
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
                              fontSize: 18, color: AppColor.primaryColor),
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
                    ),
                    const SizedBox(
                      height: 16,
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
