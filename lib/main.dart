import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list_bloc/presentation/screens/add_task/add_task_modal_screen.dart';
import 'package:to_do_list_bloc/presentation/screens/task_home/task_home_screen.dart';
import 'core/di/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'presentation/blocs/task_bloc.dart';
import 'presentation/screens/task_list/task_list_screen.dart';
import 'presentation/screens/task_edit/task_edit_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

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
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<TaskBloc>(),
        ), // Inject TaskBloc with GetIt
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appThemeData(),
        initialRoute: '/home',
        routes: {
          '/': (context) => const TaskListScreen(),
          '/home': (context) => const TaskHomeScreen(),
          '/edit': (context) => const TaskEditScreen(),
          '/add': (context) => const AddTaskModalScreen(),
        },
      ),
    );
  }
}
