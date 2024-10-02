import 'package:flutter/material.dart';
import 'package:ryokou_service/enum/iSugget.dart';
import 'package:ryokou_service/themes/colors_theme.dart';

class ItemTag extends StatelessWidget {
  late ISugget titleTag;
  bool isSelected;
  Function changedTag;
   ItemTag(
      {super.key,
      required this.titleTag,
      required this.isSelected,
      required this.changedTag});
  

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
            color: isSelected ? AppColor.primaryColor : Colors.white,
            border: Border.all(color: AppColor.primaryColor, width: 1.5),
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