import 'package:flutter/material.dart';

class Task {
  int id = 0;
  String content;
  bool completed;
  DateTime createdAt = DateTime.now();

  Task(this.id, this.content, this.completed);
}