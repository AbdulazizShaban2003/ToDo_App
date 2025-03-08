import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskController extends ChangeNotifier {
  final TextEditingController dateController = TextEditingController();


  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  TaskController() {
    dateController.text = DateFormat.yMd().format(DateTime.now());
    startTimeController.text = "09:33 PM";
    endTimeController.text = "10:33 PM";
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      dateController.text = DateFormat.yMd().format(pickedDate);
      notifyListeners();
    }
  }

  Future<void> selectTime(BuildContext context, TextEditingController controller) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      controller.text = pickedTime.format(context);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    dateController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    super.dispose();
  }
}
