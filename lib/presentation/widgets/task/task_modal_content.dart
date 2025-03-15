import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';

class TaskModalContent extends StatelessWidget {
  final VoidCallback onSubmit;

  const TaskModalContent({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: MediaQuery.of(context).viewInsets,
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
            Text('Add Task', style: AppTextStyles.headerText),
            const SizedBox(height: 10),
            // Task name input
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'What needs to be done?',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: false,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(56, 56, 56, 1),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.grey.shade500, width: 1),
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Task details input
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Add details (optional)',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: false,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(56, 56, 56, 1),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.grey.shade500, width: 1),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.timer_outlined, color: Colors.white),
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
                  icon: const Icon(Icons.flag_outlined, color: Colors.white),
                  onPressed: () {},
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.send_rounded, color: Colors.white),
                  onPressed: onSubmit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
