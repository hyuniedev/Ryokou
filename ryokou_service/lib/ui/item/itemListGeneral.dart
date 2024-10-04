import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou_service/main.dart';
import 'package:ryokou_service/themes/colors_theme.dart';
import 'package:ryokou_service/ui/item/item_customer_detais.dart';
import 'package:ryokou_service/ui/item/tourChoose.dart';

class ItemListGeneral extends StatelessWidget {
  final String name;
  final bool isLine;
  final bool isListTour;
  const ItemListGeneral({
    super.key,
    this.isListTour = false,
    this.isLine = false,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isListTour) {
          
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const TourChoose();
              });
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const ItemCustomerDetails(
                name: 'Nguyễn Văn A',
                age: 20,
                phone: '0123456789',
                email: 'sss@gmail.com',
              );
            },
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style:
                    const TextStyle(color: AppColor.primaryColor, fontSize: 16),
              ),
              const Text(
                '>>',
                style: TextStyle(color: AppColor.primaryColor, fontSize: 16),
              ),
            ],
          ),
          if (isLine) const Divider(color: Color(0xFFB0EDE7), thickness: 1),
        ],
      ),
    );
  }
}
