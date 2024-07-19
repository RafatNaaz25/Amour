// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/photos.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsPage extends StatefulWidget {
  final String firstName;
  final String email;
  final String phoneNumber;
  final String dateOfBirth;
  final String qualification;
  final String designation;
  final String password;

  DetailsPage({
    required this.firstName,
    required this.email,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.qualification,
    required this.designation,
    required this.password
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String? _selectedGender;
  String? _selectedHeight;
  List<String> _selectedHobbies = [];

  bool _isButtonEnabled() {
    return true;
  }

  void _selectGender(String gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  void _selectHeight(String height) {
    setState(() {
      _selectedHeight = height;
    });
  }

  void _toggleHobby(String hobby) {
    setState(() {
      if (_selectedHobbies.contains(hobby)) {
        _selectedHobbies.remove(hobby);
      } else {
        _selectedHobbies.add(hobby);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var colour = Colors.black;

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
                  "Tell Us About",
                  style: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 30,
                      color: Colors.black),
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
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: h * 0.06,
                      width: w * 0.4,
                      child: Opacity(
                        opacity: _selectedGender == 'Male' ? 1.0 : 0.5,
                        child: TextButton(
                          onPressed: () {
                            _selectGender('Male');
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (states) {
                                if (_selectedGender == 'Male') {
                                  return const Color.fromARGB(255, 113, 26, 129)
                                      .withOpacity(0.8);
                                }
                                return Colors.white;
                              },
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                side: BorderSide(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: _selectedGender == 'Male'
                                      ? Colors.white
                                      : colour,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SizedBox(
                      height: h * 0.06,
                      width: w * 0.4,
                      child: Opacity(
                        opacity: _selectedGender == 'Female' ? 1.0 : 0.5,
                        child: TextButton(
                          onPressed: () {
                            _selectGender('Female');
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (states) {
                                if (_selectedGender == 'Female') {
                                  return const Color.fromARGB(255, 113, 26, 129)
                                      .withOpacity(0.8);
                                }
                                return Colors.white;
                              },
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                side: BorderSide(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Female',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: _selectedGender == 'Female'
                                      ? Colors.white
                                      : colour,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("What is your Height?",
                    style: TextStyle(fontFamily: "poppins", fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 10, 0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _selectHeight("> 160 cm");
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Container(
                          width: 140,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: _selectedHeight == "> 160 cm"
                                  ? Color.fromARGB(255, 113, 26, 129)
                                  : Colors.white,
                              border: Border.all(color: Colors.black)),
                          child: Center(
                              child: Text(
                            "> 160 cm",
                            style: TextStyle(
                                fontFamily: "poppins",
                                fontSize: 18,
                                color: _selectedHeight == "> 160 cm"
                                    ? Colors.white
                                    : Colors.black),
                          )),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _selectHeight("160-165 cm");
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Container(
                          width: 140,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: _selectedHeight == "160-165 cm"
                                  ? Color.fromARGB(255, 113, 26, 129)
                                  : Colors.white,
                              border: Border.all(color: Colors.black)),
                          child: Center(
                              child: Text(
                            "160-165 cm",
                            style: TextStyle(
                                fontFamily: "poppins",
                                fontSize: 18,
                                color: _selectedHeight == "160-165 cm"
                                    ? Colors.white
                                    : Colors.black),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 10, 0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _selectHeight("166-170 cm");
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Container(
                          width: 140,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: _selectedHeight == "166-170 cm"
                                  ? Color.fromARGB(255, 113, 26, 129)
                                  : Colors.white,
                              border: Border.all(color: Colors.black)),
                          child: Center(
                              child: Text(
                            "166-170 cm",
                            style: TextStyle(
                                fontFamily: "poppins",
                                fontSize: 18,
                                color: _selectedHeight == "166-170 cm"
                                    ? Colors.white
                                    : Colors.black),
                          )),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _selectHeight("< 170 cm");
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Container(
                          width: 140,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: _selectedHeight == "< 170 cm"
                                  ? Color.fromARGB(255, 113, 26, 129)
                                  : Colors.white,
                              border: Border.all(color: Colors.black)),
                          child: Center(
                              child: Text(
                            "< 170 cm",
                            style: TextStyle(
                                fontFamily: "poppins",
                                fontSize: 18,
                                color: _selectedHeight == "< 170 cm"
                                    ? Colors.white
                                    : Colors.black),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("What are your Hobbies?",
                    style: TextStyle(fontFamily: "poppins", fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 5, 0),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    InkWell(
                      onTap: () {
                        _toggleHobby("Self Care");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _selectedHobbies.contains("Self Care")
                              ? Color.fromARGB(255, 113, 26, 129)
                              : Colors.white,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text(
                          "SelfCare",
                          style: TextStyle(
                            color: _selectedHobbies.contains("Self Care")
                                ? Colors.white
                                : Colors.black,
                            fontFamily: "poppins",
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _toggleHobby("Sports");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _selectedHobbies.contains("Sports")
                              ? Color.fromARGB(255, 113, 26, 129)
                              : Colors.white,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text(
                          "Sports",
                          style: TextStyle(
                            color: _selectedHobbies.contains("Sports")
                                ? Colors.white
                                : Colors.black,
                            fontFamily: "poppins",
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _toggleHobby("Reading");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _selectedHobbies.contains("Reading")
                              ? Color.fromARGB(255, 113, 26, 129)
                              : Colors.white,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text(
                          "Reading",
                          style: TextStyle(
                            color: _selectedHobbies.contains("Reading")
                                ? Colors.white
                                : Colors.black,
                            fontFamily: "poppins",
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 5, 0),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    InkWell(
                      onTap: () {
                        _toggleHobby("Movies");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _selectedHobbies.contains("Movies")
                              ? Color.fromARGB(255, 113, 26, 129)
                              : Colors.white,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text(
                          "Movies",
                          style: TextStyle(
                            color: _selectedHobbies.contains("Movies")
                                ? Colors.white
                                : Colors.black,
                            fontFamily: "poppins",
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _toggleHobby("Dance");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _selectedHobbies.contains("Dance")
                              ? Color.fromARGB(255, 113, 26, 129)
                              : Colors.white,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text(
                          "Dance",
                          style: TextStyle(
                            color: _selectedHobbies.contains("Dance")
                                ? Colors.white
                                : Colors.black,
                            fontFamily: "poppins",
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _toggleHobby("Painting");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _selectedHobbies.contains("Painting")
                              ? Color.fromARGB(255, 113, 26, 129)
                              : Colors.white,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text(
                          "Painting",
                          style: TextStyle(
                            color: _selectedHobbies.contains("Painting")
                                ? Colors.white
                                : Colors.black,
                            fontFamily: "poppins",
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 5, 0),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    InkWell(
                      onTap: () {
                        _toggleHobby("Gaming");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _selectedHobbies.contains("Gaming")
                              ? Color.fromARGB(255, 113, 26, 129)
                              : Colors.white,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text(
                          "Gaming",
                          style: TextStyle(
                            color: _selectedHobbies.contains("Gaming")
                                ? Colors.white
                                : Colors.black,
                            fontFamily: "poppins",
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _toggleHobby("Drawing");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _selectedHobbies.contains("Drawing")
                              ? Color.fromARGB(255, 113, 26, 129)
                              : Colors.white,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text(
                          "Drawing",
                          style: TextStyle(
                            color: _selectedHobbies.contains("Drawing")
                                ? Colors.white
                                : Colors.black,
                            fontFamily: "poppins",
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _toggleHobby("Singing");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _selectedHobbies.contains("Singing")
                              ? Color.fromARGB(255, 113, 26, 129)
                              : Colors.white,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text(
                          "Singing",
                          style: TextStyle(
                            color: _selectedHobbies.contains("Singing")
                                ? Colors.white
                                : Colors.black,
                            fontFamily: "poppins",
                            fontSize: 18,
                          ),
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
      floatingActionButton: _isButtonEnabled()
          ? FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 113, 26, 129),
              onPressed: () {
                // Navigate to the next page and pass the necessary data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => photosPage(
                      firstName: widget.firstName,
                      email: widget.email,
                      phoneNumber: widget.phoneNumber,
                      dateOfBirth: widget.dateOfBirth,
                      qualification: widget.qualification,
                      designation: widget.designation,
                      password: widget.password,
                      gender: _selectedGender ?? "",
                      height: _selectedHeight ?? "",
                      hobbies: _selectedHobbies,
                    ),
                  ),
                );
              },
              child: FaIcon(
                FontAwesomeIcons.angleRight,
                color: Colors.white,
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
