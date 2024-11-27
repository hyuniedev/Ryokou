import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/tour_booked.dart';
import 'package:ryokou/main.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';

class Pay extends StatefulWidget {
  const Pay({super.key, required this.tour});
  final TourBooked tour;
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
                  child: const Text(
                    'THANH TOÁN',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  ),
                ),
                haveLeading: true,
                height: 60,
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
                              widget.tour.name,
                              style: generalFontsize,
                            ),
                            Text(
                              'Thời gian: ${DateFormat('dd/MM/yyyy').format(widget.tour.start)}',
                              style: generalFontsize,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Giá tour: ',
                                  style: generalFontsize,
                                ),
                                Text(
                                  '${widget.tour.getPriceTour()}đ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              'Số lượng khách: ${widget.tour.numPerson}',
                              style: generalFontsize,
                            ),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          Text(
                            'Chi phí',
                            style: generalBoss,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Giá tour',
                                      style: generalFontsize,
                                    ),
                                    Text(
                                      '${widget.tour.cost}đ',
                                      style: generalFontsize,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Giảm giá',
                                      style: generalFontsize,
                                    ),
                                    Text(
                                      '${widget.tour.sale}%',
                                      style: generalFontsize,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Số vé',
                                      style: generalFontsize,
                                    ),
                                    Text(
                                      '${widget.tour.numPerson} vé',
                                      style: generalFontsize,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tổng',
                                style: generalBoss,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 140),
                                child: Text(
                                  '${widget.tour.getPriceTour(soLuong: widget.tour.numPerson)}đ',
                                  style: const TextStyle(
                                      color: AppColors.borderDeal_Home,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              )
                            ],
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: AppColors.primaryColor,
                              ),
                              onPressed: () {
                                DataController()
                                    .getUser!
                                    .addMyTour(widget.tour);
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Đặt lịch thành công'),
                                      content: const Text(
                                        'Chúc mừng bạn đã đặt lịch thành công!.  Sẽ có nhân viên gọi cho bạn sớm nhất có thể. Cảm ơn bạn!',
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            context.go('/');
                                          },
                                          child: const Text('Trở về trang chủ'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text(
                                'Thanh toán',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
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
