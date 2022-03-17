import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/data/tasks.dart' as data;
import 'package:todolist/data/tasks_collection.dart';

import '../models/task.dart';
import 'create_task.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key, required this.title}) : super(key: key);

  final String title;
  static const routeName = '/all_tasks';

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskCollection>(
        builder: (context, task, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                widget.title,
                style: GoogleFonts.mochiyPopOne(),
              ),
            ),
            body: Center(
                child: TaskMaster(task.getAll()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    CreateTask.routeName
                );
              },
              backgroundColor: Colors.teal,
              child: const Icon(Icons.add),
            ),
          );
        }
    );
  }
}