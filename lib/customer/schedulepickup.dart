import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/db/classes.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<String> list = [
  "Choose City: ",
  "Abha",
  "Ad Dammam",
  "Ad Dir`iyah",
  "Al Bahah",
  "Al Hawiyah",
  "Al Hillah",
  "Al Hufuf",
  "Al Jubayl",
  "Al Kharj",
  "Al Khubar",
  "Al Majma`ah",
  "Al Mubarraz",
  "Al Qatif",
  "Al Qunfudhah",
  "Al Qurayyat",
  "Al Quway`iyah",
  "Al Wajh",
  "Arar",
  "As Sulayyil",
  "At Ta'if",
  "Buraydah",
  "Dawmat al Jandal",
  "Dhahran",
  "Duruma",
  "Ha'il",
  "Hafr al Batin",
  "Jazan",
  "Jeddah",
  "Khamis Mushayt",
  "Layla",
  "Mecca",
  "Medina",
  "Najran",
  "Qal`at Bishah",
  "Rafha",
  "Riyadh",
  "Sakaka",
  "Tabuk",
  "Turabah",
  "Yanbu`"
];
String selectval = list[0];
String selectval1 = list[0];

class SchedulePickupScreen extends StatefulWidget {
  const SchedulePickupScreen({super.key});

  @override
  State<SchedulePickupScreen> createState() => _SchedulePickupScreenState();
}

class _SchedulePickupScreenState extends State<SchedulePickupScreen> {
  TextEditingController _weightController = TextEditingController();
  TextEditingController _widthController = TextEditingController();
  TextEditingController _dimensionController = TextEditingController();
  TextEditingController _datepickController = TextEditingController();
  TextEditingController _timepickcController = TextEditingController();

  void initStateDate() {
    _datepickController.text = ""; //set the initial value of text field
    super.initState();
  }

  void initStateTime() {
    _timepickcController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: readPickup(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Somehting went wrong ${snapshot.error}");
          } else if (snapshot.hasData) {
          } else {
            return Center(child: CircularProgressIndicator());
          }
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
                              padding:
                                  const EdgeInsets.fromLTRB(100, 20, 100, 20),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                      color: Colors.greenAccent, width: 5),
                                ),
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    "From City: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  DropdownButton(
                                    value: selectval,
                                    items: list.map((country) {
                                      return DropdownMenuItem(
                                        value: country,
                                        child: Text(country),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectval = value.toString();
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Card(
                          child: ClipPath(
                            clipper: ShapeBorderClipper(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3))),
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(100, 20, 100, 20),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                      color: Colors.greenAccent, width: 5),
                                ),
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    "To City: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  DropdownButton(
                                    value: selectval1,
                                    items: list.map((country) {
                                      return DropdownMenuItem(
                                        value: country,
                                        child: Text(country),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectval1 = value.toString();
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                                    "Package information ",
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
                                          child: new Text(
                                        "Weigth: ",
                                      )),
                                      Expanded(
                                        child: TextField(
                                            controller: _weightController,
                                            keyboardType: TextInputType.number),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      new Expanded(
                                          child: new Text(
                                        "Width: ",
                                      )),
                                      new Expanded(
                                        child: new TextField(
                                            controller: _widthController,
                                            keyboardType: TextInputType.number),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      new Expanded(
                                          child: new Text(
                                        "Dimension: ",
                                      )),
                                      new Expanded(
                                        child: new TextField(
                                            controller: _dimensionController,
                                            keyboardType: TextInputType.number),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Card(
                              child: ClipPath(
                                clipper: ShapeBorderClipper(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(3))),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                                        "Date",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 140,
                                            child: TextField(
                                              controller: _datepickController,
                                              decoration: InputDecoration(
                                                icon:
                                                    Icon(Icons.calendar_today),
                                              ),
                                              readOnly: true,
                                              onTap: () async {
                                                DateTime? pickedDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(2000),
                                                        lastDate:
                                                            DateTime(2101));
                                                if (pickedDate != null) {
                                                  print(pickedDate);
                                                  String formattedDate =
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(pickedDate);
                                                  print(formattedDate);
                                                  setState(() {
                                                    _datepickController.text =
                                                        formattedDate;
                                                  });
                                                } else {
                                                  print("Date is not selected");
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            VerticalDivider(
                              thickness: 2,
                              width: 2,
                              color: Colors.white,
                            ),
                            Card(
                              child: ClipPath(
                                clipper: ShapeBorderClipper(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(3))),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                                        "Time",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 140,
                                            child: TextField(
                                              controller: _timepickcController,
                                              decoration: InputDecoration(
                                                icon: Icon(Icons.timer),
                                              ),
                                              readOnly: true,
                                              onTap: () async {
                                                TimeOfDay? pickedTime =
                                                    await showTimePicker(
                                                  initialTime: TimeOfDay.now(),
                                                  context: context,
                                                );
                                                if (pickedTime != null) {
                                                  print(pickedTime.format(
                                                      context)); //output 10:51 PM
                                                  DateTime parsedTime =
                                                      DateFormat.jm().parse(
                                                          pickedTime
                                                              .format(context)
                                                              .toString());
                                                  //converting to DateTime so that we can further format on different pattern.
                                                  print(
                                                      parsedTime); //output 1970-01-01 22:53:00.000
                                                  String formattedTime =
                                                      DateFormat('HH:mm')
                                                          .format(parsedTime);
                                                  print(
                                                      formattedTime); //output 14:59:00
                                                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                                                  setState(() {
                                                    _timepickcController.text =
                                                        formattedTime; //set the value of text field.
                                                  });
                                                } else {
                                                  print("Time is not selected");
                                                }
                                              },
                                            ),
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
                        InkWell(
                          splashColor: Colors.green,
                          child: Card(
                            child: Container(
                              child: Center(child: Text('Schedule')),
                              padding: EdgeInsets.fromLTRB(40, 20, 30, 20),
                            ),
                          ),
                          onTap: () {
                            createPickup(
                                date: _datepickController.text,
                                time: _timepickcController.text,
                                weight: _weightController.text,
                                width: _widthController.text,
                                dimension: _dimensionController.text,
                                toCity: selectval1,
                                fromCity: selectval);
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text("Winter is Coming !! 😊"),
                                      actions: [
                                        TextButton(
                                          child: Text("Ok."),
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
          );
        });
  }

  final FirebaseCollections collections = FirebaseCollections();
  Stream<List<Pickup>> readPickup() => FirebaseFirestore.instance
      .collection('Pickup')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Pickup.fromJson(doc.data())).toList());

  Future createPickup({
    required String date,
    required String time,
    required String weight,
    required String width,
    required String dimension,
    required String toCity,
    required String fromCity,
  }) async {
    final docUser = FirebaseFirestore.instance.collection('Pickup').doc();

    final user = Pickup(
      date: date,
      time: time,
      weight: weight,
      width: width,
      dimension: dimension,
      toCity: toCity,
      fromCity: fromCity,
    );

    final json = user.toJson();

    await docUser.set(json);
  }
}
