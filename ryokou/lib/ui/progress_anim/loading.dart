import 'package:flutter/material.dart';
import 'package:ryokou/themes/colors_theme.dart';

class Loading extends StatefulWidget {
  final bool isLogOut;

  const Loading({
    super.key,
    this.isLogOut = false,
  });

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RotationTransition(
              turns: _controller,
              child: const CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                backgroundColor: AppColors.fillDeal_Home,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              !widget.isLogOut ? '読み込み中' : 'ログアウト中',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
