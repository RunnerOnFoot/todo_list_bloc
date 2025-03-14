import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class HomeScreenEmpty extends StatefulWidget {
  const HomeScreenEmpty({super.key});

  @override
  State<HomeScreenEmpty> createState() => _HomeScreenEmptyState();
}

class _HomeScreenEmptyState extends State<HomeScreenEmpty> {
  int _selectedIndex = 0;

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 480),
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      // Header with Index and Icon
                      Padding(
                        padding: const EdgeInsets.only(top: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Index', style: AppTextStyles.headerText),
                            const SizedBox(width: 20),
                            Image.network(
                              'https://cdn.builder.io/api/v1/image/assets/TEMP/3672d84c0d3c929aaee66344f061388f99f37a17820807f37aa0dde312335c17?placeholderIfAbsent=true&apiKey=84009d86ea53416b90e74e249093d28e',
                              width: 42,
                              height: 42,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),

                      // Empty State Image
                      Padding(
                        padding: const EdgeInsets.only(top: 75),
                        child: Image.network(
                          'https://cdn.builder.io/api/v1/image/assets/TEMP/17c2c9c83f77355cf786a48847772331e354db95129cc40322cea2a45349712b?placeholderIfAbsent=true&apiKey=84009d86ea53416b90e74e249093d28e',
                          width: 227,
                          fit: BoxFit.contain,
                        ),
                      ),

                      // Empty State Text
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'What do you want to do today?',
                          style: AppTextStyles.mainTitle,
                        ),
                      ),

                      Text(
                        'Tap + to add your tasks',
                        style: AppTextStyles.subtitle,
                      ),

                      // Floating Action Button
                      GestureDetector(
                        onTap: () {
                          // Handle FAB tap
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 205),
                          child: Container(
                            width: 64,
                            height: 64,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryPurple,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Navigation Bar
              Container(
                color: AppColors.bottomNavBackground,
                padding: const EdgeInsets.fromLTRB(28, 44, 28, 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => _onNavItemTapped(0),
                                child: Text(
                                  'Index',
                                  style: AppTextStyles.bottomNavItem.copyWith(
                                    color:
                                        _selectedIndex == 0
                                            ? AppColors.primaryPurple
                                            : AppColors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 30),
                              GestureDetector(
                                onTap: () => _onNavItemTapped(1),
                                child: Text(
                                  'Calendar',
                                  style: AppTextStyles.bottomNavItem.copyWith(
                                    color:
                                        _selectedIndex == 1
                                            ? AppColors.primaryPurple
                                            : AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => _onNavItemTapped(2),
                                child: Text(
                                  'Focus',
                                  style: AppTextStyles.bottomNavItem.copyWith(
                                    color:
                                        _selectedIndex == 2
                                            ? AppColors.primaryPurple
                                            : AppColors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 31),
                              GestureDetector(
                                onTap: () => _onNavItemTapped(3),
                                child: Text(
                                  'Profile',
                                  style: AppTextStyles.bottomNavItem.copyWith(
                                    color:
                                        _selectedIndex == 3
                                            ? AppColors.primaryPurple
                                            : AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Bottom Indicator
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      width: 134,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.bottomIndicator,
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
