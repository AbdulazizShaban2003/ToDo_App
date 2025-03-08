import 'package:flutter/material.dart';
import 'package:todo_app/core/database/cache_helper.dart';
import 'package:todo_app/core/themes/app_color.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/auth/presentation/screens/onBoarding_view.dart';
import 'package:todo_app/features/home/views/home_view.dart';
import '../../../../core/services/di.dart';
import '../../../../core/utils/app_asstes.dart' show AppAsstes;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _textSlideAnimation;

  @override
  void initState() {
    super.initState();
    navigateTo();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _textSlideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  void navigateTo() {
    Future.delayed(Duration(seconds: 3), () {
      bool isVisit =
          s1<CacheHelper>().getData(key: MyString.onBoardingKey) ?? false;
      Navigator.pushReplacement(
      context,
        MaterialPageRoute(
          builder: (_) => !isVisit ? const OnboardingView() : const HomeView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: Image(image: AssetImage(AppAsstes.logoApp)),
            ),
            SizedBox(height: 15),
            SlideTransition(
              position: _textSlideAnimation,
              child: Text(MyString.nameApp, style: theme.titleLarge),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
