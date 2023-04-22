import 'package:hive/hive.dart';

import 'package:todo_app/models/task_model.dart';

class Boxes {
  static Box getNotes() => Hive.box('todo');
  static Box<TaskModel> getTodoList() => Hive.box<TaskModel>('todoBox');
}
