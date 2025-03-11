
abstract  class TaskState {}

class TaskInitial extends TaskState {}
class SelectColorState extends TaskState{
  final int currentIndex;

  SelectColorState(this.currentIndex);
}
class TaskUpdated extends TaskState {
  final String date;
  final String startTime;
  final String endTime;
  TaskUpdated({required this.date, required this.startTime, required this.endTime});

}

