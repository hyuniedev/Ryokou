import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/page/home/enumTag/ISugget.dart';

class ItemTag extends StatelessWidget {
  ItemTag(
      {super.key,
      required this.titleTag,
      required this.isSelected,
      required this.changedTag});
  ISugget titleTag;
  bool isSelected;
  Function changedTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 10, bottom: 15),
      child: InkWell(
        borderRadius: BorderRadius.circular(75),
        onTap: () => changedTag(titleTag),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : Colors.white,
            border: Border.all(color: AppColors.primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(75),
          ),
          child: Text(
            titleTag.text,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
