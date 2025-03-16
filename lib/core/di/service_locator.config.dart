// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:to_do_list_bloc/core/di/drift_module.dart' as _i42;
import 'package:to_do_list_bloc/data/local/drift_database.dart' as _i64;
import 'package:to_do_list_bloc/data/repositories/task_repository_impl.dart'
    as _i130;
import 'package:to_do_list_bloc/domain/repositories/task_repository.dart'
    as _i442;
import 'package:to_do_list_bloc/domain/usecases/add_task.dart' as _i1041;
import 'package:to_do_list_bloc/domain/usecases/remove_task.dart' as _i424;
import 'package:to_do_list_bloc/domain/usecases/update_task.dart' as _i115;
import 'package:to_do_list_bloc/presentation/blocs/task_bloc.dart' as _i561;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final driftModule = _$DriftModule();
    gh.lazySingleton<_i64.AppDatabase>(() => driftModule.database);
    gh.lazySingleton<_i442.TaskRepository>(
      () => _i130.TaskRepositoryImpl(gh<_i64.AppDatabase>()),
    );
    gh.factory<_i1041.AddTask>(
      () => _i1041.AddTask(gh<_i442.TaskRepository>()),
    );
    gh.factory<_i424.RemoveTask>(
      () => _i424.RemoveTask(gh<_i442.TaskRepository>()),
    );
    gh.factory<_i115.UpdateTask>(
      () => _i115.UpdateTask(gh<_i442.TaskRepository>()),
    );
    gh.factory<_i561.TaskBloc>(
      () => _i561.TaskBloc(
        addTask: gh<_i1041.AddTask>(),
        removeTask: gh<_i424.RemoveTask>(),
        updateTask: gh<_i115.UpdateTask>(),
      ),
    );
    return this;
  }
}

class _$DriftModule extends _i42.DriftModule {}
