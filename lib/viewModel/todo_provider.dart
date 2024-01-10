import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:to_do_buddy/model/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final todoBox = Hive.box<TodoModel>("TodoBox");


  List get todoList => todoBox.values.toList();

  addTodo(String tittle, String todo, bool isCompleted) {
    final newTodo =
        TodoModel(tittle: tittle, todo: todo, isCompleted: isCompleted);
    notifyListeners();

    print(tittle);

    todoBox.add(newTodo);
  }


  deleteTodo(int index){
    todoBox.deleteAt(index);
    notifyListeners();
  }
}
