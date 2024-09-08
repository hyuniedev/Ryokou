import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';

class ItemTour extends StatelessWidget {
  const ItemTour({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.primaryColor, width: 2),
                  ),
                ),
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image.network(
                      'https://www.startravel.vn/upload/tintuc/tham-quan-du-lich-nhat-ban_28_3_2018_9_9_9.png',
                      fit: BoxFit.cover,
                      height: 115,
                      width: 150,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(15))),
                      child: const Text(
                        '20%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 150,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor, width: 1),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ngắm hoa anh đào tại Tokyo',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Row(
                      children: [
                        Text(
                          '4.2/5',
                          style: TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 13,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          '(198)',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      '1.000.000đ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '899.000đ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () {},
                            child: const Icon(
                              Icons.favorite_outline,
                              color: Colors.amber,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
