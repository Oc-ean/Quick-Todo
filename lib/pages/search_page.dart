import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/task_list_page.dart';
import 'package:todo_app/utils/card_animation.dart';
import 'package:todo_app/view_models/app_view_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppViewModel appViewModel =
        Provider.of<AppViewModel>(context, listen: false);
    appViewModel.taskSearched = appViewModel.task;
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : const Color(0xFF5b5d61),
      body: SafeArea(
        child: CardAnimation(
            delay: 1.0,
            child:
                Consumer<AppViewModel>(builder: (context, appViewModel, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          width: 47,
                          height: 47,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffF4F6FD),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 280,
                          child: TextField(
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                            onChanged: (value) {
                              appViewModel.searchThroughTask(value);
                            },
                            decoration: const InputDecoration(
                              hintText: 'Search For tasks',
                            ),
                          ),
                        ),
                      ],
                    ),
                    appViewModel.taskSearched.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                // padding: const EdgeInsets.all(15),
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 15);
                                },
                                itemCount: appViewModel.taskSearched.length,
                                itemBuilder: (
                                  context,
                                  index,
                                ) {
                                  final currentTask =
                                      appViewModel.taskSearched[index];
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
                          )
                        : Container(
                            padding: const EdgeInsets.only(top: 350),
                            child: const Text(
                              'No To-do found',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ],
                ),
              );
            })),
      ),
    );
  }
}
