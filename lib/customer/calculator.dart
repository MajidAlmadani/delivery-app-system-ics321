import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  List<bool> _calculateSelection = [true, false];
  TextEditingController _weightController = TextEditingController();
  TextEditingController _widthController = TextEditingController();
  TextEditingController _dimensionController = TextEditingController();
  var dimension, weight, width;
  late double calculateNumber = 0, test1, test2, test3;
  @override
  Widget build(BuildContext context) {
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
                        padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                        decoration: const BoxDecoration(
                          border: Border(
                            left:
                                BorderSide(color: Colors.greenAccent, width: 5),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "From City: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
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
                        padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                        decoration: const BoxDecoration(
                          border: Border(
                            left:
                                BorderSide(color: Colors.greenAccent, width: 5),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "To City: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
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
                        padding: const EdgeInsets.fromLTRB(38, 20, 38, 40),
                        decoration: const BoxDecoration(
                          border: Border(
                            left:
                                BorderSide(color: Colors.greenAccent, width: 5),
                          ),
                        ),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              "What do you want to Calculate ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ToggleButtons(
                              isSelected: _calculateSelection,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text("Delivery Fee"),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text("Insurance Payment"),
                                ),
                              ],
                              onPressed: (int newIndex) {
                                setState(() {
                                  for (int index = 0;
                                      index < _calculateSelection.length;
                                      index++) {
                                    if (index == newIndex) {
                                      _calculateSelection[index] = true;
                                    } else {
                                      _calculateSelection[index] = false;
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
                            left:
                                BorderSide(color: Colors.greenAccent, width: 5),
                          ),
                        ),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              "Package information ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
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
                  InkWell(
                    splashColor: Colors.green,
                    child: Card(
                      child: Container(
                        child: Center(child: Text('Calculate')),
                        padding: EdgeInsets.fromLTRB(40, 20, 30, 20),
                      ),
                    ),
                    onTap: () {
                      width = double.parse(_widthController.text);
                      dimension = double.parse(_dimensionController.text);
                      weight = double.parse(_weightController.text);
                      test1 = dimension / 50;
                      test2 = weight * 1.3;
                      test3 = weight * 1.5;
                      if (test2 <= 30) {
                        if (test3 <= test1) {
                          calculateNumber = test1;
                        } else {
                          calculateNumber = test3;
                        }
                      } else {
                        if (test2 <= test1) {
                          calculateNumber = test1;
                        } else {
                          calculateNumber = test2;
                        }
                      }
                      if (_calculateSelection[1]) {
                        calculateNumber = calculateNumber * 0.05;
                      }
                      setState(() {
                        calculateNumber;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: InkWell(
                      splashColor: Colors.blue,
                      child: SizedBox(
                        width: 350,
                        height: 50,
                        child: Center(
                          child: Text(
                              'The result is ${calculateNumber.toStringAsFixed(3)} SAR'),
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
  }
}
