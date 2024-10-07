import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ryokou_service/controller/account_controller.dart';
import 'package:ryokou_service/entity/company.dart';
import 'package:ryokou_service/main.dart';
import 'package:ryokou_service/themes/colors_theme.dart';
import 'package:ryokou_service/ui/item/itemField.dart';
import 'package:ryokou_service/ui/sections/appBar/chill_app_bar.dart';
import 'package:ryokou_service/ui/sections/appBar/top_app_bar.dart';

class Register extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _ggSignin = GoogleSignIn(); 
  Register({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController tecFullname = TextEditingController();
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

                      try {
                        UserCredential result =
                            await _auth.createUserWithEmailAndPassword(
                                email: tecEmail.text,
                                password: tecPassword.text);
                                
                        Company _company = Company(
                          id: result.user!.uid,
                          name: tecFullname.text,
                          numberphone: tecNumberphone.text,
                          email: tecEmail.text,
                        );

                        // Lưu dữ liệu vào Firestore
                        await _firestore
                            .collection('companys')
                            .doc(_company.id)
                            .set(_company.toJson());
                        
                        AccountController().setCompany = _company;
                        
                        context.go('/newtour');
                      } catch (e) {
                        print('Lỗi khi đăng ký: $e');
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
                    onTap: () async {
                        try {
                          GoogleSignInAccount? ggAccount = await _ggSignin.signIn();
                        if(ggAccount == null){
                          return;
                        }
                        GoogleSignInAuthentication ggSignInAcc = await ggAccount.authentication;
                        OAuthCredential credential =  GoogleAuthProvider.credential(idToken: ggSignInAcc.idToken, accessToken: ggSignInAcc.accessToken);
                        UserCredential userCredential = await _auth.signInWithCredential(credential);
                        User? user = userCredential.user;
                        Company company;
                        DocumentSnapshot doc = await _firestore.collection('companys').doc(user!.uid).get();
                        if(!doc.exists){
                          company = Company(id: user.uid, name: user.displayName, numberphone: user?.phoneNumber, email: tecEmail.text);
                          await _firestore.collection('companys').doc(user.uid).set(company.toJson());
                        }else{
                          Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
                          company = Company.fromJson(data);
                        }
                        AccountController().setCompany = company;
                        context.go('/newtour');
                        } catch (e) {
                          print('Error Register: $e');
                        }
                      },
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
