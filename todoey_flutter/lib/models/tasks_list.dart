import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Task {
  Task({required this.name, this.isCompleted = false});

  String name;
  bool isCompleted;

  void onCompleted() {
    isCompleted = !isCompleted;
  }
}

class TasksList extends ChangeNotifier {
  List<Task> _tasks = [];

  int get tasksLength => _tasks.length;
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void onCompleted(Task task) {
    task.onCompleted();
    notifyListeners();
  }
}
