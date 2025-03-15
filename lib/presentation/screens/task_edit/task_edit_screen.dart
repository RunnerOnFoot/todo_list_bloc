import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/task_bloc.dart';
import '../../blocs/task_event.dart';
import 'package:to_do_list_bloc/domain/entities/task.dart';
import '../../widgets/task/task_form.dart';

class TaskEditScreen extends StatefulWidget {
  const TaskEditScreen({super.key});

  @override
  State<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  Task? _task;
  int? _index;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      _task = args['task'] as Task?;
      _index = args['index'] as int?;
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskBloc = context.read<TaskBloc>();

    return Scaffold(
      appBar: AppBar(title: Text(_task == null ? 'Add Task' : 'Edit Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TaskForm(
          initialTaskName: _task?.name,
          buttonText: _task == null ? 'Add' : 'Update',
          onSubmit: (taskName) {
            if (_task == null) {
              taskBloc.add(TaskEvent$TaskAdded(Task(name: taskName)));
            } else {
              taskBloc.add(
                TaskEvent$TaskUpdated(_index!, Task(name: taskName)),
              );
            }
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
