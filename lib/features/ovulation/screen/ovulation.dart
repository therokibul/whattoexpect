import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OvulationCalculator extends StatefulWidget {
  const OvulationCalculator({super.key});

  @override
  _OvulationCalculatorState createState() => _OvulationCalculatorState();
}

class _OvulationCalculatorState extends State<OvulationCalculator> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ovulation Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/reproductive.png',
            height: Get.height * 0.35,
          ),
          MaterialButton(
            color: Colors.pinkAccent,
            onPressed: () => _selectDate(context),
            child: const Text('Select Date'),
          ),
          Card(
            child: ListTile(
              title: const Text(
                'Selected Date: ',
              ),
              trailing: Text(
                DateFormat.yMd().format(selectedDate),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text(
                'Approximate Ovulation:',
              ),
              trailing: Text(
                calculateOvulation(selectedDate),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text(
                'Fertile Window:',
              ),
              trailing: Text(
                calculateFertileWindow(selectedDate),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text(
                'Next Period:',
              ),
              trailing: Text(
                calculateNextPeriod(selectedDate),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text(
                'Next Pregnancy Test: ',
              ),
              trailing: Text(
                calculateNextPregnancyTest(selectedDate),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String calculateOvulation(DateTime date) {
    // Assume average cycle length of 28 days
    int cycleLength = 28;
    return DateFormat.yMd().format(date.add(Duration(days: cycleLength ~/ 2)));
  }

  String calculateFertileWindow(DateTime date) {
    // Assume average cycle length of 28 days
    int cycleLength = 28;
    return '${DateFormat.yMd().format(date.subtract(Duration(days: cycleLength ~/ 2 - 2)))} to ${DateFormat.yMd().format(date.add(Duration(days: cycleLength ~/ 2 + 2)))}';
  }

  String calculateNextPeriod(DateTime date) {
    // Assume average cycle length of 28 days
    int cycleLength = 28;
    return DateFormat.yMd().format(date.add(Duration(days: cycleLength)));
  }

  String calculateNextPregnancyTest(DateTime date) {
    // Assume average cycle length of 28 days
    int cycleLength = 28;
    return DateFormat.yMd().format(date.add(Duration(days: cycleLength + 14)));
  }
}
