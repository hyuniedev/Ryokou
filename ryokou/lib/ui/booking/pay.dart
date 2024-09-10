import 'package:flutter/material.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  TextStyle generalFontsize = const TextStyle(fontSize: 16);
  TextStyle generalBoss =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              getAppBar(
                context,
                Container(
                  child: const Text('THANH TOÁN'),
                ),
                haveLeading: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 17),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thông tin tour',
                        style: generalBoss,
                      ),
                      Container(
                        height: 150,
                        margin: const EdgeInsets.only(left: 15, bottom: 46),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ngắm hoa anh đào tại Tokyo',
                              style: generalFontsize,
                            ),
                            Text(
                              'Thời gian: 28/08/2024',
                              style: generalFontsize,
                            ),
                            Text(
                              'Số lượng khách: 1',
                              style: generalFontsize,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Tổng tiền:',
                                  style: generalFontsize,
                                ),
                                const Text(
                                  '1.205.000đ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Text(
                        'Phương thức thanh toán',
                        style: generalBoss,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 11, bottom: 26),
                        child: Text(
                          'Thẻ và tài khoản ngân hàng',
                          style: generalFontsize,
                        ),
                      ),
                      SizedBox(
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                PayButton('Thẻ tín dụng, thẻ ghi nợ quốc tế',
                                    'assets/image/1.png'),
                                PayButton('Thẻ ATM', 'assets/image/3.png'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                PayButton('Mobile Banking VietQR',
                                    'assets/image/2.png'),
                                PayButton(
                                    'Quét mã QR VNPAY', 'assets/image/4.png'),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 18),
                        child: Text(
                          'Ví điện tử',
                          style: generalFontsize,
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            PayButton('Momo', 'assets/image/5.png'),
                            PayButton('Zalo Pay', 'assets/image/6.png')
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Chi phí',
                              style: generalBoss,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Giá tour',
                                    style: generalFontsize,
                                  ),
                                  Text(
                                    '1.205.000đ',
                                    style: generalFontsize,
                                  )
                                ],
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 16))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget PayButton(String data, String url) {
    return SizedBox(
      height: 100,
      width: 140,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            elevation: 8,
            shadowColor: Colors.grey.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(url),
              const SizedBox(height: 2),
              Text(
                data,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
