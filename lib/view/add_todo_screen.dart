import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_buddy/model/todo_model.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final tittleController = TextEditingController();
  final todoController = TextEditingController();
  final todoBox = Hive.box<TodoModel>('TodoBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                hint: 'Tittle',
                controller: tittleController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: 'Todo',
                controller: todoController,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    TodoModel newTodo = TodoModel(
                        tittle: tittleController.text,
                        todo: todoController.text,
                        isCompleted: false);
                    if (tittleController.text.isNotEmpty ||
                        todoController.text.isNotEmpty) {
                      todoBox
                          .add(newTodo)
                          .then((value) => print(newTodo.tittle));
                    }
                  },
                  child: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;

  const CustomTextField(
      {super.key, required this.controller, required this.hint});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration:
          InputDecoration(hintText: widget.hint, border: OutlineInputBorder()),
    );
  }
}
