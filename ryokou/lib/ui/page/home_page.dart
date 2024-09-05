import 'package:flutter/material.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/user.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/appbar/top_app_bar.dart';
import 'package:ryokou/ui/slider/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _signIn(User u) {
    setState(() {
      DataController().setUser = u;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          getAppBar(
            context,
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    child: Row(
                      children: [
                        Icon(
                          Icons.place,
                          size: 30,
                        ),
                        Text(
                          'Ryokou',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.sticky_note_2_sharp),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _signIn,
            isHome: true,
          ),
          SliderBar(numSlider: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                dealHotTime(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container dealHotTime(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: 10), // Cach Slider them 10 - Slider da co margin = 20
      width: MediaQuery.of(context).size.width,
      height: 65,
      decoration: BoxDecoration(
        color: AppColors.fillDeal_Home,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: AppColors.borderDeal_Home,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.3,
            decoration: const BoxDecoration(
              color: AppColors.borderDeal_Home,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: const Center(
                child: Text(
                  'DEAL HOT ĐẾN 50% MỖI NGÀY',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '12H - 14H',
                    style: TextStyle(
                      color: AppColors.borderDeal_Home,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Vui thả ga cùng Ryokou!!!',
                    style: TextStyle(
                      color: AppColors.borderDeal_Home,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
