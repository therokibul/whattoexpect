import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String id, task;
  bool isDone;

  TaskModel(this.id, this.task, this.isDone);
}