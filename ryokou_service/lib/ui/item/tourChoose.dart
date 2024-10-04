import 'package:flutter/material.dart';
import 'package:ryokou_service/themes/colors_theme.dart';

class TourChoose extends StatelessWidget {
  const TourChoose({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ControllerButton(context, 'Show list customer', (){}),
          ControllerButton(context, 'Show tour details', onPressed)
          ElevatedButton(
            onPressed: () {},
            child: const Text('Delete Tour'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Tour extension'),
          ),
        ],
      ),
    );
  }

  ElevatedButton ControllerButton(BuildContext context, String text,  VoidCallback onPressed) {
    return ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width, 50),
            backgroundColor: AppColor.primaryColor,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        );
  }
}
