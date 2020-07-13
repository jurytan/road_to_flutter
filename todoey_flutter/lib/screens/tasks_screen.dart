import 'package:flutter/material.dart';
import 'package:todoeyflutter/utilities/constants.dart';
import 'package:todoeyflutter/widgets/task_list.dart';
import 'package:todoeyflutter/screens/add_task_screen.dart';
import 'package:todoeyflutter/models/task.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final _messageTextCtrl = TextEditingController();
  String taskToAdd;
  List<Task> tasks = [
    Task(
      taskText: 'Buy milk',
      isDone: false,
    ),
    Task(
      taskText: 'Buy eggs',
      isDone: false,
    ),
    Task(
      taskText: 'Buy bread',
      isDone: true,
    ),
  ];

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
            builder: (context) => AddTaskScreen(
              messageTextCtrl: _messageTextCtrl,
              textFieldOnChanged: (value) => taskToAdd = value,
              buttonOnPressed: (() {
                //Add value to the list
                setState(
                  () => tasks.add(
                    Task(
                      taskText: taskToAdd,
                      isDone: false,
                    ),
                  ),
                );
                _messageTextCtrl.clear();
                Navigator.pop(context);
              }),
            ),
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
                  '12 Tasks',
                  style: kSubtitleTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: kRoundedTopDecoration,
              child: TaskList(
                tasks: tasks,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
