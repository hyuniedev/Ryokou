import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/appbar/top_app_bar.dart';
import 'package:ryokou/ui/slider/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(Container()),
    );
  }
}
