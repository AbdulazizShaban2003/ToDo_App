class TaskModel {
  int? id;
  String? title;
  String? describe;
  String? startTime;
  String? endTime;
  int ?color;

  TaskModel({
    this.id,
     this.title,
     this.describe,
     this.startTime,
     this.endTime,
     this.color
  });

  factory TaskModel.fromJson(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      describe: map['describe'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      color: map['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'describe': describe,
      'startTime': startTime,
      'endTime': endTime,
      'color':color
    };
  }
}
