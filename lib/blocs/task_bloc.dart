import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/task.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>((event, emit) {
      final newTasks = List<Task>.from(state.tasks)..add(event.task);
      emit(TaskState(tasks: newTasks));
    });

    on<ToggleTask>((event, emit) {
      final updatedTasks = List<Task>.from(state.tasks);
      updatedTasks[event.index] = updatedTasks[event.index].toggleDone();
      emit(TaskState(tasks: updatedTasks));
    });

    on<DeleteTask>((event, emit) {
      final updatedTasks = List<Task>.from(state.tasks)..removeAt(event.index);
      emit(TaskState(tasks: updatedTasks));
    });
  }
}
