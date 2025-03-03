import 'package:todo_app/core/utils/app_strings.dart';

import '../../../core/utils/app_asstes.dart' show AppAsstes;

class OnBoardingModel {
  final String imgPath;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.imgPath,
    required this.title,
    required this.subTitle,
  });

  static List<OnBoardingModel> listOnBoardingView = [
    OnBoardingModel(
      imgPath: AppAsstes.onBoarding1,
      title: MyString.titleOnBoardingPage1,
      subTitle: MyString.subtitleOnBoardingPage1,
    ),
    OnBoardingModel(
      imgPath: AppAsstes.onBoarding2,
      title: MyString.titleOnBoardingPage2,
      subTitle: MyString.subtitleOnBoardingPage2,
    ),
    OnBoardingModel(
      imgPath: AppAsstes.onBoarding3,
      title: MyString.titleOnBoardingPage3,
      subTitle: MyString.subtitleOnBoardingPage3,
    ),
  ];
}
