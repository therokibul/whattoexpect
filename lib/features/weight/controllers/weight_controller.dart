import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:whattoexpect/features/weight/models/weight_models.dart';

class WeightController extends GetxController {
  var isLoading = false;
  var weightList = <WeightModel>[];
 


  Future<void> addWeight(String weight, bool done, String id) async {
     DateTime now = DateTime.now();

    await FirebaseFirestore.instance
        .collection('weight')
        .doc(id != '' ? id : null)
        .set(
      {
        'weight': weight,
        'isDone': done,
        'date': now,
      },
      SetOptions(merge: true),
    ).then(
      (value) => getData(),
    );
  }

  Future<void> getData() async {
    try {
      QuerySnapshot _weightSnap = await FirebaseFirestore.instance
          .collection('weight')
          .orderBy('weight')
          .get();

      weightList.clear();

      for (var item in _weightSnap.docs) {
        weightList.add(
          WeightModel(item.id, item['weight'], item['isDone'],item['date']),
        );
      }
      isLoading = false;
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteWeight(String id) {
    FirebaseFirestore.instance.collection('weight').doc(id).delete();
  }
}