import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/pages/task_page.dart';

import 'package:todo_app/view_models/app_view_model.dart';
import 'package:todo_app/view_models/theme_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Init HiveDB
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(
    TaskModelAdapter(),
  );
  // await Hive.openBox('notes');
  await Hive.openBox<TaskModel>('todoBox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ThemeProvider themeProvider = ThemeProvider();
  // void getCurrentAppTheme() async {
  //   themeProvider.setDarkTheme = await themeProvider.darkThemePref.getTheme();
  // }
  //
  // @override
  // void initState() {
  //   getCurrentAppTheme();
  //   super.initState();
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppViewModel>(
            create: (context) => AppViewModel()),
        ChangeNotifierProvider<ThemeViewModel>(
            create: (context) => ThemeViewModel()),
      ],

      child: Consumer<ThemeViewModel>(
        builder: (context, themeViewModel, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeViewModel.lightTheme,
            darkTheme: ThemeViewModel.darkTheme,
            themeMode: themeViewModel.themeMode,
            // darkTheme: Mytheme.darkTheme,
            // theme: Mytheme.lightTheme,

            // theme: MyTheme.lightTheme,
            home: const TaskPage(),
          );
        },
      ),

      // child: MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   title: 'Flutter Demo',
      //   theme: context.watch<ThemeProvider>().currentTheme,
      //
      //   // darkTheme: Mytheme.darkTheme,
      //   // theme: Mytheme.lightTheme,
      //
      //   // theme: MyTheme.lightTheme,
      //   home: const TaskPage(),
      // ),
    );
  }
}
