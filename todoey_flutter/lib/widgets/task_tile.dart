import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatelessWidget {
  TaskTile({this.text, this.isDone, this.onChanged, this.deleteOnTap});

  final String text;
  final bool isDone;
  final Function onChanged;
  final Function deleteOnTap;

  IconSlideAction deleteAction() {
    return IconSlideAction(
      caption: 'Delete',
      color: Colors.red,
      icon: Icons.delete,
      onTap: deleteOnTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableBehindActionPane(),
      actionExtentRatio: 0.25,
      actions: [
        deleteAction(),
      ],
      secondaryActions: [
        deleteAction(),
      ],
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
              decoration:
                  isDone ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
          trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isDone,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
