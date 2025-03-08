import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_bloc/blocs/task_event.dart';
import 'package:to_do_list_bloc/blocs/task_state.dart';
import 'package:to_do_list_bloc/models/task.dart';
import 'package:injectable/injectable.dart';

@singleton
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  //Private constructor
  TaskBloc() : super(const TaskState()) {
    on<TaskEvent>((event, emit) {
      switch (event) {
        case TaskEvent$TaskAdded(:final task):
          emit(state.copyWith(tasks: List.from(state.tasks)..add(task)));
          break;

        case TaskEvent$TaskRemoved(:final index):
          final updatedTasks = List<Task>.from(state.tasks)..removeAt(index);
          emit(state.copyWith(tasks: updatedTasks));
          break;

        case TaskEvent$TaskUpdated(:final index, :final newTask):
          final updatedTasks = List<Task>.from(state.tasks);
          if (index >= 0 && index < updatedTasks.length) {
            updatedTasks[index] = newTask;
          }
          emit(state.copyWith(tasks: updatedTasks));
          break;
      }
    });
  }
}
