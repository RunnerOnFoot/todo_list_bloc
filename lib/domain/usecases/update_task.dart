import 'package:to_do_list_bloc/domain/entities/task.dart';
import 'package:to_do_list_bloc/domain/repositories/task_repository.dart';

class UpdateTask {
  final TaskRepository repository;

  UpdateTask(this.repository);

  Future<void> call(int index, Task newTask) {
    return repository.updateTask(index, newTask);
  }
}
