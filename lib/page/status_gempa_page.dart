import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/gempa_component.dart';
import '../dto/bmkg_status_gempa.dart';

class StatusGempaPage extends StatefulWidget {
  const StatusGempaPage({Key? key}) : super(key: key);

  @override
  _StatusGempaPageState createState() => _StatusGempaPageState();
}

class _StatusGempaPageState extends State<StatusGempaPage> {
  late Future<BMKGStatusGempa> _future;

  void initState() {
    super.initState();
    _future = BMKGStatusGempa.getBMKGStatusGempa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      title: Text('Status Gempa'),
                      backgroundColor: Colors.white,
                    ),
                    SliverList.list(
                        children: snapshot.data!.Infogempa.gempa.map((e) {
                      return GempaComponent(gempa: e);
                    }).toList()),
                  ],
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
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
            ]));
  }
}
