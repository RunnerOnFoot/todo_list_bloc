import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list_bloc/service_locator.dart';
import 'blocs/task_bloc.dart';
import 'screens/task_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure GetIt dependencies
  configureDependencies();

  // Initialize HydratedBloc storage
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TaskBloc>(), // Inject TaskBloc with GetIt
      child: MaterialApp(debugShowCheckedModeBanner: false, home: TaskScreen()),
    );
  }
}

// routes: {
// Task.id: (context) => Task(),
// AddTaskScreen.id: (context) => AddTaskScreen(),
// EditTaskScreen.id: (context) => EditTaskScreen(),
// DeleteTaskScreen.id: (context) => DeleteTaskScreen(),
// },
