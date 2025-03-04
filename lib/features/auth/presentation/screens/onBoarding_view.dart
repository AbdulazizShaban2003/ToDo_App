import 'package:flutter/material.dart';
import 'package:todo_app/core/themes/app_color.dart';
import 'package:todo_app/features/auth/presentation/widgets/custom_body_onBoarding_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CustomBodyOnBoardingView(
                    index: index,
                    controller: controller,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
