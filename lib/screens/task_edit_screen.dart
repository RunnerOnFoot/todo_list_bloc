import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/task_bloc.dart';
import '../blocs/task_event.dart';
import '../models/task.dart';

class TaskEditScreen extends StatefulWidget {
  const TaskEditScreen({super.key});

  @override
  State<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  final TextEditingController _controller = TextEditingController();
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
      if (_task != null) {
        _controller.text = _task!.name;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskBloc = context.read<TaskBloc>();

    return Scaffold(
      appBar: AppBar(title: Text(_task == null ? 'Add Task' : 'Edit Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Task Name'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                final taskName = _controller.text.trim();
                if (taskName.isNotEmpty) {
                  if (_task == null) {
                    taskBloc.add(TaskEvent$TaskAdded(Task(name: taskName)));
                  } else {
                    taskBloc.add(
                      TaskEvent$TaskUpdated(_index!, Task(name: taskName)),
                    );
                  }
                }
                Navigator.pop(context);
              },
              child: Text(_task == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
