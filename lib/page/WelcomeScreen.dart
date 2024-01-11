import 'package:flutter/material.dart';

import 'loginScreen.dart';
import 'regScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xffB81736),
              Color(0xff281537),
            ]),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 200.0),
                child: Icon(
                  Icons.monitor_heart,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              const Text(
                'QuakeWatch',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginScreen()));
                },
                child: Container(
                  height: 53,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Center(
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegScreen()));
                },
                child: Container(
                  height: 53,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Center(
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                'Login with Social Media',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/google.png"),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/github.png"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
