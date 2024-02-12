import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/db/classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatefulWidget {
  String ssn;
  OrdersScreen({super.key, required this.ssn});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState(ssn);
}

class _OrdersScreenState extends State<OrdersScreen> {
  String ssn;
  _OrdersScreenState(this.ssn);

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
                    padding: const EdgeInsets.fromLTRB(40, 25, 40, 10),
                    child: Expanded(
                      child: Column(
                        children: <Widget>[
                          for (var item in user)
                            if (item.pSSN == ssn)
                              Card(
                                child: ClipPath(
                                  clipper: ShapeBorderClipper(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3))),
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 20, 40, 20),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.greenAccent,
                                            width: 5),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Order Number: ${item.packageNum}",
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
                                              "Delivery Date: ${item.deliveryDate.toDate().year} - ${item.deliveryDate.toDate().month} - ${item.deliveryDate.toDate().day}",
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

  Stream<List<Shipment>> readShipment() => FirebaseFirestore.instance
      .collection('SHIPMENT')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Shipment.fromJson(doc.data())).toList());
}
