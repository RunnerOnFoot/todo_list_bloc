import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../widgets/common/custom_bottom_nav.dart';
import '../../widgets/common/task_empty_state.dart';
import '../../widgets/common/task_header.dart';
import '../../widgets/common/task_search_bar.dart';
import '../../widgets/common/section_title.dart';
import '../../widgets/task/task_item.dart';
import '../add_task/add_task_modal_screen.dart';
import '../../blocs/task_bloc.dart';
import '../../blocs/task_state.dart';

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

  // Example helper to determine a color for a category
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

  // Build the task list using the reusable TaskItem widget.
  Widget _buildTaskList(List tasks) {
    if (tasks.isEmpty) {
      return const TaskEmptyState();
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskItem(
          title: task.name,
          time: 'Now', // You can adjust this if you have a time property
          isCompleted: task.isDone,
          // For this example, we assume that the Task entity has no category,
          // but if you add one, you can pass it here.
          getCategoryColor: _getCategoryColor,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TaskHeader(
                    title: 'Index',
                    profileImagePath: 'assets/images/profile_pic.jpg',
                  ),
                  const TaskSearchBar(),
                  const SectionTitle(title: 'Tasks'),
                  _buildTaskList(state.tasks),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
