import "dart:developer";

import "package:sqflite/sqflite.dart";
import 'package:path/path.dart';
import "task.dart";

final TeskApi teskApi = TeskApi();

class TeskApi {
  late Database _database;
  Future<void> init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "new_tasks.db");

    _database = await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
      await db.execute(
        'CREATE TABLE Task (id INTEGER PRIMARY KEY, title TEXT, desc TEXT, date TEXT, isDone INTEGER)',
      );
      print("Table created");
    }, onOpen: (database) {
      print("Database opened");
    });
  }

  Future<List<Task>> getTasks() async {
    final rowData = await _database.rawQuery('SELECT * FROM Task');
    final tasks = rowData.map(
      (e) {
        return Task(
            title: e["title"] as String,
            date: DateTime.parse(e["date"] as String),
            description: e["desc"] as String,
            isDone: (e["isDone"] as int) == 0 ? false : true,
            id: e["id"] as int);
      },
    ).toList();
    return tasks;
  }

  Future<Task> addTask(
      {required String title,
      required String description,
      required DateTime date}) async {
    late Task createdTask;
    await _database.transaction((txn) async {
      final id = await txn.rawInsert(
        'INSERT INTO Task (title, desc, date, isDone) VALUES(?, ?, ?, ?)',
        [title, description, date.toIso8601String(), 0],
      );
      log("Task inserted", name: "database");
      createdTask = Task(
          title: title,
          description: description,
          id: id,
          date: date,
          isDone: false);
    });

    return createdTask;
  }

  void deleteTask(int id) async {
    //TODO Delte task
    await _database.rawDelete('DELETE FROM Task WHERE id = ?', [id]);
  }

  void updateTaskStatus(
      {int? id,
      required String title,
      required String description,
      required DateTime date,
      required bool isDone}) async {
    // Todo update task
    await _database
        .rawUpdate('UPDATE Task SET status = ? WHERE id = ?', ['Done', id]);
  }
}
