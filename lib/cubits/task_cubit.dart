import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_bloc/models/task.dart';

class TaskCubit extends Cubit<List<Task>> {
  TaskCubit() : super([]);

  void addTask(Task task) {
    state.add(task);
    emit(List.from(state));
  }

  void toggleTask(int index) {
    state[index].isDone = !state[index].isDone;
    emit(List.from(state));
  }

  void deleteTask(int index) {
    state.removeAt(index);
    emit(List.from(state));
  }
}
