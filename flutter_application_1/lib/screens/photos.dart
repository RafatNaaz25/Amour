// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/set.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class photosPage extends StatefulWidget {
  final String firstName;
  final String email;
  final String phoneNumber;
  final String dateOfBirth;
  final String qualification;
  final String designation;
  final String password;
  final String? gender;
  final String? height;
  final List<String> hobbies;

  photosPage({
    required this.firstName,
    required this.email,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.qualification,
    required this.designation,
    required this.gender,
    required this.height,
    required this.hobbies, 
    required this.password
  });

  @override
  State<photosPage> createState() => _photosPageState();
}

class _photosPageState extends State<photosPage> {
  File? _image1;
  File? _image2;
  File? _image3;
  File? _image4;
  final ImagePicker _picker = ImagePicker();
  bool _uploading = false;
  String? _image1Url;
  String? _image2Url;
  String? _image3Url;
  String? _image4Url;

  
  Future<void> uploadImages() async {
    try {
      setState(() {
        _uploading = true;
      });

      if (_image1 != null) {
        _image1Url = await uploadImageToStorage(_image1!);
      }

      if (_image2 != null) {
        _image2Url = await uploadImageToStorage(_image2!);
      }

      if (_image3 != null) {
        _image3Url = await uploadImageToStorage(_image3!);
      }

      if (_image4 != null) {
        _image4Url = await uploadImageToStorage(_image4!);
      }
    } catch (e) {
      print("Error uploading images: $e");
    } finally {
      setState(() {
        _uploading = false;
      });
    }
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
                padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                child: Text(
                  "Add your Best",
                  style: TextStyle(fontFamily: "poppins", fontSize: 30),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                child: Text(
                  "Photos!",
                  style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => getImage(1),
                        child: Container(
                          height: h * 0.2,
                          width: w * 0.35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: _image1 != null
                                ? DecorationImage(
                                    image: FileImage(_image1!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: _image1 == null
                              ? const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 40,
                                )
                              : null,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => getImage(2),
                        child: Container(
                          height: h * 0.2,
                          width: w * 0.35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: _image2 != null
                                ? DecorationImage(
                                    image: FileImage(_image2!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: _image2 == null
                              ? const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 40,
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => getImage(3),
                        child: Container(
                          height: h * 0.2,
                          width: w * 0.35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: _image3 != null
                                ? DecorationImage(
                                    image: FileImage(_image3!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: _image3 == null
                              ? const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 40,
                                )
                              : null,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => getImage(4),
                        child: Container(
                          height: h * 0.2,
                          width: w * 0.35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: _image4 != null
                                ? DecorationImage(
                                    image: FileImage(_image4!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: _image4 == null
                              ? const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 40,
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: _areFieldsFilled()
      //     ? FloatingActionButton(
      //         backgroundColor: Color.fromARGB(255, 113, 26, 129),
      //         onPressed: () {
      //           // Navigate to the next page and pass the necessary data
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => setPage(
      //                 firstName: widget.firstName,
      //                 email: widget.email,
      //                 phoneNumber: widget.phoneNumber,
      //                 dateOfBirth: widget.dateOfBirth,
      //                 qualification: widget.qualification,
      //                 designation: widget.designation,
      //                 gender: widget.gender!,
      //                 height: widget.height!,
      //                 hobbies: widget.hobbies,
      //                   image1: _image1Url!,
      //                   image2: _image2Url!,
      //                   image3: _image3Url!,
      //                   image4: _image4Url!,
      //               ),
      //             ),
      //           );
      //         },
      //         child: FaIcon(
      //           FontAwesomeIcons.angleRight,
      //           color: Colors.white,
      //         ),
      //       )
      //     : null,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
       floatingActionButton: _areFieldsFilled()
          ? FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                uploadImages().then((_) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => setPage(
                        firstName: widget.firstName,
                      email: widget.email,
                      phoneNumber: widget.phoneNumber,
                      dateOfBirth: widget.dateOfBirth,
                      qualification: widget.qualification,
                      designation: widget.designation,
                      password: widget.password,
                      gender: widget.gender!,
                      height: widget.height!,
                      hobbies: widget.hobbies,
                        image1: _image1Url!,
                        image2: _image2Url!,
                        image3: _image3Url!,
                        image4: _image4Url!,
                      ),
                    ),
                  );
                });
              },
              child: const FaIcon(
                FontAwesomeIcons.angleRight,
                color: Colors.black,
              ),
            )
          : SizedBox.shrink(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  bool _areFieldsFilled() {
    return _image1 != null &&
        _image2 != null &&
        _image3 != null &&
        _image4 != null;
  }

  Future<void> getImage(int boxNumber) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        switch (boxNumber) {
          case 1:
            _image1 = File(pickedFile.path);
            break;
          case 2:
            _image2 = File(pickedFile.path);
            break;
          case 3:
            _image3 = File(pickedFile.path);
            break;
          case 4:
            _image4 = File(pickedFile.path);
            break;
          default:
            break;
        }
      }
    });
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    String email = widget.email;
    String imageName = 'image${DateTime.now().millisecondsSinceEpoch}.png';
    Reference ref =
        FirebaseStorage.instance.ref().child('$email/image/${imageName}');
    UploadTask uploadTask =
        ref.putFile(imageFile, SettableMetadata(contentType: 'image/png'));
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    print("this is download URL: " + downloadURL);
    return downloadURL;
  }
}
