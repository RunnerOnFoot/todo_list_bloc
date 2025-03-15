import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
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

  // Example tasks. Replace with real data or BLoC-driven state.
  final List<Map<String, String>> _todayTasks = [
    {
      'title': 'Do Math Homework',
      'time': 'Today at 16:45',
      'category': 'University',
      'count': '1',
    },
    {
      'title': 'Take out dogs',
      'time': 'Today at 08:15',
      'category': 'Home',
      'count': '3',
    },
    {
      'title': 'Business meeting with CEO',
      'time': 'Today at 08:15',
      'category': 'Work',
      'count': '2',
    },
  ];

  final List<Map<String, String>> _completedTasks = [
    {'title': 'Buy Grocery', 'time': 'Today at 16:45'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showAddTaskModal() {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false, // allows transparency so that underlying screen shows
        barrierColor: AppColors.overlayBackground, // uses theme-defined overlay
        barrierDismissible: true,
        pageBuilder:
            (context, animation, secondaryAnimation) =>
                const AddTaskModalScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1), // slide up from bottom
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  // Helper to pick a color for the category label.
  // In a real app, you might move these to the theme as well.
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

  // Build the task list section using the reusable TaskItem widget.
  Widget _buildTaskList(
    List<Map<String, String>> tasks, {
    bool isCompleted = false,
  }) {
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
          title: task['title'] ?? '',
          time: task['time'] ?? '',
          category: task['category'],
          count: task['count'],
          isCompleted: isCompleted,
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TaskHeader(
                title: 'Index',
                profileImagePath: 'assets/images/profile_pic.jpg',
              ),
              const TaskSearchBar(),
              const SectionTitle(title: 'Today'),
              _buildTaskList(_todayTasks, isCompleted: false),
              const SectionTitle(title: 'Completed'),
              _buildTaskList(_completedTasks, isCompleted: true),
            ],
          ),
        ),
      ),
    );
  }
}
