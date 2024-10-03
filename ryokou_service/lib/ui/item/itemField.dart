import 'package:flutter/material.dart';
import 'package:ryokou_service/themes/colors_theme.dart';

class ItemField extends StatelessWidget {
  final String title;
  final bool isRequired;
  final TextEditingController tec;
  final bool isGener;
  const ItemField({
    super.key,
    required this.title,
    this.isRequired = false,
    this.isGener = false,
    required this.tec,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  isGener
                      ? Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            color: AppColor.primaryColor,
                          ),
                        )
                      : Container(),
                  isRequired
                      ? Text(
                          ' *',
                          style:
                              TextStyle(color: Colors.amber[900], fontSize: 20),
                        )
                      : Container(),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              TextField(
                controller: tec,
                minLines: 1,
                maxLines: 10,
                keyboardType: TextInputType.text,
                style: const TextStyle(fontSize: 21),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.primaryColor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.primaryColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 18)
            ],
          )
        ],
      ),
    );
  }
}
