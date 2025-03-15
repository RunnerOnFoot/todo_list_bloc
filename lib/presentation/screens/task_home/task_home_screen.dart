import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../widgets/common/task_empty_state.dart';
import '../../widgets/common/custom_bottom_nav.dart';
import '../add_task/add_task_modal_screen.dart'; // Import the modal screen widget

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
        opaque: false, // Important: allows transparency
        barrierColor: Color.fromRGBO(0, 0, 0, 0.5), // Optional dimming
        barrierDismissible: true,
        pageBuilder:
            (context, animation, secondaryAnimation) =>
                const AddTaskModalScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1), // From bottom
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
        child: Column(
          children: [_buildHeader(), const Expanded(child: TaskEmptyState())],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('TODO', style: AppTextStyles.headerText),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
            radius: 25,
          ),
        ],
      ),
    );
  }
}
