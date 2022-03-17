import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/one_task.dart';

import '../../data/tasks_collection.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails(this.task, this.deleteTask,{Key? key}) : super(key: key);

  final Task task;
  final Function deleteTask;

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.task.completed ? Colors.blue : Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(widget.task.content),
            Text(widget.task.createdAt.toString()),
            widget.task.completed ? const Text("Fini") : const Text("A faire"),
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: ()  => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Attention'),
                        content: const Text('Vous allez supprimer la tâche'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              widget.deleteTask(widget.task);
                              Provider.of<TaskCollection>(context, listen: false).delete(widget.task);
                              Navigator.pop(context, 'OK');
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                  ),
                  child: const Text('Delete'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                        context,
                        OneTask.routeName,
                        arguments: widget.task
                    );
                  },
                  child: const Text('Update'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Provider.of<TaskCollection>(context, listen: false).updateCompleted(widget.task);
                  },
                  child: widget.task.completed ? const Text('A faire') : const Text('Fini'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}