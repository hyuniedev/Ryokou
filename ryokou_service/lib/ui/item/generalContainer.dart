import 'package:flutter/material.dart';

class GeneralContainer extends StatelessWidget {
  final Widget child;
  const GeneralContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFF00C5A7),
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5), offset: const Offset(0, 3)),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: child,
        ),
      ),
    );
  }
}
