import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TaskPreview extends StatefulWidget {
  const TaskPreview(this.task, this.showDetails, this.index,{Key? key}) : super(key: key);

  final Function showDetails;
  final Task task;
  final int index;

  @override
  State<TaskPreview> createState() => _TaskPreviewState();
}

class _TaskPreviewState extends State<TaskPreview> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {widget.showDetails(widget.index);},
      child: Container(
          height: 50,
          color: widget.task.completed ? Colors.blue : Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Flexible(child: Text(widget.task.content)),
                widget.task.completed ? const Text("done") : const Text("todo")
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          )
      ),
    );
  }
}