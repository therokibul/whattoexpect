
import 'package:get/get.dart';
import 'package:whattoexpect/features/todo/db/firebase_db.dart';
import 'package:whattoexpect/features/todo/models/todo_model.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>([]);
  List<TodoModel> get todos => todoList.value;

  @override
  void onReady() {
    todoList.bindStream(FirestoreDb.todoStream());
  }
}