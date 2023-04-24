import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/user_model.dart';
import 'package:todo_app/utils/delete_dialog.dart';
import 'package:todo_app/utils/hive_boxes.dart';

class AppViewModel with ChangeNotifier {
  List<TaskModel> task = [];
  User user = User('Ocean423');
  TextEditingController textEditingController = TextEditingController();

  Color color1 = Colors.grey.shade100;
  Color color2 = Colors.grey.shade300;
  Color color3 = Colors.grey.shade800;
  Color color4 = Colors.grey.shade900;
  bool isCompleted = false;

  int get numTask => task.length;

  int get numTaskRemaining => task.where((task) => task.isCompleted).length;

  /// Hive crud.....

  // loading the list from hive local database...
  void loadTaskList() {
    print("<===== Load notes list =====>");
    print('${task.toString()}');
    task = Boxes.getTodoList().values.toList();

    for (TaskModel todo in task) {
      print('All task =====> ${todo.toJson()}');
    }
  }

  // checkBox function...
  bool getTaskValue(int index) {
    return task[index].isCompleted;
  }

  // setting task value...
  setTaskValue(int index, TaskModel taskModel) {
    final newTodo = taskModel..isCompleted = !taskModel.isCompleted;

    newTodo.save();
    print('Checkbox<============>${newTodo}<=============>');
    notifyListeners();
  }

  // adding tasks functionality....
  addTask(
    BuildContext context,
  ) {
    if (textEditingController.text.isNotEmpty) {
      TaskModel task = TaskModel(
        title: textEditingController.text,
        isCompleted: false,
      );
      final todoBox = Boxes.getTodoList();
      todoBox.add(task);
      print('Adding task');

      notifyListeners();
      Navigator.pop(context);
      textEditingController.clear();
    }
  }

  // edit function..

  editTask(TaskModel oldTask, BuildContext context) {
    TaskModel newTask = oldTask..title = textEditingController.text;
    newTask.save();
    // print('Saving edited task =====>${newTask.toJson()}');
    // textEditingController.clear();
    Navigator.pop(context);
    notifyListeners();
  }

  // delete function..
  deletedTask(TaskModel taskModel, BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) {
          return TodoDeleteBox(
            onPressed: () {
              taskModel.delete();
              Navigator.pop(context);

              // print('<============>${taskModel.delete()}<=============>');
              notifyListeners();
            },
          );
        });
  }

  // deleting all task function....
  deleteAllTask() async {
    print(
        'Deleting<==========> ${await Boxes.getTodoList().clear()}<==============>');

    notifyListeners();
  }

  // deleting completed task...
  deleteCompletedTasks() async {
    for (var element in task) {
      if (element.isCompleted) {
        // print("DeleteCompleted => ${element.title}");
        // print("DeleteCompleted => ${element.isCompleted}");
        element.delete();
      }
    }

    notifyListeners();
  }

  // bottom sheet...
  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: ((context) {
          return bottomSheetView;
        }));
    notifyListeners();
  }

  // getting task length..
  length() {
    int len = task.length;
    return len;
  }

  // search for a task function..

  List<TaskModel> taskSearched = [];

  searchThroughTask(String enterTask) {
    List<TaskModel> results = [];
    if (enterTask.isEmpty) {
      results = task;
    } else {
      results = taskSearched
          .where((element) => element.title
              .toString()
              .toLowerCase()
              .contains(enterTask.toLowerCase()))
          .toList();
    }
    taskSearched = results;
    notifyListeners();
  }
}
