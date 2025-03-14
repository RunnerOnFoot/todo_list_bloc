import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'nav_item.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.bottomNavBackground,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          NavItem(
            icon: Icons.home,
            label: 'Index',
            isSelected: selectedIndex == 0,
            onTap: () => onItemTapped(0),
          ),
          NavItem(
            icon: Icons.calendar_today,
            label: 'Calendar',
            isSelected: selectedIndex == 1,
            onTap: () => onItemTapped(1),
          ),
          const SizedBox(width: 48.0), // Space for FAB
          NavItem(
            icon: Icons.access_time,
            label: 'Focus',
            isSelected: selectedIndex == 2,
            onTap: () => onItemTapped(2),
          ),
          NavItem(
            icon: Icons.person,
            label: 'Profile',
            isSelected: selectedIndex == 3,
            onTap: () => onItemTapped(3),
          ),
        ],
      ),
    );
  }
}
