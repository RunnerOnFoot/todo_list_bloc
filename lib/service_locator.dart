import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:to_do_list_bloc/data/repositories/task_repository_impl.dart';
import 'package:to_do_list_bloc/domain/repositories/task_repository.dart';
import 'package:to_do_list_bloc/domain/usecases/add_task.dart';
import 'package:to_do_list_bloc/domain/usecases/remove_task.dart';
import 'package:to_do_list_bloc/domain/usecases/update_task.dart';
import 'package:to_do_list_bloc/presentation/blocs/task_bloc.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl());
  getIt.registerLazySingleton(() => AddTask(getIt()));
  getIt.registerLazySingleton(() => RemoveTask(getIt()));
  getIt.registerLazySingleton(() => UpdateTask(getIt()));
  getIt.registerFactory(
    () => TaskBloc(addTask: getIt(), removeTask: getIt(), updateTask: getIt()),
  );
}
