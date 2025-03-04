import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list_bloc/cubits/task_cubit.dart';
import 'package:to_do_list_bloc/models/task.dart';

void main() {
  group('TaskCubit Tests', () {
    late TaskCubit taskCubit;

    setUp(() {
      taskCubit = TaskCubit();
    });

    tearDown(() {
      taskCubit.close();
    });

    test('Initial state is empty', () {
      expect(taskCubit.state, []);
    });

    test('addTask should add a new task to the list', () {
      taskCubit.addTask(Task(name: 'New Task'));
      expect(taskCubit.state.length, 1);
      expect(taskCubit.state[0].name, 'New Task');
      expect(taskCubit.state[0].isDone, false);
    });

    test('toggleTask should change task isDone status', () {
      taskCubit.addTask(Task(name: 'Task 1'));
      taskCubit.toggleTask(0);
      expect(taskCubit.state[0].isDone, true);
      taskCubit.toggleTask(0);
      expect(taskCubit.state[0].isDone, false);
    });

    test('deleteTask should remove task from the list', () {
      taskCubit.addTask(Task(name: 'Task to be deleted'));
      taskCubit.deleteTask(0);
      expect(taskCubit.state.isEmpty, true);
    });

    test("addTask should not add empty task", () {
      taskCubit.addTask(Task(name: '')); // empty task
      expect(taskCubit.state.isEmpty, true);
    });

    test('addTask should increase task list length', () {
      final previousLength = taskCubit.state.length;
      taskCubit.addTask(Task(name: 'New Task'));
      expect(taskCubit.state.length, previousLength + 1);
    });
  });
}
