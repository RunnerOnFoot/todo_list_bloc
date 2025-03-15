import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';

class TaskHeader extends StatelessWidget {
  final String title;
  final String profileImagePath;

  const TaskHeader({
    super.key,
    required this.title,
    required this.profileImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.headerText),
          CircleAvatar(
            backgroundImage: AssetImage(profileImagePath),
            radius: 25,
          ),
        ],
      ),
    );
  }
}
