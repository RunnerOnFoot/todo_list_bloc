import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_bloc/cubits/task_cubit.dart';
import 'package:to_do_list_bloc/screens/task_screen.dart';
import 'package:to_do_list_bloc/models/task.dart';

void main() {
  late TaskCubit taskCubit;

  setUp(() {
    taskCubit = TaskCubit();
  });

  testWidgets('Add task from UI', (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider(
        create: (_) => taskCubit,
        child: MaterialApp(home: TaskScreen()),
      ),
    );

    await tester.enterText(find.byType(TextField), 'New Task');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.text('New Task'), findsOneWidget);
    expect(taskCubit.state.length, 1);
  });

  testWidgets('Toggle task from UI', (WidgetTester tester) async {
    taskCubit.addTask(Task(name: 'Task 1'));
    await tester.pumpWidget(
      BlocProvider(
        create: (_) => taskCubit,
        child: MaterialApp(home: TaskScreen()),
      ),
    );

    await tester.tap(find.byIcon(Icons.check_box_outline_blank));
    await tester.pump();

    expect(find.byIcon(Icons.check_box), findsOneWidget);
  });

  testWidgets('LongPress on a task from UI', (WidgetTester tester) async {
    taskCubit.addTask(Task(name: 'Task 1'));
    taskCubit.addTask(Task(name: 'Task 2'));
    taskCubit.addTask(Task(name: 'Task 3'));

    await tester.pumpWidget(
      BlocProvider(
        create: (_) => taskCubit,
        child: MaterialApp(home: TaskScreen()),
      ),
    );

    expect(find.text('Task 1'), findsOneWidget);
    expect(find.text('Task 2'), findsOneWidget);
    expect(find.text('Task 3'), findsOneWidget);
    expect(taskCubit.state.length, 3);

    await tester.longPress(find.text('Task 2'));
    await tester.pump();

    expect(taskCubit.state.length, 2);
    expect(find.text('Task 2'), findsNothing);
  });
}
