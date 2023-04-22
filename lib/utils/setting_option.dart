import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/search_page.dart';
import 'package:todo_app/utils/delete_bottom_sheet.dart';
import 'package:todo_app/view_models/app_view_model.dart';

class SettingsOptions extends StatelessWidget {
  const SettingsOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, appViewModel, child) {
      return SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: () {
              Navigator.of(context).push(
                PageTransition(
                    child: const SearchPage(), type: PageTransitionType.fade),
              );
              HapticFeedback.heavyImpact();
              // appViewModel.bottomSheetBuilder(
              //     const TaskBottomSheet(), context);
            },
            child: const Text(
              'Search',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
            ),
          ),
          SimpleDialogOption(
            onPressed: () => appViewModel.bottomSheetBuilder(
                const DeleteBottomSheetView(), context),
            child: const Text(
              'Delete all',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      );
    });
  }
}
