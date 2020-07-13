import 'package:flutter/material.dart';
import 'package:todoeyflutter/widgets/task_tile.dart';
import 'package:todoeyflutter/models/task.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();

  List<Task> tasks;

  TaskList({this.tasks});
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          text: widget.tasks[index].taskText,
          isDone: widget.tasks[index].isDone,
          onChanged: (checkboxState) =>
              setState(() => widget.tasks[index].toggleDone()),
          deleteOnTap: () =>
              setState(() => widget.tasks.remove(widget.tasks[index])),
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
