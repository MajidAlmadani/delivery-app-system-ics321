import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/db/classes.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:http/http.dart' as http;

class EmailNotificationScreen extends StatefulWidget {
  const EmailNotificationScreen({super.key});

  @override
  State<EmailNotificationScreen> createState() =>
      _EmailNotificationScreenState();
}

class _EmailNotificationScreenState extends State<EmailNotificationScreen> {
  TextEditingController _orderController = TextEditingController();
  late String deliveryDate;
  bool flag = false;
  String order = "fdas";

  Future sendEmail() async {
    final serviceId = 'service_99420bl';
    final templateId = 'template_8ofwjld';
    final userId = 'oOEZG13Oix6415x6q';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_subject': "Order ${_orderController.text}",
            'user_orderNumber': '${_orderController.text}',
            'user_rDate': deliveryDate,
            'user_email': 'coolfrxcrazy1@gmail.com',
          },
        }));
    return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Shipment>>(
        stream: readShipment(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Somehting went wrong ${snapshot.error}");
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            return Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 25, 10, 10),
                    child: Expanded(
                      child: Column(
                        children: <Widget>[
                          Card(
                            child: ClipPath(
                              clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3))),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
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
                                      "Order Number ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                              controller: _orderController,
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
                          InkWell(
                            splashColor: Colors.green,
                            child: Card(
                              child: Container(
                                child: Center(child: Text('Send Email')),
                                padding: EdgeInsets.fromLTRB(40, 20, 30, 20),
                              ),
                            ),
                            onTap: () {
                              for (var item in user) {
                                if (item.packageNum == _orderController.text) {
                                  deliveryDate =
                                      "${item.deliveryDate.toDate().year} - ${item.deliveryDate.toDate().month} - ${item.deliveryDate.toDate().day}";
                                  flag = true;
                                  break;
                                } else {
                                  flag = false;
                                }
                              }
                              if (flag) {
                                const snackBar = SnackBar(
                                    content:
                                        Text('The message has been sent !!'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                sendEmail();
                              } else {
                                const snackBar = SnackBar(
                                    content: Text(
                                        'There is no Order with this number !!'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                          ),
                        ],
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

  Stream<List<Shipment>> readShipment() => FirebaseFirestore.instance
      .collection('SHIPMENT')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Shipment.fromJson(doc.data())).toList());
}
