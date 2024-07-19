// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/details.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var s1 = TextEditingController();
  var s2 = TextEditingController();
  var s3 = TextEditingController();
  var s4 = TextEditingController();
  var s5 = TextEditingController();
  var s6 = TextEditingController();
  var s7 = TextEditingController();

  bool _isButtonEnabled() {
    return s1.text.isNotEmpty &&
        s2.text.isNotEmpty &&
        s3.text.isNotEmpty &&
        s4.text.isNotEmpty &&
        s5.text.isNotEmpty &&
        s6.text.isNotEmpty &&  
        s7.text.isNotEmpty;
  }
  @override
  void dispose() {
    s1.dispose();
    s2.dispose();
    s3.dispose();
    s4.dispose();
    s5.dispose();
    s6.dispose();
    s7.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 113, 26, 129),
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
                  "Tell Us About",
                  style: TextStyle(
                      fontFamily: "poppins", fontSize: 30, color: Colors.white),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "Yourself",
                  style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextField(
                  controller: s1,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Your Name",
                    labelStyle: TextStyle(color: Color.fromARGB(255, 213, 202, 202)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextField(
                  controller: s2,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Color.fromARGB(255, 213, 202, 202)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextField(
                  controller: s3,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    labelStyle: TextStyle(color: Color.fromARGB(255, 213, 202, 202)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextField(
                  controller: s4,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Date of Birth (DD/MM/YYYY)",
                    labelStyle: TextStyle(color: Color.fromARGB(255, 213, 202, 202)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: s5,
                  decoration: InputDecoration(
                    labelText: "Qualification",
                    labelStyle: TextStyle(color: Color.fromARGB(255, 213, 202, 202)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: s6,
                  decoration: InputDecoration(
                    
                    labelText: "Designation",
                    labelStyle: TextStyle(color: Color.fromARGB(255, 213, 202, 202)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: s7,
                  decoration: InputDecoration(
                    
                    labelText: "Password",
                    labelStyle: TextStyle(color: Color.fromARGB(255, 213, 202, 202)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ),
            
            ],
          ),
        ),
      ),
       floatingActionButton: _isButtonEnabled()
          ? FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                // Navigate to the next page and pass the text field value and selected gender
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      firstName: s1.text,
                      email: s2.text,
                      phoneNumber: s3.text,
                      dateOfBirth: s4.text,
                      qualification: s5.text,
                      designation: s6.text,
                      password: s7.text
                    ),
                  ),
                );
              },
              child: FaIcon(
                FontAwesomeIcons.angleRight,
                color: Colors.black,
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );
  }
}
