import 'package:flutter/material.dart';
import 'package:quakewatch/page/regScreen.dart';
import 'package:quakewatch/page/status_gempa_page.dart';

class loginScreen extends StatefulWidget {
  loginScreen({Key? key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  // void signUserIn() async {
  //   try {
  //     final userCredential =
  //         await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //
  //     final userDocument = await FirebaseFirestore.instance
  //         .collection('Users')
  //         .doc(userCredential.user!.uid)
  //         .get();
  //
  //     if (!userDocument.exists) {
  //       await FirebaseAuth.instance.signOut();
  //       showInfoDialog("Akun tidak terdaftar. Silakan daftar terlebih dahulu.");
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     String errorMessage = "Terjadi kesalahan saat login";
  //
  //     if (e.code == 'wrong-password') {
  //       errorMessage = "Password salah";
  //     } else if (e.code == 'user-not-found') {
  //       errorMessage = "Email tidak terdaftar";
  //     }
  //
  //     showInfoDialog(errorMessage);
  //     print('Error during sign in: ${e.message}');
  //   }
  // }
  //
  // void showInfoDialog(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.lightBlue[900],
  //         title: Text(
  //           'Information',
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         content: Text(
  //           message,
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         actions: [
  //           TextButton(
  //             child: Text(
  //               'OK',
  //               style: TextStyle(color: Colors.amber),
  //             ),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ]),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Hello\nSign in!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.check,
                              color: Colors.grey,
                            ),
                            label: const Text(
                              'Email',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB81736),
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          controller: passwordController,
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                // Toggling visibility password
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              child: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                            label: const Text(
                              'Password',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB81736),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Color(0xff281537),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        GestureDetector(
                          onTap: () {
                            final String username = emailController.text;
                            final String password = passwordController.text;

                            // Validasi login
                            if (registeredUsers.containsKey(username) &&
                                registeredUsers[username] == password) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Login Berhasil'),
                                    content: Text('Selamat datang!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  StatusGempaPage(),
                                            ),
                                          );
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Login Gagal'),
                                    content: Text(
                                        'Login gagal! Periksa kembali username dan password.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 55,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(colors: [
                                Color(0xffB81736),
                                Color(0xff281537),
                              ]),
                            ),
                            child: const Center(
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 150,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
