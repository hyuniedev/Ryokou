import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';

class ItemField extends StatelessWidget {
  final String title;
  final bool isRequired;
  final bool isSexField;
  final TextEditingController tec;
  const ItemField({
    super.key,
    required this.title,
    this.isRequired = false,
    this.isSexField = false,
    required this.tec,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: isSexField
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.primaryColor,
                  ),
                ),
                isRequired
                    ? Text(
                        ' *',
                        style:
                            TextStyle(color: Colors.amber[900], fontSize: 20),
                      )
                    : Container(),
              ],
            ),
            isSexField ? RadioSex(tec: tec) : Container()
          ],
        ),
        const SizedBox(height: 10),
        isSexField
            ? Container()
            : Column(
                children: [
                  TextField(
                    controller: tec,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 21),
                    decoration: const InputDecoration(
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
              )
      ],
    );
  }
}

class RadioSex extends StatefulWidget {
  final TextEditingController tec;
  const RadioSex({super.key, required this.tec});
  @override
  State<RadioSex> createState() => _RadioSexState();
}

class _RadioSexState extends State<RadioSex> {
  int? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          rdButton(1, 'Nam', widget.tec),
          rdButton(2, 'Nữ', widget.tec),
        ],
      ),
    );
  }

  Widget rdButton(int value, String label, TextEditingController tec) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tec.text = value == 1 ? 'male' : 'female';
          _selectedValue = value;
        });
      },
      child: Row(
        children: [
          Radio(
            fillColor: const WidgetStatePropertyAll(AppColors.primaryColor),
            activeColor: AppColors.primaryColor,
            value: value,
            groupValue: _selectedValue,
            onChanged: (newValue) {
              setState(() {
                _selectedValue = newValue;
              });
            },
          ),
          Text(
            label,
            style: const TextStyle(color: AppColors.primaryColor, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
