// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/SignUp.dart';
import 'package:flutter_application_1/screens/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  var c1 = TextEditingController();
  var c2 = TextEditingController();
   Future signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: c1.text.trim(),
            password: c2.text.trim())
        .then(
      (value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => homePage()));
      },
    );
  }

  @override
  void dispose() {
    c1.dispose();
    c2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                "Welcome Back",
                style: TextStyle(fontFamily: "poppins", fontSize: 40),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(55, 0, 0, 0),
              child: Container(
                width: w * 0.7,
                height: h * 0.4,
                child: Image.asset("assets/loginimage.png"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
              child: TextField(
                controller: c1,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined,color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
              child: TextField(
                controller: c2,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock,color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 0, 0),
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 113, 26, 129),
                      borderRadius: BorderRadius.circular(25)),
                  height: 50,
                  width: 260,
                  child: TextButton(
                    onPressed: () {
                      signIn();
                    },
                    child: Text("Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "poppins",
                            fontSize: 20)),
                  )),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Don't have an Account? Sign Up",
                    style: TextStyle(fontFamily: "poppins"),
                  ),
                ),
              ),
            )
          ],
              ),
            ),
        ));
  }
}
