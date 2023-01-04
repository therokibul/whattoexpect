import 'package:whattoexpect/packages.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    var userName = currentUser?.displayName;
    String? userPhoto = currentUser?.photoURL.toString();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(const Profile());
                  },
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(userPhoto!),
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
                    userName!,
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
                    leading: const Icon(FontAwesomeIcons.arrowRightFromBracket),
                    title: const Text('Log Out'),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Get.toEnd(() => SignIn());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
