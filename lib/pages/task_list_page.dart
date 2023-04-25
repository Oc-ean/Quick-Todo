import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/pages/add_task_page.dart';
import 'package:todo_app/utils/delete_dialog.dart';
import 'package:todo_app/view_models/app_view_model.dart';

class TaskListPage extends StatelessWidget {
  final TaskModel? taskModel;
  final dynamic value;
  final dynamic taskText;
  final dynamic checkBoxOnTapped;

  const TaskListPage(
      {Key? key,
      required this.taskModel,
      required this.value,
      required this.checkBoxOnTapped,
      required this.taskText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, index) {
        return InkWell(
          onTap: () {
            AppViewModel appViewModel =
                Provider.of<AppViewModel>(context, listen: false);
            appViewModel.textEditingController.text = taskModel!.title!;
            // appViewModel.editingTitle.text = taskModel!.title;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddTaskPage(
                          taskModel: taskModel!,
                        )));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20,
              ),
              color: appViewModel.color1,
            ),
            child: ListTile(
              leading: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(width: 2, color: appViewModel.color3),
                ),
                activeColor: appViewModel.color3,
                value: value,
                onChanged: checkBoxOnTapped,
              ),
              title: Text(
                taskText,
                style: TextStyle(
                  decorationColor:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.grey
                          : Colors.black,
                  decoration: value ? TextDecoration.lineThrough : null,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: InkWell(
                onTap: () {
                  appViewModel.deletedTask(taskModel!, context);
                  print('==========> Clicked<========');
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
