import 'package:injectable/injectable.dart';
import 'package:to_do_list_bloc/domain/repositories/task_repository.dart';

@injectable
class RemoveTask {
  final TaskRepository repository;

  RemoveTask(this.repository);

  Future<void> call(int index) {
    return repository.removeTask(index);
  }
}
