import 'package:flutter/material.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/acc/login.dart';

PreferredSizeWidget getAppBar(BuildContext context, Widget childAppBar,
    {bool isHome = false, bool haveLeading = false, double height = 100}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(isHome ? 120 : 100), // chiều cao AppBar
    child: Stack(
      children: [
        Container(
          height: isHome ? 120 : height,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: haveLeading
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                    ))
                : null,
            backgroundColor: AppColors.primaryColor,
            title: childAppBar,
            toolbarHeight: isHome ? 80 : 100,
          ),
        ),
        !isHome
            ? Container()
            : Container(
                height: 90,
                width: MediaQuery.of(context).size.width / 1.1,
                margin: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width / 1.1) /
                      2,
                  top: 75,
                  bottom: 22,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.primaryColor, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: DataController().getUser == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Đăng kì thánh viên! Hưởng nhiều ưu đãi',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 26,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                              child: const Center(
                                child: Text(
                                  'Đăng nhập/ Đăng ký',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.account_circle,
                            size: 40,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Cháo mừng ${DataController().getUser?.fullName}!',
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
              ),
      ],
    ),
  );
}
