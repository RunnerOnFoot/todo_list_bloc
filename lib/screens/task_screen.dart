import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_bloc/cubits/task_cubit.dart';
import 'package:to_do_list_bloc/models/task.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskCubit = context.read<TaskCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<TaskCubit, List<Task>>(
              builder: (context, tasks) {
                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tasks[index].name),
                      trailing: IconButton(
                        onPressed: () {
                          taskCubit.toggleTask(index);
                        },
                        onLongPress: () {
                          taskCubit.deleteTask(index);
                        },
                        icon: Icon(
                          tasks[index].isDone
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onSubmitted: (taskName) {
                taskCubit.addTask(Task(name: taskName));
              },
              decoration: const InputDecoration(
                hintText: 'Add a task...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
