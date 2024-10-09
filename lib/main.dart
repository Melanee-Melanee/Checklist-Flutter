
import 'package:flutter/material.dart';
import 'package:check_list/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:check_list/task_data.dart';
import 'package:flutter/services.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build( context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}

