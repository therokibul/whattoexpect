import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whattoexpect/features/todo/controllers/todo_models.dart';
import 'package:whattoexpect/features/todo/db/firebase_db.dart';
import 'package:whattoexpect/features/todo/models/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todoController = Get.put(TodoController());
    TextEditingController contentTextEditorController = TextEditingController();

    return Scaffold(
      body: ListView.builder(
        itemCount: todoController.todos.length,
        itemBuilder: (BuildContext context, int index) {
          print(todoController.todos[index].content);
          final todoModel = todoController.todos[index];
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      todoModel.content,
                      style: TextStyle(
                        fontSize: Get.textTheme.headline6!.fontSize,
                        decoration: todoModel.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                  Checkbox(
                    value: todoModel.isDone,
                    onChanged: (status) {
                      FirestoreDb.updateStatus(
                        status!,
                        todoModel.documentId,
                      );
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      FirestoreDb.deleteTodo(todoModel.documentId!);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            Container(
              height: 150,
              color: Colors.grey.shade100,
              child: Column(
                children: [
                  TextField(
                    controller: contentTextEditorController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final todoModel = TodoModel(
                        content: contentTextEditorController.text.trim(),
                        isDone: false,
                      );
                      await FirestoreDb.addTodo(todoModel);
                      contentTextEditorController.clear();
                    },
                    child: const Text(
                      "Add Todo",
                    ),
                  ),
                ],
              ),
            ),
            barrierColor: Colors.red[50],
            isDismissible: false,
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(35),
            //     side: const BorderSide(width: 5, color: Colors.black)),
            enableDrag: false,
          );
        },
      ),
    );
  }
}
