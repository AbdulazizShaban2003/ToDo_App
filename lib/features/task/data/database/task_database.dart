import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/features/task/data/models/task_model.dart';

class TaskDatabase {
  static Database? _database;

  Future<Database> checkExistDatabase() async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = await getDatabasesPath();
    String nameDatabase = 'Notes.db';
    String myDatabase = join(path, nameDatabase);

    return await openDatabase(
      myDatabase,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE IF NOT EXISTS Notes ("
              "id INTEGER PRIMARY KEY, "
              "title TEXT, "
              "note TEXT, "
              "startTime TEXT, "
              "endTime TEXT, "
              "color INTEGER"
              ")",
        );
      },
    );
  }

  Future<List<TaskModel>> getDatabase() async {
    final db = await checkExistDatabase();
    var data = await db.rawQuery("SELECT * FROM Notes");

    List<TaskModel> tasks = data.map((e) => TaskModel.fromJson(e)).toList();
    return tasks;
  }

  Future<void> insertData({
    required String title,
    required String note,
    required String startTime,
    required String endTime,
    required int color,
  }) async {
    final db = await checkExistDatabase();
    await db.insert(
      "Notes",
      {
        "title": title,
        "note": note,
        "startTime": startTime,
        "endTime": endTime,
        "color": color,
      },
    );
  }

  Future<void> editData(TaskModel task) async {
    final db = await checkExistDatabase();
    await db.update(
      "Notes",
      task.toJson(),
      where: "id = ?",
      whereArgs: [task.id],
    );
  }

  Future<void> deleteData(int id) async {
    final db = await checkExistDatabase();
    await db.delete("Notes", where: "id = ?", whereArgs: [id]);
  }

  Future<void> closeDatabase() async {
    final db = await checkExistDatabase();
    await db.close();
  }
}
