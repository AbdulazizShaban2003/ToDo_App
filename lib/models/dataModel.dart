class DataModel{
  int ? id;
  String ? title;
  String ? describe;
  String ? Date;
  String ? time;
  DataModel({ required this.id,required this.title,required this.describe,required this.Date,required this.time});
  DataModel.fromMap(Map<String, dynamic> NoteData){
    id=NoteData['id'];
    title=NoteData['title'];
    describe=NoteData['describe'];
    Date=NoteData['Date'];
    time=NoteData['time'];
  }
}