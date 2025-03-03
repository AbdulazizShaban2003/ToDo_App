import 'package:sqflite/sqflite.dart' as SQL;
import 'package:path/path.dart';
import 'package:todo_app/models/dataModel.dart';

class DatabaseNotes {
  static SQL.Database? _database;

  Future<SQL.Database> checkExistDatabase() async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<SQL.Database> initDatabase() async {
    String path = await SQL.getDatabasesPath();
    String nameDatabase = 'Notes.db';
    String myDatabase = join(path, nameDatabase);
    return await SQL.openDatabase(myDatabase, version: 1,
        onCreate: (db, version) {
      db.execute("CREATE TABLE IF NOT EXISTS Notes"
          "(id INTEGER PRIMARY KEY, "
          "title TEXT,"
          "describe TEXT,"
          "Date TEXT,"
          "time TEXT)");
    });
  }

  Future<List<DataModel>> getDatabase() async {
    final db = await checkExistDatabase();
    var data = await db.rawQuery("SELECT * FROM Notes");
    List<DataModel> notes =
        List.generate(data.length, (index) => DataModel.fromMap(data[index]));
    return notes;
  }

  Future<void> insertData(
      {required String title,
      required String describe,
      required String Date,
      required String time}) async {
    final db = await checkExistDatabase();
    await db.rawInsert(
        "INSERT INTO Notes (title, describe, Date, time) VALUES (?, ?, ?, ?)",
        [title, describe, Date, time]);
  }

  Future<void> editData(DataModel note) async {
    final db = await checkExistDatabase();
    await db.rawUpdate(
        "UPDATE Notes SET title = ?, describe = ?, Date = ?, time = ? WHERE id = ?",
        [note.title, note.describe, note.Date, note.time, note.id]);
  }

  Future<void> deleteData(int id) async {
    final db = await checkExistDatabase();
    await db.rawDelete("DELETE FROM Notes WHERE id = ?", [id]);
  }

  Future<void> closeDatabase() async {
    await DatabaseNotes._database!.close();
  }
}
