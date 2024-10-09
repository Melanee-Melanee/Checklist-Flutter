import 'package:flutter/material.dart';
import 'package:check_list/task_tile.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:check_list/task_data.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(context) {

    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return Padding(
          padding: const EdgeInsets.all(0.0),
          child:
          ListView.builder(
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];

              return TaskTile(
                taskTitle: task.name ?? '',
                isChecked: task.isDone,
                // backgroundColor: index%2 == 0 ? Color(0XFFFFCDD2) :  Colors.white,
                checkboxCallback: (bool checkboxState) {
                  taskData.updateTask(task);
                },
                longPressCallBack: () {
                  taskData.deleteTask(index);
                },
              );
            },
            itemCount: taskData.tasks.length,
          ),
        );

      },
    );
  }
}
