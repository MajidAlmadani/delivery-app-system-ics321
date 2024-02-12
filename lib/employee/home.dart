import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/db/classes.dart';

import '../shared/profile.dart';

class EmployeeHomeScreen extends StatefulWidget {
  String id;
  EmployeeHomeScreen({super.key, required this.id});

  @override
  State<EmployeeHomeScreen> createState() => _EmployeeHomeScreenState(id);
}

class _EmployeeHomeScreenState extends State<EmployeeHomeScreen> {
  String id;
  _EmployeeHomeScreenState(this.id);

  var employeeName, ssn;
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
              if (item.id == id) {
                employeeName = item.name;
                ssn = item.ssn;
              }
            }
            return Scaffold(
              appBar: AppBar(title: const Text("Carrier System")),
              body: Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 120,
                        ),
                        ListTile(
                          iconColor: Colors.white,
                          shape: const StadiumBorder(
                              side: BorderSide(color: Colors.white, width: 3)),
                          leading: const Icon(
                            FontAwesomeIcons.box,
                            size: 25,
                          ),
                          title: const Text(
                            'Modify Package Information',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: const Icon(Icons.arrow_forward_rounded),
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/employee/modifypackageinfo');
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ListTile(
                          iconColor: Colors.white,
                          shape: const StadiumBorder(
                              side: BorderSide(color: Colors.white, width: 3)),
                          leading: const Icon(
                            FontAwesomeIcons.user,
                            size: 25,
                          ),
                          title: const Text(
                            'Modify User Information',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: const Icon(Icons.arrow_forward_rounded),
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/employee/modifyaccountinfo');
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ListTile(
                          iconColor: Colors.white,
                          shape: const StadiumBorder(
                              side: BorderSide(color: Colors.white, width: 3)),
                          leading: const Icon(
                            FontAwesomeIcons.truck,
                            size: 25,
                          ),
                          title: const Text(
                            'Track Shipment',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: const Icon(Icons.arrow_forward_rounded),
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/shared/trackshipment');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Container(
                          color: Colors.green,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 52,
                                backgroundImage: NetworkImage(
                                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text("${employeeName}"),
                            ],
                          )),
                    ),
                    const Divider(
                      height: 10,
                    ),
                    ListTile(
                      leading: const Icon(FontAwesomeIcons.addressCard),
                      title: const Text("User Information"),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CustomerProfileScreen(id: id)));
                      },
                    ),
                    const Divider(
                      height: 10,
                    ),
                    ListTile(
                      leading: const Icon(FontAwesomeIcons.file),
                      title: const Text("Generate Report"),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("Sent to your email"),
                                  actions: [
                                    TextButton(
                                      child: Text("Close"),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ],
                                ));
                      },
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 10,
                    ),
                    ListTile(
                      leading: const Icon(FontAwesomeIcons.bell),
                      title: const Text("Email Notification Sending"),
                      onTap: () {
                        Navigator.pushNamed(
                            context, '/employee/emailnotification');
                      },
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 10,
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text("Log out"),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
                    ),
                  ],
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
}
