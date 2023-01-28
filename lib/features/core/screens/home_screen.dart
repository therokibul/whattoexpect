import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:whattoexpect/constants/text_strings.dart';
import 'package:whattoexpect/features/contraction/contraction.dart';
import 'package:whattoexpect/features/kick/kick_screen.dart';
import 'package:whattoexpect/features/profile/profile.dart';
import 'package:whattoexpect/features/todo/screens/todo_screen.dart';
import 'package:whattoexpect/features/weight/screens/weight_screen.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    var userName = currentUser?.displayName;
    String? userPhoto = currentUser?.photoURL.toString();
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(uuid)
          .collection('info')
          .doc('user')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        var data = snapshot.data;
        Timestamp timestamp = data!['lastPeriod'];
        DateTime dateTime = timestamp.toDate();
        DateTime newTime = dateTime.add(const Duration(days: 280));
        var formatter = DateFormat('dd-MM-yyyy');

        String dueDate = formatter.format(newTime);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                snap: true,
                floating: true,
                expandedHeight: 200,
                // centerTitle: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Text(
                    'Hi, ${data['name']}',
                    style: TextStyle(
                        color: Colors.pink.shade100,
                        fontWeight: FontWeight.bold),
                    // textScaleFactor: 2,
                  ),
                  background: SvgPicture.asset('assets/baby.svg'),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      Get.to(const Profile());
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/avater.png'),
                    ),
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      width: double.infinity,
                      // height: Get.height * 0.2,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xff73c9c6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    // color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(40)),
                                child: Lottie.asset(
                                  'assets/animation/baby.json',
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: const [
                                  Text(
                                    '26 Week',
                                    style: TextStyle(color: Colors.white),
                                    textScaleFactor: 2,
                                  ),
                                  // Text('Your baby is now the size of a gourd'),
                                ],
                              )
                            ],
                          ),
                          const Divider(),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.6),
                                  Colors.white.withOpacity(0.3),
                                ],
                                begin: AlignmentDirectional.topStart,
                                end: AlignmentDirectional.bottomEnd,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: const [
                                    Text(
                                      'Height',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '35 cm',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text(
                                      'weight',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '910 gram',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text(
                                      'Week Left',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '14 weeks',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Container(
                      width: double.infinity,
                      // height: Get.height * 0.2,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: const Icon(
                          FontAwesomeIcons.calendar,
                          color: Color(0xff73c9c6),
                        ),
                        title: const Text('Due Date'),
                        subtitle: Text(
                          dueDate,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverGrid.count(
                crossAxisCount: 2,
                children: [
                  navButton(() {
                    Get.to(const WeightScreen());
                  }, 'Weight', 'assets/icons/scale.png'),
                  navButton(() {
                    Get.to(const KickScreen());
                  }, 'Kick', 'assets/icons/baby-feet.png'),
                  navButton(() {
                    Get.to(const ContractionScreen());
                  }, 'Contraction', 'assets/icons/contraction.png'),
                  navButton(() {}, 'Ovulation', 'assets/icons/sperm.png'),
                  navButton(() {}, 'Memory', 'assets/icons/photos.png'),
                  navButton(() {
                    Get.to(const TodoList());
                  }, 'Todo List', 'assets/icons/checklist.png'),
                ],
              ),
            ],
          ),
        );
      },
    ));
  }

  InkWell navButton(VoidCallback ontap, String text, String image) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 150,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xffe3faff),
        ),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: Image(
                image: AssetImage(image),
              ),
            ),
            Flexible(flex: 1, child: Text(text))
          ],
        ),
      ),
    );
  }
}

class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    var userName = currentUser?.displayName;
    String? userPhoto = currentUser?.photoURL.toString();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              snap: true,
              floating: true,
              expandedHeight: 200,
              // centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  'Hi, $userName',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  // textScaleFactor: 2,
                ),
                background: SvgPicture.asset('assets/baby.svg'),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    Get.to(const Profile());
                  },
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/avater.png'),
                  ),
                )
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    width: double.infinity,
                    // height: Get.height * 0.2,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xff73c9c6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  // color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Lottie.asset(
                                'assets/animation/baby.json',
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: const [
                                Text(
                                  '26 Week',
                                  style: TextStyle(color: Colors.white),
                                  textScaleFactor: 2,
                                ),
                                // Text('Your baby is now the size of a gourd'),
                              ],
                            )
                          ],
                        ),
                        const Divider(),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.6),
                                Colors.white.withOpacity(0.3),
                              ],
                              begin: AlignmentDirectional.topStart,
                              end: AlignmentDirectional.bottomEnd,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              width: 1.5,
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    'Height',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    '35 cm',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: const [
                                  Text(
                                    'weight',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    '910 gram',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                children: const [
                                  Text(
                                    'Week Left',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    '14 weeks',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Container(
                    width: double.infinity,
                    // height: Get.height * 0.2,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const ListTile(
                      leading: Icon(
                        FontAwesomeIcons.calendar,
                        color: Color(0xff73c9c6),
                      ),
                      title: Text('Due Date'),
                      subtitle: Text(
                        '23 Octobar 2023',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              children: [
                navButton(() {
                  Get.to(const WeightScreen());
                }, 'Weight', 'assets/icons/scale.png'),
                navButton(() {
                  Get.to(const KickScreen());
                }, 'Kick', 'assets/icons/baby-feet.png'),
                navButton(() {
                  Get.to(const ContractionScreen());
                }, 'Contraction', 'assets/icons/contraction.png'),
                navButton(() {}, 'Ovulation', 'assets/icons/sperm.png'),
                navButton(() {}, 'Memory', 'assets/icons/photos.png'),
                navButton(() {
                  Get.to(const TodoList());
                }, 'Todo List', 'assets/icons/checklist.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  InkWell navButton(VoidCallback ontap, String text, String image) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 150,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xffe3faff),
        ),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: Image(
                image: AssetImage(image),
              ),
            ),
            Flexible(flex: 1, child: Text(text))
          ],
        ),
      ),
    );
  }
}
