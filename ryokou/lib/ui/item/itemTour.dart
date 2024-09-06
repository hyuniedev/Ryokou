import 'package:flutter/material.dart';

class ItemTour extends StatelessWidget {
  const ItemTour({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrTiecQuLhs_w5OQTOFmPxTqaxRua2SY9stg&s')
            ],
          )
        ],
      ),
    );
  }
}
