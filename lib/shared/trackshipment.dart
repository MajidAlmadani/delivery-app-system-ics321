import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TrackShipmentScreen extends StatefulWidget {
  const TrackShipmentScreen({super.key});

  @override
  State<TrackShipmentScreen> createState() => _TrackShipmentScreenState();
}

class _TrackShipmentScreenState extends State<TrackShipmentScreen> {
  TextEditingController _orderController = TextEditingController();
  String receiveDate = '', startDate = '';
  String location = '';
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<History>>(
        stream: readHistory(),
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
                                child: Center(child: Text('Search')),
                                padding: EdgeInsets.fromLTRB(40, 20, 30, 20),
                              ),
                            ),
                            onTap: () {
                              for (var item in user) {
                                if (item.pnum == _orderController.text) {
                                  location = item.location;
                                  startDate =
                                      "${item.Sdate.toDate().year} - ${item.Sdate.toDate().month} - ${item.Sdate.toDate().day}";
                                  receiveDate =
                                      "${item.Rdate.toDate().year} - ${item.Rdate.toDate().month} - ${item.Rdate.toDate().day}";
                                  flag = false;
                                  break;
                                } else {
                                  flag = true;
                                }
                              }
                              setState(() {
                                location = location;
                                startDate = startDate;
                                receiveDate = receiveDate;
                              });
                              if (flag) {
                                const snackBar = SnackBar(
                                    content: Text(
                                        'There is no Order with this number !!'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                          ),
                          Card(
                            child: ClipPath(
                              clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3))),
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 20, 40, 20),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                        color: Colors.greenAccent, width: 5),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Send Date: ${startDate}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Receive Date: ${receiveDate}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Location: ${location}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
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

  Stream<List<History>> readHistory() => FirebaseFirestore.instance
      .collection('History')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => History.fromJson(doc.data())).toList());
}
