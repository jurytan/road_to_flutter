import 'package:flutter/material.dart';
import 'package:todoeyflutter/utilities/constants.dart';
import 'package:todoeyflutter/widgets/task_list.dart';
import 'package:todoeyflutter/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_list_data.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(
                      Icons.list,
                      size: 45.0,
                      color: Colors.lightBlueAccent,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todoey',
                  style: kTitleTextStyle,
                ),
                Text(
                  '${Provider.of<TaskListData>(context).taskCount} Tasks',
                  style: kSubtitleTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: kRoundedTopDecoration,
              child: TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}
