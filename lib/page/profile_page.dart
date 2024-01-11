import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffB81736),
              Color(0xff281537),
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  maxRadius: 65,
                  backgroundImage: AssetImage("assets/bani.png"),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: const [
            //     CircleAvatar(
            //       backgroundImage: AssetImage("assets/google.png"),
            //     ),
            //     SizedBox(
            //       width: 15,
            //     ),
            //     CircleAvatar(
            //       backgroundImage: AssetImage("assets/github.png"),
            //     ),
            //     SizedBox(
            //       width: 15,
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Bani Faza Naufal",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 26,
                      color: Colors.white),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("@baneefn",
                    style: TextStyle(fontSize: 20, color: Colors.white))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "NRP : 15-2021-086",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: Expanded(
                  child: ListView(
                children: [
                  Card(
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                    color: Colors.white70,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: const ListTile(
                      leading: Icon(
                        Icons.privacy_tip_sharp,
                        color: Colors.black54,
                      ),
                      title: Text(
                        'Privacy',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: Colors.white70,
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: const ListTile(
                      leading: Icon(
                        Icons.history,
                        color: Colors.black54,
                      ),
                      title: Text(
                        'Purchase History',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: Colors.white70,
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: const ListTile(
                      leading: Icon(Icons.help_outline, color: Colors.black54),
                      title: Text(
                        'Help & Support',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: Colors.white70,
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: const ListTile(
                      leading: Icon(
                        Icons.privacy_tip_sharp,
                        color: Colors.black54,
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: Colors.white70,
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: const ListTile(
                      leading: Icon(
                        Icons.add_reaction_sharp,
                        color: Colors.black54,
                      ),
                      title: Text(
                        'Invite a Friend',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: Colors.white70,
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Tampilkan dialog konfirmasi
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Konfirmasi Logout'),
                              content: Text('Apakah Anda yakin ingin logout?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    // Keluar dari dialog
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Batal'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Keluar dari dialog dan navigasi ke halaman welcome
                                    Navigator.of(context).pop();
                                    context.goNamed('welcome');
                                  },
                                  child: Text('Ya'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Colors.black54,
                        ),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                  )
                ],
              )),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          selectedItemColor: Colors.deepPurple,
          onTap: (value) {
            if (value == 0) {
              context.goNamed('status');
            } else if (value == 1) {
              context.goNamed('more');
            } else if (value == 2) {
              context.goNamed('profile');
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.monitor_heart_outlined),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'More',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}
