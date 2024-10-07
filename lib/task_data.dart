import 'package:flutter/foundation.dart';
import 'package:check_list/task.dart';
import 'dart:collection';
import 'task.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  Future<SharedPreferences> pref = SharedPreferences.getInstance();

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  readList() async {
    List<String> list =(await pref).getStringList('list');
    _tasks = List<Task>.from(list.map((e) => Task(name: e)).toList());
    print('readList: ${list.join(',')}');
    notifyListeners();
  }
  int get taskCount {
    return _tasks.length;
  }
  void addTaskToList(String text) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _tasks.add(Task(name:text));
    await prefs.setStringList('list', tasks.map<String>((e) => e.name).toList());
    notifyListeners();
  }
  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
  void deleteTask(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _tasks.removeAt(index);
    await prefs.setStringList('list', _tasks.map((e) => e.name).toList());
    notifyListeners();
  }


}