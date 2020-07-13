import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskListData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(taskText: 'Buy milk'),
    Task(taskText: 'Buy eggs'),
    Task(taskText: 'Buy bread'),
  ];

  void toggleDone(var value) {
    if (value is int || value is Task) {
      _tasks[value].toggleDone();
      notifyListeners();
    } else {
      throw new Exception(
          'Could not toggle task using value! value is ${value.runtimeType}, expected: Task, int');
    }
  }

  void addTask(String taskTitle) {
    _tasks.add(Task(
      taskText: taskTitle,
    ));
    notifyListeners();
  }

  void removeTask(var value) {
    if (value is int) {
      _tasks.removeAt(value);
      notifyListeners();
    } else if (value is Task) {
      _tasks.remove(value);
      notifyListeners();
    } else {
      throw new Exception(
          'Could not remove task using value! value is ${value.runtimeType}, expected: Task, int');
    }
  }

  int get taskCount => _tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);
}
