import '../packages.dart';

class Wieght extends StatelessWidget {
   Wieght({super.key});
  List<WieghtData> data = [
    WieghtData('Jan', 75),
    WieghtData('Fab', 81),
    WieghtData('Mar', 80),
    WieghtData('Apr', 79),
    WieghtData('May', 75),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(Get.width * 0.04),
          child: Column(
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}
