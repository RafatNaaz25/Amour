// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/front.dart';
import 'package:flutter_application_1/screens/profile.dart';
import 'package:flutter_application_1/screens/search.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
   final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    FrontPage(),
    SearchPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Positioned.fill(
              child: _pages[_selectedIndex],
            ),
          ),
         
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 113, 26, 129),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () => _onItemTapped(0),
                    icon: FaIcon(
                      FontAwesomeIcons.heart,
                      color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _onItemTapped(1),
                    icon: FaIcon(
                      FontAwesomeIcons.search,
                      color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _onItemTapped(2),
                    icon: FaIcon(
                      FontAwesomeIcons.userLarge,
                      color: _selectedIndex == 2 ? Colors.white : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
