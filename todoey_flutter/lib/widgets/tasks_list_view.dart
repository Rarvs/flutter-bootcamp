import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks_list.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksList>(
      builder: (context, tasksList, child) {
        return ListView.builder(
          itemCount: tasksList.tasksLength,
          itemBuilder: (context, index) {
            final task = tasksList.tasks[index];
            return TaskTile(
              taskName: task.name,
              isChecked: task.isCompleted,
              onTapCallback: (checkboxState) => tasksList.onCompleted(task),
              onLongPressCallback: () => tasksList.removeTask(task),
            );
          },
        );
      },
    );
  }
}
