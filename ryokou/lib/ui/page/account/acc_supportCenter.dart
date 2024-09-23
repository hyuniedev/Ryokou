import 'package:flutter/material.dart';
import 'package:ryokou/ui/item/itemAcc.dart';
import 'package:ryokou/ui/page/account/acc_container.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';

class AccSupportcenter extends StatelessWidget {
  const AccSupportcenter({super.key});

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
                  child: const Row(
                    children: [
                      Text(
                        "Trung tâm hỗ trợ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                haveLeading: true,
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                  child: Column(
                    children: [
                      Image.asset('assets/image/SupImg.png'),
                      const SizedBox(
                        height: 16,
                      ),
                      const AccContainer(
                        column: Column(
                          children: [
                            Itemacc(
                              isLine: true,
                              title: "Chủ đề phổ biến",
                              subtitle: "",
                            ),
                            Itemacc(
                              isLine: true,
                              title: "Đặt tour trực tiếp để đảm bảo an toàn",
                              subtitle: "",
                            ),
                            Itemacc(
                              isLine: true,
                              title: "Cách hủy đặt tour",
                              subtitle: "",
                            ),
                            Itemacc(
                              isLine: true,
                              title: "Cách làm thủ tục trực tuyến",
                              subtitle: "",
                            ),
                            Itemacc(
                              isLine: true,
                              title: "Xác nhận & xác thực thanh toán",
                              subtitle: "",
                            ),
                            Itemacc(
                              isLine: false,
                              title: "Lời hứa hoàn tiền trên Ryokou",
                              subtitle: "",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 34,
                      ),
                      const Center(
                        child: Column(
                          children: [
                            Text(
                              'Bạn không tìm thấy câu trả lời của mình?',
                              style: TextStyle(
                                color: Color(0xFF00C5A7),
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'Nhắn tin cho chúng tôi',
                              style: TextStyle(
                                color: Color(0xFFF58601),
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}