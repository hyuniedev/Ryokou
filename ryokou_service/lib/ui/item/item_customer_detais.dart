import 'package:flutter/material.dart';
import 'package:ryokou_service/themes/colors_theme.dart';

class ItemCustomerDetails extends StatelessWidget {
  final String name;
  final int age;
  final String phone;
  final String email;

  const ItemCustomerDetails({
    super.key,
    required this.name,
    required this.age,
    required this.phone,
    required this.email,
  });

  static const TextStyle generalStyle =
      TextStyle(fontSize: 16, color: AppColor.primaryColor);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 200, // Chiều cao của dialog

        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, right: 32, left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24), // Khoảng cách đầu
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tên:', style: generalStyle),
                      Text(name, style: generalStyle),
                    ],
                  ),
                  const SizedBox(height: 8), // Khoảng cách giữa các hàng
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tuổi:', style: generalStyle),
                      Text(age.toString(), style: generalStyle),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Số điện thoại:', style: generalStyle),
                      Text(phone, style: generalStyle),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Email:', style: generalStyle),
                      Text(email, style: generalStyle),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 2, // Khoảng cách từ trên
              right: 0, // Khoảng cách từ bên phải
              child: IconButton(
                icon: const Icon(Icons.close),
                color: AppColor.primaryColor,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
