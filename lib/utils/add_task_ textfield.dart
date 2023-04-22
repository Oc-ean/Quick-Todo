import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/app_view_model.dart';

class AddTaskTextField extends StatelessWidget {
  const AddTaskTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, appViewModel, child) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
            height: 80,
            child: Center(
              child: SizedBox(
                height: 40,
                width: 250,
                child: TextField(
                  onSubmitted: (value) {
                    appViewModel.addTask(context);
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5),
                      filled: true,
                      fillColor: appViewModel.color2,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none))),
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: appViewModel.color4,
                  autofocus: true,
                  autocorrect: false,
                  controller: appViewModel.textEditingController,
                  style: TextStyle(
                      color: appViewModel.color4, fontWeight: FontWeight.w500),
                ),
              ),
            )),
      );
    });
  }
}
