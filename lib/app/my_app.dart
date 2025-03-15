import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/theme.dart';
import '../core/utils/app_strings.dart';
import '../features/auth/presentation/screens/splash_screen/splash_screen.dart';
import '../features/task/presentation/cubit/task_cubit.dart';
import '../features/task/presentation/cubit/task_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            return MaterialApp(
                title: AppStrings.appName,
                theme: getAppTheme(),
                darkTheme: getAppDarkTheme(),
                themeMode: BlocProvider.of<TaskCubit>(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: const SplashScreen());
          },
        );
      },
    );
  }
}
