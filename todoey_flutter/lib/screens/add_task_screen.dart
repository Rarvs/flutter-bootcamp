import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function callback;

  AddTaskScreen(this.callback);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 24.0,
              ),
            ),
            TextField(
              autofocus: true,
              onChanged: (value) => newTaskTitle = value,
            ),
            ElevatedButton(
              onPressed: () => callback(newTaskTitle),
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
