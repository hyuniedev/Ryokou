import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/ui/item/itemAcc.dart';
import 'package:ryokou/ui/page/account/acc_container.dart';
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
                  child: Column(
                    children: [
                      DataController().getUser == null
                          ? const Row(
                              children: [
                                ImageIcon(
                                  AssetImage(
                                      'assets/image/pajamas_question.png'),
                                  color: Colors.white,
                                  size: 46,
                                )
                              ],
                            )
                          : Row(
                              children: [
                                const Icon(
                                  Icons.person_outline,
                                  size: 52,
                                  color: Colors.white,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${DataController().getUser?.fullName}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Text(
                                      'Thông tin tài khoản >>',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                    ],
                  ),
                ),
                isHome: DataController().getUser == null ? true : false,
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                  child: DataController().getUser == null
                      ? MadaAccContainer()
                      : UserAccContainer(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column UserAccContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Phần thưởng của tôi",
          style: TextStyle(
            color: Color(0xFF00C5A7),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const AccContainer(
            column: Column(
          children: [
            ItemAcc(
              isLine: true,
              title: "0 Xu ",
              subtitle: "Đổi xu lấy mã ưu đãi",
              iconPath: 'assets/image/coin.png',
            ),
            ItemAcc(
              isLine: false,
              title: "Mã giảm giá của tôi",
              subtitle: "Xem danh sách mã giảm giá",
              iconPath: 'assets/image/voucher.png',
            )
          ],
        )),
        const SizedBox(
          height: 30,
        ),
        MadaAccContainer(),
      ],
    );
  }

  AccContainer MadaAccContainer() {
    return AccContainer(
      column: Column(
        children: [
          ItemAcc(
            isLine: true,
            title: "Trung tâm hỗ trợ",
            subtitle: "Nơi giải đáp đáp mọi thắc mắc của bạn",
            iconPath: "assets/image/ei_question.png",
            onTap: () {
              context.push('/support');
            },
          ),
          const ItemAcc(
            isLine: true,
            title: "Liên hệ chúng tôi",
            subtitle: "Yêu cầu hỗ trợ từ dịch vụ chăm sóc khách hàng",
            iconPath: "assets/image/Tel.png",
          ),
          ItemAcc(
            isLine: false,
            title: "Cài đặt",
            subtitle: "Xem và tùy chỉnh cài đặt cho tài khoản",
            icon: Icons.settings,
            onTap: () {
              context.push('/setting');
            },
          )
        ],
      ),
    );
  }
}
