import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../widgets/common/custom_bottom_nav.dart';
import '../../widgets/common/task_empty_state.dart';
import '../add_task/add_task_modal_screen.dart'; // Import the modal screen widget

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
      'title': 'Tack out dogs',
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
    {
      'title': 'Buy Grocery',
      'time': 'Today at 16:45',
      // no category or count
    },
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
        opaque: false, // allows transparency
        barrierColor: const Color.fromRGBO(0, 0, 0, 0.5), // optional dimming
        barrierDismissible: true,
        pageBuilder:
            (context, animation, secondaryAnimation) =>
                const AddTaskModalScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1), // Slide up from bottom
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
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
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: SafeArea(
        // Use SingleChildScrollView or a ListView if you have more content
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildSearchBar(),
              // "Today" section
              _buildSectionTitle('Today'),
              _buildTaskList(_todayTasks, isCompleted: false),
              // "Completed" section
              _buildSectionTitle('Completed'),
              _buildTaskList(_completedTasks, isCompleted: true),
            ],
          ),
        ),
      ),
    );
  }

  // Header at the top: "Index" + profile pic
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Index', style: AppTextStyles.headerText),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
            radius: 25,
          ),
        ],
      ),
    );
  }

  // Search bar
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search for your task...',
            hintStyle: const TextStyle(color: Colors.white54),
            prefixIcon: const Icon(Icons.search, color: Colors.white54),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );
  }

  // Section title (e.g., "Today", "Completed")
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Build a list of tasks. If empty, show your TaskEmptyState widget
  Widget _buildTaskList(
    List<Map<String, String>> tasks, {
    bool isCompleted = false,
  }) {
    if (tasks.isEmpty) {
      return const TaskEmptyState();
    }
    return ListView.builder(
      // Because we’re inside a SingleChildScrollView, wrap in a fixed height
      // or shrinkWrap to avoid unbounded height error.
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return _buildTaskItem(task, isCompleted: isCompleted);
      },
    );
  }

  // A single task item row
  Widget _buildTaskItem(Map<String, String> task, {bool isCompleted = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCompleted ? Colors.grey[800] : Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Left icon: check or radio
          Icon(
            isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isCompleted ? Colors.green : Colors.white54,
          ),
          const SizedBox(width: 12),
          // Title + time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task['title'] ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  task['time'] ?? '',
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
          // Optional category chip
          if (task['category'] != null)
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getCategoryColor(task['category']!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                task['category']!,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          // Optional subtask count
          if (task['count'] != null)
            Row(
              children: [
                const Icon(
                  Icons.insert_drive_file,
                  color: Colors.white54,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  task['count']!,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
        ],
      ),
    );
  }

  // Helper to pick a color for the category label
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
}
