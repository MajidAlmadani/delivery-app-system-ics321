import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/customer/home.dart';
import 'package:flutter_application_1/db/classes.dart';
import 'package:flutter_application_1/employee/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<String> iD = [];
  List<String> usernamesList = [];
  List<String> passwordsList = [];
  List<bool> isAdminList = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Person>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Somehting went wrong ${snapshot.error}");
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            for (var item in user) {
              iD.add(item.id);
              usernamesList.add(item.username);
              passwordsList.add(item.password);
              isAdminList.add(item.isAdmin);
            }
            return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Carrier System',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.green),
                          ),
                          labelText: 'User Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.green),
                          ),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () {
                            final username = nameController.text;
                            final password = passwordController.text;
                            if (usernamesList.contains(username)) {
                              var indexOfPassword =
                                  usernamesList.indexOf(username);
                              if (passwordsList[indexOfPassword] == password) {
                                if (isAdminList[indexOfPassword]) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => EmployeeHomeScreen(
                                          id: iD[indexOfPassword])));
                                } else {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CustomerHomeScreen(
                                          id: iD[indexOfPassword])));
                                }
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text("Password is Wrong"),
                                          actions: [
                                            TextButton(
                                              child: Text("Ok."),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ],
                                        ));
                              }
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text("Username is Wrong"),
                                        actions: [
                                          TextButton(
                                            child: Text("Ok."),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                        ],
                                      ));
                            }
                          },
                          child: const Text('Login'),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Does not have account?'),
                        TextButton(
                          child: const Text(
                            'Sign up',
                            style: TextStyle(fontSize: 20, color: Colors.green),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/login/signup');
                          },
                        )
                      ],
                    ),
                  ],
                ));
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
}
