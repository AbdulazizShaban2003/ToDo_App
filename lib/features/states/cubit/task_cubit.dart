
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/features/states/cubit/task_state.dart';


class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial()) {
    dateController.text = DateFormat.yMd().format(DateTime.now());
    startTimeController.text = "09:33 PM";
    endTimeController.text = "10:33 PM";
  }
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  int ?currentIndex;

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      dateController.text = DateFormat.yMd().format(pickedDate);
      emit(TaskUpdated(
        date: dateController.text,
        startTime: startTimeController.text,
        endTime: endTimeController.text,
      ));
    }
  }

  Future<void> selectTime(BuildContext context, bool isStartTime) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      String formattedTime = pickedTime.format(context);
      if (isStartTime) {
        startTimeController.text = formattedTime;
      } else {
        endTimeController.text = formattedTime;
      }

      emit(TaskUpdated(
        date: dateController.text,
        startTime: startTimeController.text,
        endTime: endTimeController.text,
      ));
    }
  }

  @override
  Future<void> close() {
    dateController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    return super.close();
  }

  void selectColor(int index){
    currentIndex=index;
    emit(SelectColorState(index));
  }
}
