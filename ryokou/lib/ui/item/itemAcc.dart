import 'package:flutter/material.dart';

class Itemacc extends StatelessWidget {
  final IconData? icon;
  final String? iconPath;
  final String title;
  final String subtitle;
  final bool isLine;
  final bool isSetting;
  final VoidCallback? onTap;

  const Itemacc({
    super.key,
    this.icon,
    this.iconPath,
    required this.isLine,
    this.isSetting = false,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (iconPath != null)
                Image.asset(
                  iconPath!,
                  width: 32,
                  height: 32,
                )
              else if (icon != null)
                Icon(
                  icon,
                  size: 32,
                  color: const Color(0xFF00C5A7),
                ),
              if (icon != null || iconPath != null) const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Color(0xFF00C5A7),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFFB0EDE7),
                        fontSize: 14,
                      ),
                      maxLines: null,
                      overflow: TextOverflow.visible,
                    )
                  ],
                ),
              ),
              isSetting
                  ? Image.asset('assets/image/off.png', width: 24, height: 24)
                  : const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF00C5A7),
                      size: 20,
                    )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          if (isLine) const Divider(color: Color(0xFFB0EDE7), thickness: 1),
        ],
      ),
    );
  }
}