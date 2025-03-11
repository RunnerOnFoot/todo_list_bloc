import 'package:to_do_list_bloc/domain/entities/task.dart';
import 'package:to_do_list_bloc/domain/repositories/task_repository.dart';

class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  Future<void> call(Task task) {
    return repository.addTask(task);
  }
}
