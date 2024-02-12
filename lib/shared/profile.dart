import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_1/db/classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerProfileScreen extends StatefulWidget {
  String id;
  CustomerProfileScreen({super.key, required this.id});

  @override
  State<CustomerProfileScreen> createState() => _CustomerProfileScreenState(id);
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
  String id;
  _CustomerProfileScreenState(this.id);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<String> info = [];
    return StreamBuilder<List<Person>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Somehting went wrong ${snapshot.error}");
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            final docUser =
                FirebaseFirestore.instance.collection('PERSON').doc(id);

            for (var item in user) {
              if (item.id == id) {
                info.add(item.name);
                info.add(item.email);
                info.add(item.phone_number);
                info.add(item.address);
              }
            }
            return Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
                      child: Expanded(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            ListTile(
                              iconColor: Colors.white,
                              shape: const StadiumBorder(
                                  side: BorderSide(
                                      color: Colors.white, width: 3)),
                              title: Center(
                                child: Column(
                                  children: [
                                    const Text(
                                      'User Information',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Name: ${info[0]}"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Email: ${info[1]}"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Phone Numbers: ${info[2]}"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Address: ${info[3]}"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ListTile(
                              iconColor: Colors.white,
                              shape: const StadiumBorder(
                                  side: BorderSide(
                                      color: Colors.white, width: 3)),
                              leading: const Icon(
                                FontAwesomeIcons.envelope,
                                size: 25,
                              ),
                              title: const Text(
                                'Change Email',
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: const Icon(Icons.arrow_forward_rounded),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text("Change Email"),
                                          content: TextField(
                                            controller: emailController,
                                            decoration: InputDecoration(
                                                hintText:
                                                    "Enter your new Email"),
                                          ),
                                          actions: [
                                            TextButton(
                                                child: Text("Submit"),
                                                onPressed: () => {
                                                      docUser.update({
                                                        'email': emailController
                                                            .text,
                                                      }),
                                                      Navigator.pop(context),
                                                    }),
                                            TextButton(
                                              child: Text("Cancel"),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ],
                                        ));
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ListTile(
                              iconColor: Colors.white,
                              shape: const StadiumBorder(
                                  side: BorderSide(
                                      color: Colors.white, width: 3)),
                              leading: const Icon(
                                FontAwesomeIcons.lock,
                                size: 25,
                              ),
                              title: const Text(
                                'Change Password',
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: const Icon(Icons.arrow_forward_rounded),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text("Change Password"),
                                          content: TextField(
                                            controller: passwordController,
                                            decoration: InputDecoration(
                                                hintText:
                                                    "Enter your new Password"),
                                          ),
                                          actions: [
                                            TextButton(
                                                child: Text("Submit"),
                                                onPressed: () => {
                                                      docUser.update({
                                                        'password':
                                                            passwordController
                                                                .text,
                                                      }),
                                                      Navigator.pop(context),
                                                    }),
                                            TextButton(
                                              child: Text("Cancel"),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ],
                                        ));
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ListTile(
                              iconColor: Colors.white,
                              shape: const StadiumBorder(
                                  side: BorderSide(
                                      color: Colors.white, width: 3)),
                              leading: const Icon(
                                FontAwesomeIcons.phone,
                                size: 25,
                              ),
                              title: const Text(
                                'Change Phone Number',
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: const Icon(Icons.arrow_forward_rounded),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text("Change Phone Number"),
                                          content: TextField(
                                            controller: phoneNumberController,
                                            decoration: InputDecoration(
                                                hintText:
                                                    "Enter your new Phone Number"),
                                          ),
                                          actions: [
                                            TextButton(
                                              child: Text("Submit"),
                                              onPressed: () => {
                                                docUser.update({
                                                  'phone_number':
                                                      phoneNumberController
                                                          .text,
                                                }),
                                                Navigator.pop(context),
                                              },
                                            ),
                                            TextButton(
                                              child: Text("Cancel"),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ],
                                        ));
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ListTile(
                              iconColor: Colors.white,
                              shape: const StadiumBorder(
                                  side: BorderSide(
                                      color: Colors.white, width: 3)),
                              leading: const Icon(
                                FontAwesomeIcons.house,
                                size: 25,
                              ),
                              title: const Text(
                                'Change Address',
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: const Icon(Icons.arrow_forward_rounded),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text("Change Address"),
                                          content: TextField(
                                            controller: addressController,
                                            decoration: InputDecoration(
                                                hintText:
                                                    "Enter your new Address"),
                                          ),
                                          actions: [
                                            TextButton(
                                                child: Text("Submit"),
                                                onPressed: () => {
                                                      docUser.update({
                                                        'address':
                                                            addressController
                                                                .text,
                                                      }),
                                                      Navigator.pop(context),
                                                    }),
                                            TextButton(
                                              child: Text("Cancel"),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ],
                                        ));
                              },
                            ),
                          ],
                        ),
                      ),
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
}
