// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class setPage extends StatefulWidget {
  final String firstName;
  final String email;
  final String phoneNumber;
  final String dateOfBirth;
  final String qualification;
  final String designation;
  final String password;
  final String gender;
  final String height;
  final List<String> hobbies;
  final String image1;
  final String image2;
  final String image3;
  final String image4;

  setPage({
    required this.firstName,
    required this.email,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.qualification,
    required this.designation,
    required this.password,
    required this.gender,
    required this.height,
    required this.hobbies,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
  });

  @override
  State<setPage> createState() => _setPageState();
}

class _setPageState extends State<setPage> {
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: widget.email.trim(),
        password: widget.password.trim(),
      );
      print("user Created");

      await addUserDetails(
        widget.firstName.trim(),
        widget.email.trim(),
        widget.phoneNumber.trim(),
        widget.dateOfBirth.trim(),
        widget.qualification.trim(),
        widget.designation.trim(),
        widget.gender.trim(),
        widget.height.trim(),
        widget.hobbies,
        widget.image1.trim(),
        widget.image2.trim(),
        widget.image3.trim(),
        widget.image4.trim(),
      );
    } catch (e) {
      print("Error: $e");
      // Handle errors here
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> addUserDetails(
    String firstName,
    String email,
    String phoneNumber,
    String dateOfBirth,
    String qualification,
    String designation,
    String gender,
    String height,
    List<String> hobbies,
    String image1,
    String image2,
    String image3,
    String image4,
  ) async {
    String hobbiesString = hobbies.join(', '); // Concatenate hobbies into a single string

    await _firestore.collection('users').doc(email).set({
      "firstName": firstName,
      "email": email,
      "phoneNumber": phoneNumber,
      "dateOfBirth": dateOfBirth,
      "qualification": qualification,
      "designation": designation,
      "gender": gender,
      "height": height,
      "hobbies": hobbiesString, // Store hobbies as a single string
      "image1Url": image1,
      "image2Url": image2,
      "image3Url": image3,
      "image4Url": image4,
    }).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => homePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 113, 26, 129),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "All Set!",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "poppins",
                fontSize: 32,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.done,
                    size: 75,
                    color: Color.fromARGB(255, 113, 26, 129),
                  ),
                ),
              )
            ],
          ),
        ]),
      floatingActionButton: _isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          :FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => signUp(),
        child: FaIcon(
          FontAwesomeIcons.angleRight,
          color: Color.fromARGB(255, 113, 26, 129),
        ),
      ),
    );
  }
}
