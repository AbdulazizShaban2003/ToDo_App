import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' show ExpandingDotsEffect, SmoothPageIndicator;

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: ExpandingDotsEffect(),
    );
  }
}
