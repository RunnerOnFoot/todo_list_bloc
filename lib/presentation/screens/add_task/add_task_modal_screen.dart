import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_bloc/domain/entities/task.dart';
import '../../blocs/task_bloc.dart';
import '../../blocs/task_event.dart';
import '../../../core/theme/app_text_styles.dart';

class AddTaskModalScreen extends StatefulWidget {
  const AddTaskModalScreen({super.key});

  @override
  State<AddTaskModalScreen> createState() => _AddTaskModalScreenState();
}

class _AddTaskModalScreenState extends State<AddTaskModalScreen> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    final taskName = _taskController.text.trim();
    if (taskName.isNotEmpty) {
      final task = Task(name: taskName);
      context.read<TaskBloc>().add(TaskEvent.added(task));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.pop(context),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {}, // Prevent closing modal when tapping inside
                child: LayoutBuilder(
                  builder: (ctx, constraints) {
                    // Limit the modal's height to, for example, 70% of the screen
                    final maxModalHeight = constraints.maxHeight * 0.7;

                    return SingleChildScrollView(
                      // Add bottom padding for the keyboard + extra spacing
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
                        top: 16,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: maxModalHeight),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(56, 56, 56, 1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add Task',
                                  style: AppTextStyles.headerText,
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: _taskController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'What needs to be done?',
                                    hintStyle: const TextStyle(
                                      color: Colors.white54,
                                    ),
                                    filled: false,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(56, 56, 56, 1),
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade500,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  controller: _detailsController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Add details (optional)',
                                    hintStyle: const TextStyle(
                                      color: Colors.white54,
                                    ),
                                    filled: false,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(56, 56, 56, 1),
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade500,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.timer_outlined,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.attach_file_outlined,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.flag_outlined,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.send_rounded,
                                        color: Colors.white,
                                      ),
                                      onPressed: _onSubmit,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
