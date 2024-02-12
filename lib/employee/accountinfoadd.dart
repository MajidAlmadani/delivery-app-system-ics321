import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/db/classes.dart';

class AccountInfoAddScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<AccountInfoAddScreen> {
  var selectedTab = 1;
  var selectedText = "First Tab";
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _retailIDController = TextEditingController();
  TextEditingController _ssnController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  List<bool> _genderSelection = [true, false];
  var gender = "Male";
  var id;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return StreamBuilder<List<Person>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Somehting went wrong ${snapshot.error}");
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            return Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Expanded(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          color: Colors.green,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    selectedTab = 1;
                                  });
                                },
                                child: Text(
                                  "Customer",
                                  style: TextStyle(
                                      fontWeight: selectedTab == 1
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: Colors.white),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    selectedTab = 2;
                                  });
                                },
                                child: Text(
                                  "Employee",
                                  style: TextStyle(
                                      fontWeight: selectedTab == 2
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 1.05,
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(children: [
                              if (selectedTab == 1) ...[
                                Card(
                                  child: ClipPath(
                                    clipper: ShapeBorderClipper(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 5, 40, 10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
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
                                                    keyboardType:
                                                        TextInputType.number),
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
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 5, 40, 10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
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
                                                    controller:
                                                        _usernameController,
                                                    keyboardType:
                                                        TextInputType.number),
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
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 5, 40, 10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
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
                                                  controller:
                                                      _passwordController,
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
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 5, 40, 10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
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
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 5, 40, 10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
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
                                                  controller:
                                                      _phoneNumberController,
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
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 5, 40, 10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
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
                                                  keyboardType:
                                                      TextInputType.number,
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
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          129, 5, 129, 5),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
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
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 12),
                                                child: Text("Male"),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 12),
                                                child: Text("Female"),
                                              ),
                                            ],
                                            onPressed: (int newIndex) {
                                              setState(() {
                                                for (int index = 0;
                                                    index <
                                                        _genderSelection.length;
                                                    index++) {
                                                  if (index == newIndex) {
                                                    _genderSelection[index] =
                                                        true;
                                                  } else {
                                                    _genderSelection[index] =
                                                        false;
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
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 5, 40, 10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
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
                                                  controller:
                                                      _addressController,
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
                                      child: Center(child: Text('Submit')),
                                      padding:
                                          EdgeInsets.fromLTRB(40, 20, 30, 20),
                                    ),
                                  ),
                                  onTap: () {
                                    createUser(
                                        name: _nameController.text,
                                        username: _usernameController.text,
                                        password: _passwordController.text,
                                        email: _emailController.text,
                                        ssn: _ssnController.text,
                                        gender: gender,
                                        phoneNumber:
                                            _phoneNumberController.text,
                                        address: _addressController.text,
                                        isAdmin: false);
                                    ;
                                  },
                                ),
                              ] else ...[
                                Card(
                                  child: ClipPath(
                                    clipper: ShapeBorderClipper(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 5, 40, 10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
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
                                                    keyboardType:
                                                        TextInputType.number),
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
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 5, 40, 10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
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
                                                    controller:
                                                        _usernameController,
                                                    keyboardType:
                                                        TextInputType.number),
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
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 5, 40, 10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
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
                                                  controller:
                                                      _passwordController,
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
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 5, 40, 10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
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
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 5, 40, 10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
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
                                                  controller:
                                                      _phoneNumberController,
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
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 5, 40, 10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
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
                                                  keyboardType:
                                                      TextInputType.number,
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
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          129, 5, 129, 5),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
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
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 12),
                                                child: Text("Male"),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 12),
                                                child: Text("Female"),
                                              ),
                                            ],
                                            onPressed: (int newIndex) {
                                              setState(() {
                                                for (int index = 0;
                                                    index <
                                                        _genderSelection.length;
                                                    index++) {
                                                  if (index == newIndex) {
                                                    _genderSelection[index] =
                                                        true;
                                                  } else {
                                                    _genderSelection[index] =
                                                        false;
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
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 5, 40, 10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
                                        ),
                                      ),
                                      child: Column(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          const Text(
                                            "Retail ID",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                    controller:
                                                        _retailIDController,
                                                    keyboardType:
                                                        TextInputType.number),
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
                                            borderRadius:
                                                BorderRadius.circular(3))),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 5, 40, 10),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 5),
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
                                                  controller:
                                                      _addressController,
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
                                      child: Center(child: Text('Submit')),
                                      padding:
                                          EdgeInsets.fromLTRB(40, 20, 30, 20),
                                    ),
                                  ),
                                  onTap: () {
                                    if (_genderSelection[0]) {
                                      gender = "Male";
                                    } else {
                                      gender = "Female";
                                    }
                                    for (var item in user) {
                                      if (item.username ==
                                          _usernameController.text) {
                                        id = item.id;
                                      }
                                    }
                                    final docUser = FirebaseFirestore.instance
                                        .collection('PERSON')
                                        .doc(id);
                                    docUser.update({
                                      'name': _nameController.text,
                                    });
                                    docUser.update({
                                      'password': _passwordController.text,
                                    });
                                    docUser.update({
                                      'email': _emailController.text,
                                    });
                                    docUser.update({
                                      'ssn': ssn.text,
                                    });
                                    docUser.update({
                                      'name': _nameController.text,
                                    });
                                    docUser.update({
                                      'name': _nameController.text,
                                    });
                                    createUser(
                                        name: _nameController.text,
                                        username: _usernameController.text,
                                        password: _passwordController.text,
                                        email: _emailController.text,
                                        ssn: _ssnController.text,
                                        gender: gender,
                                        phoneNumber:
                                            _phoneNumberController.text,
                                        address: _addressController.text,
                                        isAdmin: true);
                                  },
                                ),
                              ]
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  final FirebaseCollections collections = FirebaseCollections();

  Stream<List<Person>> readUsers() => FirebaseFirestore.instance
      .collection('PERSON')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Person.fromJson(doc.data())).toList());

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
