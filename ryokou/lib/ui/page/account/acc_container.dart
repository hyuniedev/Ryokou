import 'package:flutter/material.dart';
import 'package:ryokou/ui/item/itemAcc.dart';

class AccContainer extends StatelessWidget {
  final Column column;
  const AccContainer({
    super.key,
    required this.column,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFF00C5A7),
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5), offset: const Offset(0, 3))
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: column,
      ),
    );
  }
}
