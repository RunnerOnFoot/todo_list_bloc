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
                  taskBloc.add(DeleteTask(index));
                },
                title: Text(task.name),
                trailing: IconButton(
                  onPressed: () {
                    taskBloc.add(ToggleTask(index));
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
          taskBloc.add(AddTask(Task(name: 'New Task')));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
