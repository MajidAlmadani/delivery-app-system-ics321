import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/db/classes.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<SignUpScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _ssnController = TextEditingController();
  List<bool> _genderSelection = [true, false];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.95,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(children: [
                      Card(
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(40, 5, 40, 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                    color: Colors.greenAccent, width: 5),
                              ),
                            ),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  "Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                          controller: _nameController,
                                          keyboardType: TextInputType.number),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(40, 5, 40, 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                    color: Colors.greenAccent, width: 5),
                              ),
                            ),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  "Username",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                          controller: _usernameController,
                                          keyboardType: TextInputType.number),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(40, 5, 40, 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                    color: Colors.greenAccent, width: 5),
                              ),
                            ),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  "Password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: _passwordController,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(40, 5, 40, 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                    color: Colors.greenAccent, width: 5),
                              ),
                            ),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  "Email",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: _emailController,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(40, 5, 40, 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                    color: Colors.greenAccent, width: 5),
                              ),
                            ),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  "SSN",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: _ssnController,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(129, 5, 129, 5),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                    color: Colors.greenAccent, width: 5),
                              ),
                            ),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  "Gender",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ToggleButtons(
                                  isSelected: _genderSelection,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: Text("Male"),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: Text("Female"),
                                    ),
                                  ],
                                  onPressed: (int newIndex) {
                                    setState(() {
                                      for (int index = 0;
                                          index < _genderSelection.length;
                                          index++) {
                                        if (index == newIndex) {
                                          _genderSelection[index] = true;
                                        } else {
                                          _genderSelection[index] = false;
                                        }
                                      }
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(40, 5, 40, 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                    color: Colors.greenAccent, width: 5),
                              ),
                            ),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  "Phone Number",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: _phoneNumberController,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(40, 5, 40, 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                    color: Colors.greenAccent, width: 5),
                              ),
                            ),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  "Address",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: _addressController,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.green,
                        child: Card(
                          child: Container(
                            child: Center(child: Text('Sign up')),
                            padding: EdgeInsets.fromLTRB(40, 20, 30, 20),
                          ),
                        ),
                        onTap: () {
                          var name = _nameController.text;
                          var username = _usernameController.text;
                          var password = _passwordController.text;
                          var email = _emailController.text;
                          var ssn = _ssnController.text;
                          var gender;
                          if (_genderSelection[0]) {
                            gender = "Male";
                          } else {
                            gender = "Female";
                          }
                          var phoneNumber = _phoneNumberController.text;
                          var address = _addressController.text;
                          var isAdmin = false;
                          createUser(
                              name: name,
                              username: username,
                              password: password,
                              email: email,
                              ssn: ssn,
                              gender: gender,
                              phoneNumber: phoneNumber,
                              address: address,
                              isAdmin: isAdmin);
                          print("Winter is coming !!");
                        },
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createUser(
      {required String name,
      required String username,
      required String password,
      required String email,
      required String ssn,
      required String gender,
      required String phoneNumber,
      required String address,
      required bool isAdmin}) async {
    final docUser = FirebaseFirestore.instance.collection('PERSON').doc();

    final user = Person(
      id: docUser.id,
      name: name,
      username: username,
      password: password,
      email: email,
      ssn: ssn,
      gender: gender,
      phone_number: phoneNumber,
      address: address,
      isAdmin: isAdmin,
    );

    final json = user.toJson();

    await docUser.set(json);
  }
}
