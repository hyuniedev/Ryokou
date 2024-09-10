import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';

class ItemField extends StatelessWidget {
  ItemField(
      {super.key,
      required this.title,
      this.isRequired = false,
      this.isSexField = false});
  String title;
  bool isRequired;
  bool isSexField;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 10),
        const TextField(
          maxLines: 1,
          keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 21),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        const SizedBox(height: 18)
      ],
    );
  }
}
