import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final String time;
  final String? category;
  final String? count;
  final bool isCompleted;
  final Color Function(String)? getCategoryColor;
  final VoidCallback? onToggle; // New callback for toggling task completion

  const TaskItem({
    super.key,
    required this.title,
    required this.time,
    this.category,
    this.count,
    required this.isCompleted,
    this.getCategoryColor,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCompleted ? Colors.grey[800] : Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: onToggle, // When tapped, calls the onToggle callback
            borderRadius: BorderRadius.circular(16),
            child: Icon(
              isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isCompleted ? Colors.green : Colors.white54,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
          if (category != null && getCategoryColor != null)
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: getCategoryColor!(category!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                category!,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          if (count != null)
            Row(
              children: [
                const Icon(
                  Icons.insert_drive_file,
                  color: Colors.white54,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  count!,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
