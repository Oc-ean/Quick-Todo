import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/utils/card_animation.dart';
import 'package:todo_app/view_models/app_view_model.dart';

class TaskInfo extends StatelessWidget {
  const TaskInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, child) {
        print('Check this ${appViewModel.numTaskRemaining.toString()}');
        return CardAnimation(
          delay: 1,
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 5, 15, 0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(left: 14, top: 7, bottom: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "${appViewModel.numTask} tasks",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            appViewModel.numTask.toString(),
                            style: TextStyle(
                              fontSize: 23,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(left: 14, top: 7, bottom: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "${appViewModel.numTaskRemaining} completed",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            appViewModel.numTaskRemaining.toString(),
                            style: TextStyle(
                              fontSize: 23,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
