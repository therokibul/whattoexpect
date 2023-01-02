import 'package:whattoexpect/packages.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  var _currentIndex = 0;
  var body = [
    const Home(),
    const Medications(),
    Kick(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        actions: [
          // CircleAvatar(
          //   radius: 20,
          //   child: CircleAvatar(
          //     radius: 18,
          //     backgroundImage: AssetImage('assets/avater.png'),
          //   ),
          // ),

          // IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.settings,
          //       color: Colors.green,
          //     )),

          SizedBox(
            width: 10,
          )
        ],
      ),
      body: body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Palette.themeColor1,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.shoePrints,
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (() {
      //     Get.to(AddMedicine());
      //   }),
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
