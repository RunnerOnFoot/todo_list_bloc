import 'package:injectable/injectable.dart';
import 'package:to_do_list_bloc/data/local/drift_database.dart';

@module
abstract class DriftModule {
  @lazySingleton
  AppDatabase get database => AppDatabase();
}
