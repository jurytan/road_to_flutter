import 'package:flutter/material.dart';
import 'package:todoeyflutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_list_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListData>(
      builder: (context, taskListData, child) {
        // Removed listener to prevent rebuilding of stateless widget
        taskListData.removeListener(() {});
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskListData.tasks[index];
            return TaskTile(
              text: task.taskText,
              isDone: task.isDone,
              onChanged: (_) => taskListData.toggleDone(index),
              deleteOnTap: () =>
                  Provider.of<TaskListData>(context, listen: false)
                      .removeTask(index),
            );
          },
          itemCount: taskListData.taskCount,
        );
      },
    );
  }
}
