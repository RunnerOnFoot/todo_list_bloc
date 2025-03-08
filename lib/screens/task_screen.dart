import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/task_bloc.dart';
import '../blocs/task_event.dart';
import '../blocs/task_state.dart';
import '../models/task.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskBloc = context.read<TaskBloc>();
    final TextEditingController taskController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks[index];
              return ListTile(
                onLongPress: () {
                  taskBloc.add(TaskRemoved(index));
                },
                title: Text(task.name),
                trailing: IconButton(
                  onPressed: () {
                    taskBloc.add(
                      TaskUpdated(index, task.copyWith(isDone: !task.isDone)),
                    );
                  },

                  icon: Icon(
                    task.isDone
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Task'),
                content: TextField(
                  controller: taskController,
                  decoration: const InputDecoration(
                    hintText: 'Enter task name',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      final taskName = taskController.text;
                      if (taskName.isNotEmpty) {
                        taskBloc.add(TaskAdded(Task(name: taskName)));
                        taskController.clear();
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
