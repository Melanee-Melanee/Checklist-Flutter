import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:check_list/task_data.dart';
import 'package:check_list/background2.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _text = TextEditingController();
  bool _validate = false;

  String newTextTitle;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }
  @override
  Widget build(context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color (0xffFFAB91),
        body: Background2(
            child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 220,),

                child: Container(
                  width: size.width * 0.9,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          'New Task',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Grandstander',
                            fontSize: 30,
                            color:Color(0XFFE53935),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextField(
                        controller: _text,
                        decoration: InputDecoration(
                            errorText: _validate ? 'Value Can\'t Be Empty' : null,
                            border: InputBorder.none),
                        cursorColor: Color(0xffF48FB1),
                        autofocus: true,
                        textAlign: TextAlign.center,
                        onChanged: (newText) {
                          newTextTitle = newText;
                        },
                      ),
                      FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Text(
                            'Add',
                            style: TextStyle(
                              fontFamily: 'Grandstander',
                              color: Color(0XFFE53935),
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          height: 50,
                          minWidth: 170,
                          color:Color(0XFFFFCDD2),
                          onPressed: () {
                            setState(() {
                              _text.text.isEmpty
                                  ? _validate = false
                                  : _validate = true;
                            });

                            if (_validate) {
                              Provider.of<TaskData>(
                                context,
                                listen: false,
                              ).addTaskToList(newTextTitle);
                              Navigator.pop(context);
                            }
                          }
                          ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              )
            ],
          ),
        )

      ),
    );
  }
}