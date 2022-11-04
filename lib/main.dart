
import 'package:flutter/material.dart';
import 'package:check_list/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:check_list/task_data.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build( context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
    //   theme: ThemeData.dark().copyWith(
    // primaryColor: Color(0xFF0A0E21),
    // scaffoldBackgroundColor: Color(0xFF0A0E21),),
        home: TasksScreen(),
      ),
    );
  }
}

