import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_details.dart';
import 'package:todolist/components/tasks/task_preview.dart';
import 'package:todolist/models/task.dart';

class TaskMaster extends StatefulWidget {
  const TaskMaster(this.tasks, {Key? key}) : super(key: key);

  final List<Task> tasks;

  @override
  State<TaskMaster> createState() => _TaskMasterState();
}

class _TaskMasterState extends State<TaskMaster> {

  int actualId = -1;

  void showTaskDetails(int index){
    setState(() {
      if (index == actualId) {
        actualId = -1;
      } else {
        actualId = index;
      }
    });
  }

  void deleteTask(Task task) {
    setState(() {
      actualId = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: widget.tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return index == actualId ? TaskDetails(widget.tasks[index], deleteTask) : TaskPreview(widget.tasks[index], showTaskDetails, index);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}