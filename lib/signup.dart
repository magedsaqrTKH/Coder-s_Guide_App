import '../login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../controllers.dart';

class regpage extends StatefulWidget {
  const regpage({super.key});

  @override
  State<regpage> createState() => regpagerstate();
}

class regpagerstate extends State<regpage> {
  final signups = signupcontrollers();

  @override
  void dispose() {
    signups.emailcontroller.dispose();
    signups.passwordcontroller.dispose();
    super.dispose();
  }

  Future signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signups.emailcontroller.text.trim(),
        password: signups.passwordcontroller.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 172, 186, 183),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Sign up here ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 30),
                ),
                const SizedBox(height: 30),

                // email field
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: signups.emailcontroller,
                    cursorColor: const Color(0xffF5591F),
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Color(0xffF5591F),
                      ),
                      hintText: "Enter Email",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // password field
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: signups.passwordcontroller,
                    obscureText: true,
                    cursorColor: const Color(0xffF5591F),
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Color(0xffF5591F),
                      ),
                      hintText: "Enter password",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 50),

                // signup button
                GestureDetector(
                  onTap: () {
                    signup();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const loginscreen()));
                    AlertDialog(content: Text(toString()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 85, 144, 245),
                            Color.fromARGB(255, 76, 179, 243)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE),
                        ),
                      ],
                    ),
                    child: const Text(
                      "signup",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // login link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("already have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const loginscreen()),
                        );
                      },
                      child: const Text(
                        " login here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


