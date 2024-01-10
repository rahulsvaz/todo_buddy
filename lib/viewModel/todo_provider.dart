import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:to_do_buddy/model/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final todoBox = Hive.box<TodoModel>("TodoBox");

  addTodo(String tittle, String todo, bool isCompleted) {
    final newTodo =
        TodoModel(tittle: tittle, todo: todo, isCompleted: isCompleted);

    print(tittle);

    todoBox.add(newTodo);
  }
}
