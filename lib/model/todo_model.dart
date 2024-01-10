import 'package:hive/hive.dart';


part 'todo_model.g.dart';
@HiveType(typeId: 1)
class TodoModel {
  @HiveField(0)
  final String tittle;
  @HiveField(1)
  final String todo;
  @HiveField(2)
   bool isCompleted;

  @HiveField(3)
   TodoModel(
      {required this.tittle, required this.todo, required this.isCompleted});
}
