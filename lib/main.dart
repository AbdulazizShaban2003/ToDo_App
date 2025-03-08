import 'package:flutter/material.dart';
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider;
import 'package:todo_app/core/database/cache_helper.dart';
import 'package:todo_app/features/auth/presentation/screens/splash_screen.dart';
import 'core/services/di.dart' show s1, setup;
import 'core/themes/app_theme.dart';
import 'features/home/controller/task_controller.dart' show TaskController;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await s1<CacheHelper>().init();
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => TaskController()),
          ],

          child: const MyApp()));
      }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const SplashScreen(),
    );
  }
}
