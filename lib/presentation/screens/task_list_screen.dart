import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/task_bloc.dart';
import '../blocs/task_event.dart';
import '../blocs/task_state.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

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
                title: Text(task.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/edit',
                          arguments: {'task': task, 'index': index},
                        );
                      },
                      icon: const Icon(Icons.edit, color: Colors.blue),
                    ),
                    IconButton(
                      onPressed: () {
                        taskBloc.add(
                          TaskEvent$TaskUpdated(
                            index,
                            task.copyWith(isDone: !task.isDone),
                          ),
                        );
                      },
                      icon: Icon(
                        task.isDone
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        taskBloc.add(TaskEvent$TaskRemoved(index));
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/edit', arguments: null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
