import 'package:flutter/material.dart';
import '../../widgets/task/task_modal_content.dart';

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
                onTap: () {}, // Prevents tap propagation to close modal
                child: TaskModalContent(
                  onSubmit: () {
                    // When the send icon is tapped inside the modal, simply close the modal.
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
