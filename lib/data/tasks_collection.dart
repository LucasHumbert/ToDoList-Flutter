import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/data/tasks.dart' as data;

import '../models/task.dart';

class TaskCollection extends ChangeNotifier {

  final List<Task> _tasks = data.tasks;

  void create(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  List<Task> getAll() {
    return _tasks;
  }

  void updateContent(Task task, String newContent) {
    var index = _tasks.indexOf(task);
    _tasks[index].content = newContent;
    notifyListeners();
  }

  void updateCompleted(Task task) {
    var index = _tasks.indexOf(task);
    _tasks[index].completed = !_tasks[index].completed;
    notifyListeners();
  }

  void delete(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}