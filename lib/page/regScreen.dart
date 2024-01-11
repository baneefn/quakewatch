import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'loginScreen.dart';

class RegScreen extends StatelessWidget {
  RegScreen({Key? key}) : super(key: key);
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

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
                'Create Your\nAccount',
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
                          controller: fullNameController,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.check,
                              color: Colors.grey,
                            ),
                            label: const Text(
                              'Full Name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB81736),
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.check,
                              color: Colors.grey,
                            ),
                            label: const Text(
                              'Phone or Email',
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
                                isPasswordVisible = !isPasswordVisible;
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
                        TextField(
                          controller: confirmPasswordController,
                          obscureText: !isConfirmPasswordVisible,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                // Toggling visibility confirm password
                                isConfirmPasswordVisible =
                                    !isConfirmPasswordVisible;
                              },
                              child: Icon(
                                isConfirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                            label: const Text(
                              'Confirm Password',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB81736),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        GestureDetector(
                          onTap: () {
                            final String fullName = fullNameController.text;
                            final String username = emailController.text;
                            final String password = passwordController.text;
                            final String confirmPassword =
                                confirmPasswordController.text;

                            // Validasi input
                            if (fullName.isNotEmpty &&
                                username.isNotEmpty &&
                                password.isNotEmpty &&
                                confirmPassword.isNotEmpty) {
                              // Validasi password
                              if (password == confirmPassword) {
                                // Simpan data registrasi (bisa juga disimpan ke database)
                                // Untuk sederhananya, kita simpan dalam variabel global.
                                registeredUsers[username] = password;

                                // Tampilkan dialog pop-up setelah berhasil mendaftar
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Pendaftaran Berhasil'),
                                      content: Text(
                                          'Akun berhasil dibuat. Silakan login.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            // Keluar dari dialog dan pindah ke layar login
                                            Navigator.of(context).pop();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    loginScreen(),
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Password dan Confirm Password harus sama!',
                                    ),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Harap isi semua field!'),
                                ),
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
                                'SIGN UP',
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
                          height: 80,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "Don't you have an account?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.pushNamed('login');
                                },
                                child: const Text(
                                  "Sign in",
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

Map<String, String> registeredUsers = {};
