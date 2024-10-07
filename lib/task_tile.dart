

import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final bool isChecked ;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallBack;
  final Color backgroundColor;

  TaskTile({this.isChecked,this.taskTitle, this.checkboxCallback, this.longPressCallBack,this.backgroundColor});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.backgroundColor ?? Color(0XFFFFCDD2),
      child: Card(
        color: Colors.white,
        shadowColor: Color(0XFFFFCDD2),
        shape:
        RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(30)
        ),
        child: ListTile(
          onLongPress: widget.longPressCallBack,
          title: Text(
            widget.taskTitle,
            style:
            TextStyle(decoration: widget.isChecked ? TextDecoration.lineThrough : null,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Grandstander',

            ),
          ),
          trailing:  Checkbox(
            activeColor: Color(0XFF4fc3f7),
            value: widget.isChecked,
            onChanged: widget.checkboxCallback,


          ),
        ),
      ),
    );
  }
}




