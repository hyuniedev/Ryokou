import 'package:flutter/material.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/user.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/appbar/top_app_bar.dart';
import 'package:ryokou/ui/page/home/dealHot.dart';
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
}
