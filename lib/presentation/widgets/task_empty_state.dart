import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

class TaskEmptyState extends StatelessWidget {
  const TaskEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/checklist.png'),
        const SizedBox(height: 20),
        Text('What do you want to do today?', style: AppTextStyles.mainTitle),
        Text('Tap + to add your tasks', style: AppTextStyles.subtitle),
      ],
    );
  }
}
