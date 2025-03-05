import 'package:get_it/get_it.dart';

import '../database/cache_helper.dart';

final  s1 =GetIt.instance;

void setup() {
  s1.registerSingleton<CacheHelper>(CacheHelper());
}