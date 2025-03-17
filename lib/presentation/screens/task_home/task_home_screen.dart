import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../blocs/task_bloc.dart';
import '../../blocs/task_state.dart';
import '../../blocs/task_event.dart';
import '../../widgets/common/custom_bottom_nav.dart';
import '../../widgets/common/task_empty_state.dart';
import '../../widgets/common/task_header.dart';
import '../../widgets/common/task_search_bar.dart';
import '../../widgets/common/section_title.dart';
import '../../widgets/task/task_item.dart';
import '../add_task/add_task_modal_screen.dart';

class TaskHomeScreen extends StatefulWidget {
  const TaskHomeScreen({super.key});

  @override
  State<TaskHomeScreen> createState() => _TaskHomeScreenState();
}

class _TaskHomeScreenState extends State<TaskHomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showAddTaskModal() {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        barrierColor: AppColors.overlayBackground,
        barrierDismissible: true,
        pageBuilder:
            (context, animation, secondaryAnimation) =>
                const AddTaskModalScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  // Example: mapping a category to a color
  Color _getCategoryColor(String category) {
    switch (category) {
      case 'University':
        return Colors.blueAccent;
      case 'Home':
        return Colors.pinkAccent;
      case 'Work':
        return Colors.orangeAccent;
      default:
        return Colors.grey;
    }
  }

  // Build a ListView of tasks
  Widget _buildTaskList(List allTasks, List filteredTasks) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredTasks.length,
      itemBuilder: (context, index) {
        final task = filteredTasks[index];
        final realIndex = allTasks.indexOf(task);
        return GestureDetector(
          onLongPress: () {
            // Dispatch a removal event when the user long-presses the task tile.
            context.read<TaskBloc>().add(TaskEvent.removed(realIndex));
          },
          child: TaskItem(
            title: task.name,
            time: 'Now', // Replace with a real time if available.
            isCompleted: task.isDone,
            getCategoryColor: _getCategoryColor,
            onToggle: () {
              // Toggle completion on tap.
              context.read<TaskBloc>().add(
                TaskEvent.updated(
                  realIndex,
                  task.copyWith(isDone: !task.isDone),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskModal,
        backgroundColor: AppColors.primaryPurple,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 30, color: AppColors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: SafeArea(
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            final allTasks = state.tasks;
            final activeTasks = allTasks.where((t) => !t.isDone).toList();
            final completedTasks = allTasks.where((t) => t.isDone).toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TaskHeader(
                    title: 'Index',
                    profileImagePath: 'assets/images/profile_pic.jpg',
                  ),
                  const TaskSearchBar(),

                  // If NO tasks at all, show one big empty state
                  if (allTasks.isEmpty) ...[
                    const SizedBox(height: 50),
                    const Center(child: TaskEmptyState()),
                    const SizedBox(height: 50),
                  ] else ...[
                    // Otherwise, show "Today" and "Completed" sections
                    const SectionTitle(title: 'Today'),
                    if (activeTasks.isEmpty)
                      // Show a smaller placeholder for empty active tasks
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: Text(
                            'No tasks for today.',
                            style: TextStyle(color: Colors.white54),
                          ),
                        ),
                      )
                    else
                      _buildTaskList(allTasks, activeTasks),

                    const SectionTitle(title: 'Completed'),
                    if (completedTasks.isEmpty)
                      // Show a smaller placeholder for empty completed tasks
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: Text(
                            'No completed tasks yet.',
                            style: TextStyle(color: Colors.white54),
                          ),
                        ),
                      )
                    else
                      _buildTaskList(allTasks, completedTasks),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
