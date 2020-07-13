import 'package:flutter/material.dart';
import 'package:todoeyflutter/utilities/constants.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen(
      {this.messageTextCtrl, this.textFieldOnChanged, this.buttonOnPressed});

  final TextEditingController messageTextCtrl;
  final Function textFieldOnChanged;
  final Function buttonOnPressed;

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
                    controller: messageTextCtrl,
                    onChanged: textFieldOnChanged,
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
                          onPressed: buttonOnPressed,
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
