import 'package:flutter/material.dart';
import 'package:todoeyflutter/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_list_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskListData>(
      create: (_) => TaskListData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
