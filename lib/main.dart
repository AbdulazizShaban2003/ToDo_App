import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/database/cache_helper.dart';
import 'app/my_app.dart';
import 'core/services/di.dart' show s1, setup;
import 'features/states/cubit/task_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await s1<CacheHelper>().init();
  runApp(
    BlocProvider(create:(BuildContext context)=>TaskCubit(),
    child:  const MyApp()),
    );

      }

