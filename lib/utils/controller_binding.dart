import 'package:get/get.dart';
import 'package:whattoexpect/features/todo/controllers/todo_controller.dart';

class ControllerBrindings extends Bindings {
  @override
  void dependencies() {
    Get.put<TodoController>(TodoController());
  }
}
