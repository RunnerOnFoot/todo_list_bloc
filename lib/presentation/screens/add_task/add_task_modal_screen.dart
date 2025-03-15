import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';

class AddTaskModalScreen extends StatelessWidget {
  const AddTaskModalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.pop(context);
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {},
                child: Container(
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
                        TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            // Your hint text here
                            hintText: 'What needs to be done?',
                            hintStyle: const TextStyle(color: Colors.white54),
                            filled: false,

                            // Border when the TextField is not focused
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(56, 56, 56, 1),
                                width: 1,
                              ),
                            ),

                            // Border when the TextField is focused
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: Colors.grey.shade500,
                                width: 1,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),
                        TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            // Your hint text here
                            hintText: 'Add details (optional)',
                            hintStyle: const TextStyle(color: Colors.white54),
                            filled: false,

                            // Border when the TextField is not focused
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(56, 56, 56, 1),
                                width: 1,
                              ),
                            ),

                            // Border when the TextField is focused
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: Colors.grey.shade500,
                                width: 1,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.timer_outlined,
                                color: Colors.white,
                              ),
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
                              icon: const Icon(
                                Icons.flag_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(
                                Icons.send_rounded,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
