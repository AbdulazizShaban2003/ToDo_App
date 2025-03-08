import 'package:flutter/material.dart';
import 'package:todo_app/core/services/di.dart';
import 'package:todo_app/features/home/views/home_view.dart';

import '../../../../core/database/cache_helper.dart';
import '../../../../core/themes/app_color.dart';
import '../../../../core/utils/app_strings.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding({
    super.key,
    required this.index,
    required this.controller,
  });

  final int index;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          if (index > 0) CustomBackButton(controller: controller),
          const Spacer(),
          ElevatedButton(
            onPressed: () async {
              if (index == 2) {
                try {
                  await s1<CacheHelper>()
                      .saveData(key: MyString.onBoardingKey, value: true)
                      .then((value) {
                        print("is visied");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeView()),
                        );
                      });
                } catch (e) {
                  debugPrint('Error saving data: $e');
                }
              } else {
                controller.nextPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutCubicEmphasized,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryLightColor,
            ),
            child: Text(
              index == 2 ? MyString.getStarted : MyString.next,
              style: TextStyle(fontSize: 20, color: AppColor.whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        controller.previousPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
        );
      },
      child: Text(
        MyString.back,
        style: TextStyle(color: AppColor.GreyColor, fontSize: 25),
      ),
    );
  }
}
