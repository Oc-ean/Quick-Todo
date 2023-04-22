import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:todo_app/view_models/theme_view_model.dart';

class ChangeThemeButton extends StatefulWidget {
  ChangeThemeButton({Key? key}) : super(key: key);

  @override
  State<ChangeThemeButton> createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends State<ChangeThemeButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeViewModel>(builder: (context, themeProvider, child) {
      // final themeProvider = Provider.of<ThemeProvider>(context);
      return IconButton(
        onPressed: () {
          print("Hello");
          Provider.of<ThemeViewModel>(context, listen: false).toggleTheme();
        },
        icon: Icon(
          Theme.of(context).brightness == Brightness.light
              ? Icons.light_mode
              : Icons.brightness_6,
          color: Colors.grey,
        ),
      );
    });
  }
}
