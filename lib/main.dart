import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/my_app.dart';
import 'core/bloc/bloc_observer.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/database/sqflite_helper/sqflite_helper.dart';
import 'core/services/local_notification_service.dart';
import 'core/services/service_locator.dart';
import 'core/services/work_manager_service.dart';
import 'features/task/presentation/cubit/task_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await setup();
  await sl<CacheHelper>().init();
  await Future.wait([
    LocalNotificationService.init(),
    WorkManagerService().init(),
  ]);
  sl<SqfliteHelper>().intiDB();

  runApp(
    BlocProvider(
      create: (context) => TaskCubit()
        ..getTheme()
        ..getTasks(),
      child: const MyApp(),
    ),
  );
}