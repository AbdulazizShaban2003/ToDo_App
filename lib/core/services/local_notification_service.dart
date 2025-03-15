import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../../features/task/data/model/task_model.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static final StreamController<NotificationResponse> streamController =
  StreamController();

  static Future<void> init() async {
    const InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );

    // تهيئة المناطق الزمنية مرة واحدة فقط
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
  }

  static void onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  static Future<void> showBasicNotification() async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'id_1', 'Basic Notification',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('sound'),
    );

    const NotificationDetails details = NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.show(
      0, 'Basic Notification', 'This is a basic notification', details,
      payload: "Payload Data",
    );
  }

  static Future<void> showRepeatedNotification() async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'id_2', 'Repeated Notification',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'Repeated Notification',
      'This notification repeats daily',
      RepeatInterval.daily,
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, // ✅ إضافة هذا السطر
      payload: "Payload Data",
    );
  }

  static Future<void> showScheduledNotification({
    required DateTime currentDate,
    required TimeOfDay scheduledTime,
    required TaskModel taskModel,
  }) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'id_3', 'Scheduled Notification',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(android: androidDetails);

    tz.TZDateTime scheduledDateTime = tz.TZDateTime(
      tz.local,
      currentDate.year,
      currentDate.month,
      currentDate.day,
      scheduledTime.hour,
      scheduledTime.minute,
    ).subtract(const Duration(minutes: 1));

    log("Scheduled Time: $scheduledDateTime"); // طباعة التوقيت للتحقق منه

    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      taskModel.title.isNotEmpty ? taskModel.title : "No Title",
      taskModel.note.isNotEmpty ? taskModel.note : "No Note",
      scheduledDateTime,
      details,
      payload: 'Title: ${taskModel.title}, Note: ${taskModel.note}',
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, // ✅ أضف هذا السطر
    );

  }

  static Future<void> showDailyScheduledNotification() async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'id_4', 'Daily Scheduled Notification',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(android: androidDetails);

    tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledTime = tz.TZDateTime(tz.local, now.year, now.month, now.day, 21);

    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    log("Daily Scheduled Time: $scheduledTime"); // طباعة التوقيت للتحقق منه

    await flutterLocalNotificationsPlugin.zonedSchedule(
      3,
      'Write your tasks for tomorrow',
      'Have a productive day',
      scheduledTime,
      details,
      payload: 'zonedSchedule',
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, // ✅ استخدم هذا بدل androidAllowWhileIdle
    );

  }

  static Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  static Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
