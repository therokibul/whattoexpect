import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whattoexpect/features/weight/controllers/weight_controller.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeightController>(
      init: WeightController(),
      initState: (_) {},
      builder: (weightController) {
        weightController.getData();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Weight Tracking'),
          ),
          body: Center(
            child: weightController.isLoading
                ? const SizedBox(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: weightController.weightList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Checkbox(
                              onChanged: (value) => weightController.addWeight(
                                  weightController.weightList[index].weight,
                                  !weightController.weightList[index].isDone,
                                  weightController.weightList[index].id),
                              value: weightController.weightList[index].isDone),
                          title:
                              Text(weightController.weightList[index].weight),
                          // subtitle: Text(weightController.weightList[index].date
                          //     .toString()),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () => addWeightDialog(
                                      weightController,
                                      'Update weight',
                                      weightController.weightList[index].id,
                                      weightController
                                          .weightList[index].weight),
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () => weightController
                                      .deleteWeight(weightController
                                          .weightList[index].id),
                                  icon: const Icon(Icons.delete),
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async =>
                await addWeightDialog(weightController, 'Add Weight', '', ''),
          ),
        );
      },
    );
  }

  addWeightDialog(WeightController weightController, String title, String id,
      String weight) async {
    if (weight.isNotEmpty) {
      _weightController.text = weight;
    }

    Get.defaultDialog(
      title: title,
      content: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _weightController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Cannot be empty';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await weightController.addWeight(
                    _weightController.text.trim(), false, id);

                _weightController.clear();
                Get.back();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
