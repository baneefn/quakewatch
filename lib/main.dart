import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:quakewatch/firebase_options.dart';
import 'package:quakewatch/page/WelcomeScreen.dart';
import 'package:quakewatch/page/loginScreen.dart';
import 'package:quakewatch/page/more_page.dart';
import 'package:quakewatch/page/profile_page.dart';
import 'package:quakewatch/page/status_gempa_page.dart';

import 'controller/calculate_controller.dart';
import 'controller/theme_controller.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'welcome',
      builder: (context, state) {
        return const WelcomeScreen();
      },
    ),
    GoRoute(
      path: '/status',
      name: 'status',
      builder: (context, state) {
        return StatusGempaPage();
      },
    ),
    GoRoute(
      path: '/more',
      name: 'more',
      builder: (context, state) {
        return const MorePage();
      },
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) {
        return const ProfilePage();
      },
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) {
        return loginScreen();
      },
    ),
    // GoRoute(
    //   path: '/binding',
    //   name: 'binding',
    //   builder: (context, state) {
    //     return  MyBindings();
    //   },
    // ),
  ],
);

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalculateController());
    Get.lazyPut(() => ThemeController());
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  Get.put(CalculateController());
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My Calculator',
      theme: ThemeData(
        fontFamily: ('inter'),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
