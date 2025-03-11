import 'package:to_do_list_bloc/domain/entities/task.dart';
import 'package:to_do_list_bloc/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final List<Task> _tasks = [];

  @override
  Future<void> addTask(Task task) async {
    _tasks.add(task);
  }

  @override
  Future<void> removeTask(int index) async {
    _tasks.removeAt(index);
  }

  @override
  Future<void> updateTask(int index, Task newTask) async {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index] = newTask;
    }
  }

  @override
  Future<List<Task>> getTasks() async {
    return _tasks;
  }
}
