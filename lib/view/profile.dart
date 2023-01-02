import 'package:whattoexpect/packages.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Palette.themeColor1,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  FontAwesomeIcons.user,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                // height: Get.height * 0.2,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Aishwariya Farahi',
                  textScaleFactor: 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                // height: Get.height * 0.2,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Start of last period'),
                  subtitle: Text('09 Nov 2022'),
                ),
              ),
              Container(
                width: double.infinity,
                // height: Get.height * 0.2,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Date of labor'),
                  subtitle: Text('16 Aug 2023'),
                ),
              ),
              Container(
                width: double.infinity,
                // height: Get.height * 0.2,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Date of conception'),
                  subtitle: Text('23 Nov 2022'),
                ),
              ),
              Container(
                width: double.infinity,
                // height: Get.height * 0.2,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Pregnancy Details'),
                  subtitle: Text('pregnant with One\n 2 weeks 3 days'),
                  isThreeLine: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
