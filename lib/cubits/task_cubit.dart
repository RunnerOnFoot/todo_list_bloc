import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_bloc/models/task.dart';

class TaskCubit extends Cubit<List<Task>> {
  TaskCubit() : super([]);

  void addTask(Task task) {
    if (task.name.trim().isEmpty) return;
    final newState = List<Task>.from(state)..add(task);
    emit(newState);
  }

  void toggleTask(int index) {
    final task = state[index];
    final updatedTask = task.copyWith(isDone: !task.isDone);
    final newState = List<Task>.from(state)..[index] = updatedTask;
    emit(newState);
  }

  void deleteTask(int index) {
    final newState = List<Task>.from(state)..removeAt(index);
    emit(newState);
  }
}
