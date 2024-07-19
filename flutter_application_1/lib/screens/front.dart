// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  List<DocumentSnapshot> userList = [];
  late String? currentUserId; // ID of the currently logged-in user

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    fetchUserData();
  }

  Future<void> getCurrentUser() async {
    // Get the ID of the currently logged-in user
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUserId = user.email;
      });
    }
  }

  Future<void> fetchUserData() async {
    // Fetch user details from Firestore
    QuerySnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    // Update the state with the fetched user details
    setState(() {
      userList = userSnapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 113, 26, 129),
        title: Text('AMOUR'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          String? profileImage = userList[index]['image2Url'];
          String? designation = userList[index]['designation'];
          String? education = userList[index]['qualification'];

          // Check if the user is the currently logged-in user
          if (userList[index].id == currentUserId) {
            return SizedBox.shrink(); // Skip displaying the current user's profile
          }

          return UserCard(
            profileImage: profileImage,
            designation: designation,
            education: education,
          );
        },
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String? profileImage;
  final String? designation;
  final String? education;

  const UserCard({
    Key? key,
    required this.profileImage,
    required this.designation,
    required this.education,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (profileImage != null)
            Container(
              width: double.infinity,
              height: 380,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(profileImage!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  designation ?? 'Unknown',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  education ?? 'Unknown',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
