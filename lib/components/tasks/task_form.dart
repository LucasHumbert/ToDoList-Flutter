import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/data/tasks.dart' as data;
import 'package:todolist/data/tasks_collection.dart';

import '../../models/task.dart';

class TaskForm extends StatefulWidget {
  const TaskForm(this.task, {Key? key}) : super(key: key);

  final Task task;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String newContent = '';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.task.content == '' ? "Créer une tâche" : "Modifier la tâche",
          style: GoogleFonts.mochiyPopOne(),
        ),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: widget.task.content == '' ? "" : widget.task.content,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    newContent = value;
                    return null;
                  },
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (widget.task.content == '') {
                  widget.task.content = newContent;
                  Provider.of<TaskCollection>(context, listen: false).create(widget.task);
                } else {
                  Provider.of<TaskCollection>(context, listen: false).updateContent(widget.task, newContent);
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
                Navigator.pop(context);
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}