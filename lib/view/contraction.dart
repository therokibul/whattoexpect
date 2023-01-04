import 'package:whattoexpect/packages.dart';

class Contraction extends StatelessWidget {
  const Contraction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(color: Color(0xfff6f5f3)),
                  child: Column(
                    children: [
                      Text(
                        'Total Duration : 00:01:25',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Reset Counter'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(color: Color(0xfff2f5fb)),
                  child: Column(
                    children: [
                      Text(
                        '00:01:25',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Since the beginnign of last contraction',
                        style: TextStyle(
                          // fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MaterialButton(
                        color: Colors.pink,
                        onPressed: () {},
                        child: Text('Reset Counter'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    width: double.infinity,
                    // height: Get.height * 0.2,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Table(
                      children: const [
                        TableRow(children: [
                          Text('Start Time', style: TextStyle(fontSize: 20.0)),
                          Text('Stop Time', style: TextStyle(fontSize: 20.0)),
                          Text('Length', style: TextStyle(fontSize: 20.0)),
                          Text('Frequency', style: TextStyle(fontSize: 20.0)),
                        ]),
                        TableRow(children: [
                          Text('10:28:45 am'),
                          Text('10:30:45 am'),
                          Text('00:01:24'),
                          Text('00:00:09'),
                        ]),
                        TableRow(children: [
                          Text('10:28:36 am'),
                          Text('10:28:39 am'),
                          Text('00:00:03'),
                          Text('00:03:20'),
                        ]),
                        TableRow(children: [
                          Text('10:25:16 am'),
                          Text('10:28:39 am'),
                          Text('00:00:03'),
                          Text('00:03:20'),
                        ]),
                        TableRow(children: [
                          Text('10:25:16 am'),
                          Text('10:25:17 am'),
                          Text('00:00:01'),
                          Text('00:00:03'),
                        ]),
                        TableRow(children: [
                          Text('10:25:13 am'),
                          Text('10:25:15 am'),
                          Text('00:00:02'),
                          Text('-----'),
                        ]),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
