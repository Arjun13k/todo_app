import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/model/todo_model.dart';

class TodoController {
  static List todolistKey = [];
  // hive ref
  static var myBox = Hive.box<TodoModel>('todoBox');

  static deleteData(var Key) async {
    await myBox.delete(Key);
    initKey();
  }

  static addData(TodoModel item) async {
    await myBox.add(item);
    initKey();
  }

  static initKey() {
    todolistKey = myBox.keys.toList();
  }

  static TodoModel? getdata(var key) {
    return myBox.get(key);
  }
}
