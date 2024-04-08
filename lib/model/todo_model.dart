import 'package:hive_flutter/hive_flutter.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 1)
class TodoModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  bool isChecked;
  @HiveField(2)
  String category;

  TodoModel(
      {required this.title, required this.isChecked, required this.category});
}
