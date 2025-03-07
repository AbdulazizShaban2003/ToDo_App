import 'package:flutter/material.dart';

import '../../../core/themes/app_color.dart';

class BuildContainer extends StatelessWidget {
  const BuildContainer({
    super.key,
    required this.theme, required this.action, required this.onPressed, required this.color,
  });
   final String action;
  final TextTheme theme;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            action,
            style: theme.displayMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
