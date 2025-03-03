import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/core/utils/app_color.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/auth/data/onBoarding_model.dart';

class CustomBodyOnBoardingView extends StatelessWidget {
  final PageController controller ;
  final int index;

  const CustomBodyOnBoardingView({super.key, required this.index, required this.controller});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            MyString.skip,
            style: TextStyle(color: AppColor.GreyColor, fontSize: 25),
          ),
        ),
        SizedBox(height: 30),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                OnBoardingModel.listOnBoardingView[index].imgPath,
              ),
            ),
            const SizedBox(height: 30),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: ExpandingDotsEffect(),
            ),
            const SizedBox(height: 30),

            Text(
              OnBoardingModel.listOnBoardingView[index].title,
              style: theme.titleLarge!.copyWith(fontSize: 40),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            Text(
              OnBoardingModel.listOnBoardingView[index].subTitle,
              style: theme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Spacer(),

        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            children: [
              Text(
                MyString.back,
                style: TextStyle(color: AppColor.GreyColor, fontSize: 25),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryLightColor,
                ),
                child: Text(
                  MyString.next,
                  style: TextStyle(fontSize: 20, color: AppColor.whiteColor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
