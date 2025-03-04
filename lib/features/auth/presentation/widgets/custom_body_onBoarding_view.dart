import 'package:flutter/material.dart';
import 'package:todo_app/core/themes/app_color.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/auth/data/onBoarding_model.dart';
import 'package:todo_app/features/auth/presentation/components/dot_indicator.dart' show DotIndicator;
import 'package:todo_app/features/auth/presentation/widgets/custom_buttom_onBoarding.dart';

class CustomBodyOnBoardingView extends StatelessWidget {
  final PageController controller;

  final int index;

  const CustomBodyOnBoardingView({
    super.key,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;

    return Column(
      children: [
        index == 2
            ? Container()
            : Align(
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
            DotIndicator(controller: controller),
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

        CustomButtomOnBoarding(index: index, controller: controller),
      ],
    );
  }
}


