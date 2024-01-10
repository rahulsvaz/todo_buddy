import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_buddy/model/todo_model.dart';
import 'package:to_do_buddy/view/add_todo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScreen> {
  final todoBox = Hive.box<TodoModel>('TodoBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: todoBox.listenable(),
                builder: (context, box, child) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: todoBox.length,
                        itemBuilder: (context, index) {
                          final todo = todoBox.getAt(index);
                          return ListTile(
                            title: Text(todo!.tittle.toString()),
                            subtitle: Text(
                              todo!.todo.toString(),
                            ),
                          );
                        }),
                  );
                }),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTodoScreen(),
                  ),
                );
              },
              child: const Text('Add To do'),
            )
          ],
        ),
      ),
    );
  }
}
