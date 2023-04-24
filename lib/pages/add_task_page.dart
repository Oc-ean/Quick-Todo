import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/utils/card_animation.dart';
import 'package:todo_app/view_models/app_view_model.dart';

class AddTaskPage extends StatelessWidget {
  final dynamic taskModel;
  const AddTaskPage({Key? key, this.taskModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, index) {
        return Scaffold(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? const Color(0xffF4F6FD)
              : const Color(0xFF5b5d61),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              child: Column(
                children: [
                  CardAnimation(
                    delay: 0.2,
                    child: Container(
                      margin: EdgeInsets.only(top: he * 0.05, left: we * 0.73),
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle),
                      child: Container(
                        width: 47,
                        height: 47,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF4F6FD),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),

                      // return AlertDialog(
                      //   title: const Text(
                      //     'Create a Task',
                      //     textAlign: TextAlign.left,
                      //   ),
                      //   content: Column(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       // _isLoading == true
                      //       //     ? Center(
                      //       //   child: CircularProgressIndicator(
                      //       //     color: Theme.of(context).primaryColor,
                      //       //   ),
                      //       // )
                      //       TextField(
                      //         controller: appViewModel.textEditingController,
                      //         keyboardType: TextInputType.visiblePassword,
                      //         // onChanged: (val) {
                      //         //   setState(() {
                      //         //     groupName = val;
                      //         //   });
                      //         // },
                      //         decoration: InputDecoration(
                      //           enabledBorder: OutlineInputBorder(
                      //             borderSide:
                      //                 BorderSide(color: Theme.of(context).primaryColor),
                      //             borderRadius: BorderRadius.circular(20),
                      //           ),
                      //           errorBorder: OutlineInputBorder(
                      //             borderSide: const BorderSide(color: Colors.red),
                      //             borderRadius: BorderRadius.circular(20),
                      //           ),
                      //           focusedBorder: OutlineInputBorder(
                      //             borderSide:
                      //                 BorderSide(color: Theme.of(context).primaryColor),
                      //             borderRadius: BorderRadius.circular(20),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      //   actions: [
                      //     ElevatedButton(
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //       },
                      //       child: const Text('Cancel'),
                      //       style: ElevatedButton.styleFrom(
                      //         backgroundColor: Theme.of(context).primaryColor,
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 10,
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.only(right: 40),
                      //       child: ElevatedButton(
                      //         onPressed: () {
                      //           appViewModel.addTask(
                      //             context,
                      //           );
                      //         },
                      //         child: const Text('Create'),
                      //         style: ElevatedButton.styleFrom(
                      //           backgroundColor: Theme.of(context).primaryColor,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // );
                    ),
                  ),
                  CardAnimation(
                    delay: 0.3,
                    child: Container(
                      width: we * 8,
                      height: he * 0.49,
                      margin: EdgeInsets.only(top: he * 0.3, left: we * 0.1),
                      child: TextField(
                        controller: appViewModel.textEditingController,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: 'Enter new task',
                          hintStyle: GoogleFonts.lato(
                              color: Theme.of(context).primaryColor,
                              fontSize: 27),
                        ),
                        style: GoogleFonts.lato(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 27),
                      ),
                    ),
                  ),
                  CardAnimation(
                    delay: 0.4,
                    child: Container(
                      width: we * 0.4,
                      height: 50,
                      margin: EdgeInsets.only(left: we * 0.45),
                      child: ElevatedButton(
                          onPressed: () {
                            if (taskModel != null) {
                              appViewModel.editTask(taskModel!, context);
                            } else {
                              appViewModel.addTask(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).brightness == Brightness.light
                                    ? const Color(0xFF002FFF)
                                    : const Color(0xFF3d3e40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Save",
                                style: GoogleFonts.lato(color: Colors.white),
                              ),
                              SizedBox(
                                width: we * 0.03,
                              ),
                              const Icon(
                                Icons.edit,
                                color: Colors.white,
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
