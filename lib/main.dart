import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:to_do_buddy/view/home_screen.dart';
import 'package:to_do_buddy/viewModel/todo_provider.dart';

import 'model/todo_model.dart';

void main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=> TodoProvider())
  ],
  child: const MyApp()));
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationCacheDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('TodoBox');

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true
      ),
      home: HomeScreen(),
    );
  }
}
