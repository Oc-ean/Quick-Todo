import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/add_task_page.dart';
import 'package:todo_app/pages/task_list_page.dart';
import 'package:todo_app/utils/card_animation.dart';
import 'package:todo_app/utils/day_time.dart';
import 'package:todo_app/utils/setting_option.dart';

import 'package:todo_app/view_models/app_view_model.dart';

import '../utils/task_info.dart';
import '../utils/theme_button.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => const CardAnimation(
                        delay: 1, child: SettingsOptions()));
              },
              icon: const Icon(Icons.settings, color: Colors.grey),
            ),
            actions: [
              ChangeThemeButton(),
            ],
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Timecall(),
                ),
                const Expanded(
                  flex: 1,
                  child: TaskInfo(),
                ),
                Expanded(
                  flex: 7,
                  child: Consumer<AppViewModel>(
                      builder: (context, appViewModel, child) {
                    appViewModel.loadTaskList();
                    return Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      padding:
                          const EdgeInsets.only(top: 15, left: 15, right: 15),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                          color: appViewModel.color2),
                      child: Builder(builder: (context) {
                        return Center(
                          child: appViewModel.task.isEmpty
                              ? const Text(
                                  'NO Tasks',
                                  style: TextStyle(fontSize: 18),
                                )
                              : ListView.separated(
                                  // shrinkWrap: true,
                                  // padding: const EdgeInsets.all(15),
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 15);
                                  },
                                  itemCount: appViewModel.numTask,
                                  itemBuilder: (
                                    context,
                                    index,
                                  ) {
                                    final currentTask =
                                        appViewModel.task[index];
                                    return CardAnimation(
                                      delay: 1,
                                      child: TaskListPage(
                                        taskText: currentTask.title,
                                        taskModel: currentTask,
                                        value: currentTask.isCompleted,
                                        checkBoxOnTapped: (value) {
                                          appViewModel.setTaskValue(
                                              index, currentTask);
                                        },
                                      ),
                                    );
                                  }),
                        );
                      }),
                    );
                  }),
                ),
              ],
            ),
          ),
          floatingActionButton: CardAnimation(
            delay: 1.2,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageTransition(
                      child: const AddTaskPage(),
                      type: PageTransitionType.fade),
                );
                HapticFeedback.heavyImpact();
                // appViewModel.bottomSheetBuilder(
                //     const TaskBottomSheet(), context);
              },
              child: const Icon(CupertinoIcons.add),
            ),
          ),
        );
      },
    );
  }
}
