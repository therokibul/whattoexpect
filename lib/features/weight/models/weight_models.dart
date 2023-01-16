import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class WeightModel {
  String id, weight;
  bool isDone;
  DateTime date;

  WeightModel(this.id, this.weight, this.isDone, this.date);
}
