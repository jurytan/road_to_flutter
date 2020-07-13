import 'package:flutter/material.dart';
import 'package:todoeyflutter/utilities/constants.dart';
import 'package:todoeyflutter/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_list_data.dart';

class AddTaskScreen extends StatelessWidget {
  final _messageTextCtrl = TextEditingController();
  String taskToAdd;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 400.0,
          decoration: kBottomSheetBackgroundContainerDecoration,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: kRoundedTopDecoration,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Add Task',
                    textAlign: TextAlign.center,
                    style: kBottomSheetTitleTextStyle,
                  ),
                  TextField(
                    controller: _messageTextCtrl,
                    onChanged: (value) => taskToAdd = value,
                    autofocus: true,
                    decoration: kBottomSheetTextFieldDecoration,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FlatButton(
                          color: Colors.lightBlueAccent,
                          onPressed: () {
                            // Need to add listen: false because ScrollView is Stateless,
                            // so it tries to rebuild something that doesn't need rebuilding
                            // Adding this argument allows it to function properly
                            Provider.of<TaskListData>(context, listen: false)
                                .addTask(taskToAdd);
                            _messageTextCtrl.clear();
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Add',
                              style: kBottomSheetFlatButtonTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
