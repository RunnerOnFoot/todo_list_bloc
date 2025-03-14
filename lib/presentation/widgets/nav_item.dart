import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_colors.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkResponse(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        splashColor: AppColors.primaryPurple.withOpacity(0.3),
        containedInkWell: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: isSelected ? AppColors.primaryPurple : Colors.white,
            ),
            const SizedBox(height: 4.0),
            Text(
              label,
              style:
                  isSelected
                      ? AppTextStyles.bottomNavItem.copyWith(
                        color: AppColors.primaryPurple,
                      )
                      : AppTextStyles.bottomNavItem,
            ),
          ],
        ),
      ),
    );
  }
}
