import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/orders.dart';
import 'package:flutter_application_1/shared/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_1/db/classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerHomeScreen extends StatefulWidget {
  String id;
  CustomerHomeScreen({super.key, required this.id});

  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState(id);
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  String id;
  _CustomerHomeScreenState(this.id);
  var customerName;
  var ssn;
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
                customerName = item.name;
                ssn = item.ssn;
              }
            }
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
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
                            'Track Shipment',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: const Icon(Icons.arrow_forward_rounded),
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/shared/trackshipment');
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
                            FontAwesomeIcons.calendarDay,
                            size: 25,
                          ),
                          title: const Text(
                            'Schedule Pickup',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: const Icon(Icons.arrow_forward_rounded),
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/customer/schedulepickup');
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
                            FontAwesomeIcons.calculator,
                            size: 25,
                          ),
                          title: const Text(
                            'Calculator',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: const Icon(Icons.arrow_forward_rounded),
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/customer/calculator');
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ListTile(
                          shape: const StadiumBorder(
                              side: BorderSide(color: Colors.white, width: 3)),
                          leading: const Icon(
                            FontAwesomeIcons.addressBook,
                            size: 25,
                          ),
                          title: const Text(
                            'Contact Us',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: const Icon(Icons.arrow_forward_rounded),
                          onTap: () {
                            Navigator.pushNamed(context, '/customer/contactus');
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
                              Text('${customerName}'),
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
                      color: Colors.grey,
                      height: 10,
                    ),
                    ListTile(
                      leading: const Icon(FontAwesomeIcons.truck),
                      title: const Text("Shippments History"),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OrdersScreen(ssn: ssn)));
                      },
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 10,
                    ),
                    ListTile(
                      leading: const Icon(FontAwesomeIcons.addressBook),
                      title: const Text("Contact Us"),
                      onTap: () {
                        Navigator.pushNamed(context, '/customer/contactus');
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
