import 'package:todolist/models/task.dart';
import 'dart:math';
import 'package:faker/faker.dart';

var tasks = List<Task>.generate(
    20,
    (index) => Task(
        index,
        faker.lorem.sentence(),
        Random().nextBool()
    ),
);