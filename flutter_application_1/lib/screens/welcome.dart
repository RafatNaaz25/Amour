// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/SignUp.dart';
import 'package:flutter_application_1/screens/login.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              "Welcome To",
              style: TextStyle(fontFamily: "poppins", fontSize: 40),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              "AMOUR",
              style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 40,
                  color: const Color.fromARGB(255, 113, 26, 129),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.fromLTRB(55, 0, 0, 0),
            child: Container(
              width: w * 0.7,
              height: h * 0.4,
              child: Image.asset("assets/image2.png"),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ));
              },
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 113, 26, 129),
                      borderRadius: BorderRadius.circular(25)),
                  height: 50,
                  width: 260,
                  child: Text(
                    "Let's Start",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "poppins",
                        fontSize: 20),
                  )),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 15, 0, 0),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Already have an Account? Sign In",
                  style: TextStyle(fontFamily: "poppins"),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
