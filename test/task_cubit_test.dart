import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list_bloc/cubits/task_cubit.dart';

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
  });
}
