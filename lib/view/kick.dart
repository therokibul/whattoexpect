import 'package:whattoexpect/packages.dart';

class Kick extends StatelessWidget {
  const Kick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kick Counter'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Palette.themeColor1,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.shoePrints,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Button(text: 'Add', color: Palette.themeColor1, onTap: () {}),
                const SizedBox(
                  height: 25,
                ),
                const Divider(),
                const SizedBox(
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
                          Text('History', style: TextStyle(fontSize: 20.0)),
                          Text('Time', style: TextStyle(fontSize: 20.0)),
                          Text('Kicks', style: TextStyle(fontSize: 20.0)),
                        ]),
                        TableRow(children: [
                          Text('Nov 28'),
                          Text('9:30'),
                          Text('12'),
                        ]),
                        TableRow(children: [
                          Text('Nov 28'),
                          Text('10:30'),
                          Text('1'),
                        ]),
                        TableRow(children: [
                          Text('Nov 29'),
                          Text('11:30'),
                          Text('2'),
                        ]),
                        TableRow(children: [
                          Text('Nov 30'),
                          Text('3:30'),
                          Text('5'),
                        ]),
                        TableRow(children: [
                          Text('Nov 28'),
                          Text('9:30'),
                          Text('12'),
                        ]),
                        TableRow(children: [
                          Text('Nov 28'),
                          Text('9:30'),
                          Text('12'),
                        ]),
                        TableRow(children: [
                          Text('Nov 28'),
                          Text('9:30'),
                          Text('12'),
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
