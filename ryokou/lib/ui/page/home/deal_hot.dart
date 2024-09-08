import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';

Container dealHotTime(BuildContext context, int beginTime) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 22),
    width: MediaQuery.of(context).size.width,
    height: 65,
    decoration: BoxDecoration(
      color: AppColors.fillDeal_Home,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      border: Border.all(
        color: AppColors.borderDeal_Home,
      ),
    ),
    child: Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.3,
          decoration: const BoxDecoration(
            color: AppColors.borderDeal_Home,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: const Center(
              child: Text(
                'DEAL HOT ĐẾN 50% MỖI NGÀY',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${beginTime}H - ${beginTime + 2}H',
                style: const TextStyle(
                  color: AppColors.borderDeal_Home,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Vui thả ga cùng Ryokou!!!',
                style: TextStyle(
                  color: AppColors.borderDeal_Home,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
