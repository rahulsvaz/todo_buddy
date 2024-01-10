import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:to_do_buddy/model/todo_model.dart';
import 'package:to_do_buddy/view/add_todo_screen.dart';
import 'package:to_do_buddy/viewModel/todo_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScreen> {
  final todoBox = Hive.box<TodoModel>('TodoBox');

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Consumer<TodoProvider>(builder: (context, widget, child) {
                return ListView.builder(
                    itemCount: todoProvider.todoList.length,
                    itemBuilder: (context, index) {
                      List todoList = todoProvider.todoList;

                      return ListTile(
                        onLongPress: () {
                          todoProvider.deleteTodo(index);
                        },
                        title: Text(todoList[index].tittle),
                      );
                    });
              }),
            ),

            // ValueListenableBuilder(
            //     valueListenable: todoBox.listenable(),
            //     builder: (context, box, child) {
            //       return Expanded(
            //         child: ListView.builder(
            //             itemCount: todoBox.length,
            //             itemBuilder: (context, index) {
            //               final todo = todoBox.getAt(index);
            //               return ListTile(
            //                 title: Text(todo!.tittle.toString()),
            //                 subtitle: Text(
            //                   todo!.todo.toString(),
            //                 ),
            //               );
            //             }),
            //       );
            //     }),
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
