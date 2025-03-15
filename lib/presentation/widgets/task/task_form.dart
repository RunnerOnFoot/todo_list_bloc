import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  final String? initialTaskName;
  final String buttonText;
  final void Function(String taskName) onSubmit;

  const TaskForm({
    super.key,
    this.initialTaskName,
    required this.buttonText,
    required this.onSubmit,
  });

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialTaskName);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              widget.onSubmit(taskName);
            }
          },
          child: Text(widget.buttonText),
        ),
      ],
    );
  }
}
