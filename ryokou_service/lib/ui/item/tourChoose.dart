import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
          ControllerButton(context, 'Show list customer', () {
            Navigator.of(context).pop();
            context.push('/customer');
          }),
          ControllerButton(context, 'Show tour details', () {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      const SizedBox(
                        height: 150,
                        width: 300,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Notification',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              Text(
                                  'Error! This feature will be developed in the future.'),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
          ControllerButton(context, 'Delete Tour', () {
            Navigator.of(context).pop();
          }),
          ControllerButton(context, 'Tour extension', () {
            Navigator.of(context).pop();
          })
        ],
      ),
    );
  }

  ElevatedButton ControllerButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width, 50),
        backgroundColor: AppColor.primaryColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
