// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screens/login.dart';
// Import your LoginPage file

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? userName;
  String? profileImage;
  String? email;
  String? dateOfBirth;
  String? designation;
  String? qualification;
  String? phoneNumber;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    User user = FirebaseAuth.instance.currentUser!;
    String? userId = user.email;
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    setState(() {
      userName = userSnapshot[
          'firstName']; // Replace 'firstName' with the field name containing the user's name
      profileImage = userSnapshot[
          'image2Url']; // Replace 'profileImage' with the field name containing the profile image URL
      email = userSnapshot[
          'email']; // Replace 'email' with the field name containing the user's email
      dateOfBirth = userSnapshot[
          'dateOfBirth']; // Assuming 'dateOfBirth' is stored as a Firebase Timestamp
      designation = userSnapshot[
          'designation']; // Replace 'designation' with the field name containing the user's designation
      qualification = userSnapshot['qualification'];
      phoneNumber = userSnapshot[
          'phoneNumber']; // Replace 'qualification' with the field name containing the user's qualification
    });
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              if (profileImage != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(profileImage!),
                      radius: 90,
                    ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 30, 0),
                child: Text(
                  'Name:',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 30, 10),
                child: Text(
                  userName ?? 'Loading...',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color.fromARGB(255, 113, 26, 129),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 30, 0),
                child: Text(
                  'Email:',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 30, 10),
                child: Text(
                  email ?? '',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 113, 26, 129),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 30, 0),
                child: Text(
                  'Date of Birth:',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 30, 10),
                child: Text(
                  dateOfBirth ?? '',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 113, 26, 129),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 30, 0),
                child: Text(
                  'Designation:',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 30, 10),
                child: Text(
                  designation ?? '',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 113, 26, 129),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 30, 0),
                child: Text(
                  'Qualification:',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 30, 10),
                child: Text(
                  qualification ?? '',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 113, 26, 129),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 30, 0),
                child: Text(
                  'Phone Number:',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 30, 10),
                child: Text(
                  phoneNumber ?? '',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 113, 26, 129),
                  ),
                ),
              ),
             
              Center(
                
                child: Container(
                  
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 113, 26, 129),
                    
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: TextButton(
                    
                    onPressed: _logout,
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
