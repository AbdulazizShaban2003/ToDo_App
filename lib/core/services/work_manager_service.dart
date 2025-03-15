import 'package:workmanager/workmanager.dart';
import 'local_notification_service.dart';

class WorkManagerService {
  void registerMyTask() async {
    await Workmanager().registerPeriodicTask(
      'id1', // معرف المهمة
      'show_simple_notification', // اسم المهمة
      frequency: const Duration(hours: 12),
    );
  }

  // تهيئة Workmanager
  Future<void> init() async {
    await Workmanager().initialize(
      callbackDispatcher, // استخدم `callbackDispatcher` هنا
      isInDebugMode: true,
    );
    registerMyTask();
  }

  void cancelAllTasks() {
    Workmanager().cancelAll();
  }
}

@pragma('vm-entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    await LocalNotificationService.init();
    await LocalNotificationService.showDailyScheduledNotification();
    return Future.value(true);
  });
}
