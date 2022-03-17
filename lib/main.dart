import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/screens/all_tasks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/screens/create_task.dart';
import 'package:todolist/screens/one_task.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TaskCollection(),
      child: const TodoList(),
    ),
  );
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: AllTasks.routeName,
      routes: {
        AllTasks.routeName: (context) => const AllTasks(title: 'Todo List'),
        OneTask.routeName: (context) => const OneTask(),
        CreateTask.routeName: (context) => const CreateTask(),
      },
    );
  }
}
