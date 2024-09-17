import 'package:flutter/material.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/ui/booking/pay.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<StatefulWidget> createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              getAppBar(
                context,
                Container(
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage('assets/image/pajamas_question.png'),
                            color: Colors.white,
                            size: 46,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                isHome: DataController().getUser == null ? true : false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
