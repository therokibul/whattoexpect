import 'package:whattoexpect/packages.dart';

class Medications extends StatefulWidget {
  const Medications({Key? key}) : super(key: key);

  @override
  State<Medications> createState() => _MedicationsState();
}

class _MedicationsState extends State<Medications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Trimester chart',
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 2,
              ),
            ),
            Container(
              width: double.infinity,
              // height: Get.height * 0.2,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
