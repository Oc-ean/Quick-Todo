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
    // return SizedBox(
    //   width: width * 2,
    //   height: height * 0.16,
    //   child: Consumer<AppViewModel>(
    //     builder: (context, appViewModel, child) {
    //       return SingleChildScrollView(
    //         scrollDirection: Axis.horizontal,
    //         child: Row(
    //           children: [
    //             Card(
    //               margin: const EdgeInsets.only(left: 23),
    //               shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(15)),
    //               clipBehavior: Clip.antiAlias,
    //               elevation: 2,
    //               shadowColor: Colors.black.withOpacity(0.2),
    //               child: Container(
    //                 width: width * 0.5,
    //                 height: height * 0.1,
    //                 margin: const EdgeInsets.only(
    //                   top: 14,
    //                   left: 14,
    //                 ),
    //                 child: SingleChildScrollView(
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         "${appViewModel.numTask} tasks",
    //                         style:
    //                             TextStyle(color: Colors.grey.withOpacity(0.9)),
    //                       ),
    //                       SizedBox(
    //                         height: height * 0.01,
    //                       ),
    //                       Text(
    //                         appViewModel.numTaskRemaining.toString(),
    //                         style: const TextStyle(
    //                           fontSize: 23,
    //                           color: Colors.grey,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                       // SizedBox(height: height * 0.01),
    //                       // Padding(
    //                       //   padding: const EdgeInsets.only(right: 30),
    //                       //   child: Text(
    //                       //     'Me',
    //                       //     style:
    //                       //         TextStyle(color: Theme.of(context).primaryColor),
    //                       //   ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Card(
    //               margin: const EdgeInsets.only(left: 23),
    //               shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(15)),
    //               clipBehavior: Clip.antiAlias,
    //               elevation: 2,
    //               shadowColor: Colors.black.withOpacity(0.2),
    //               child: Container(
    //                 width: width * 0.5,
    //                 height: height * 0.1,
    //                 margin: const EdgeInsets.only(
    //                   top: 14,
    //                   left: 14,
    //                 ),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       "${appViewModel.numTask} tasks",
    //                       style: TextStyle(color: Colors.grey.withOpacity(0.9)),
    //                     ),
    //                     SizedBox(
    //                       height: height * 0.01,
    //                     ),
    //                     Text(
    //                       appViewModel.numTaskRemaining.toString(),
    //                       style: const TextStyle(
    //                         fontSize: 23,
    //                         color: Colors.grey,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                     // SizedBox(height: height * 0.01),
    //                     // Padding(
    //                     //   padding: const EdgeInsets.only(right: 30),
    //                     //   child: Text(
    //                     //     'Me',
    //                     //     style:
    //                     //         TextStyle(color: Theme.of(context).primaryColor),
    //                     //   ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, child) {
        return CardAnimation(
          delay: 1,
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 10, 15, 3),
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
                            appViewModel.length().toString(),
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
