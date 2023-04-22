import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/view_models/app_view_model.dart';

class DeleteBottomSheetView extends StatelessWidget {
  const DeleteBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, appViewModel, child) {
      return Container(
        height: 125,
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF3d3e40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  appViewModel.deleteAllTask();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: appViewModel.color1,
                  backgroundColor: appViewModel.color3,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Delete All")),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton(
              onPressed: () {
                appViewModel.deleteCompletedTasks();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: appViewModel.color1,
                backgroundColor: appViewModel.color3,
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text("Delete Completed"),
            ),
          ],
        ),
      );
    });
  }
}
