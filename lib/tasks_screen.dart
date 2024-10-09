import 'package:flutter/material.dart';
import 'package:check_list/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:check_list/task_data.dart';
import 'package:check_list/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:check_list/background.dart';


class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    super.initState();
    getTasklist();
  }

  void getTasklist() async {
    try {
      await Provider.of<TaskData>(context,listen: false).readList();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build( context) {
    return Consumer<TaskData>(builder: (context, data, child) {
      if (data.tasks == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Scaffold(
          backgroundColor: Color(0XFFFFCDD2),
          body: Background(
            numOfTask: Provider
                .of<TaskData>(context, listen: true)
                .taskCount,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: TasksList(),
                ),
                  ],
      ),

          ),
          bottomNavigationBar: MyBottom(),
          floatingActionButton: FloatingActionButton(
            backgroundColor:
            Color(0XFFE53935),
            child: Icon(Icons.add, size: 40,),
            onPressed: (){
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => AddTaskScreen(),
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
    }
    }
    );
  }
}



class MyBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 40,
      ),
        color:  Color(0xffe1f5fe),
      shape: CircularNotchedRectangle(),
      notchMargin:10,
      clipBehavior: Clip.antiAlias,
    );
  }
}


