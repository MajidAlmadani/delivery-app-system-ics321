import 'package:flutter/material.dart';

class ModifyPackageInfoScreen extends StatefulWidget {
  const ModifyPackageInfoScreen({super.key});

  @override
  State<ModifyPackageInfoScreen> createState() =>
      _ModifyPackageInfoScreenState();
}

class _ModifyPackageInfoScreenState extends State<ModifyPackageInfoScreen> {
  TextEditingController _orderController = TextEditingController();

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
                              "Order Number ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                      controller: _orderController,
                                      keyboardType: TextInputType.number),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        splashColor: Colors.green,
                        child: Card(
                          child: Container(
                            child: Center(child: Text('Add Order')),
                            padding: EdgeInsets.fromLTRB(22, 20, 20, 20),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/customer/schedulepickup');
                        },
                      ),
                      VerticalDivider(
                        thickness: 2,
                        width: 2,
                        color: Colors.white,
                      ),
                      InkWell(
                        splashColor: Colors.green,
                        child: Card(
                          child: Container(
                            child: Center(child: Text('Edit Order')),
                            padding: EdgeInsets.fromLTRB(22, 20, 20, 20),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/customer/schedulepickup');
                        },
                      ),
                      VerticalDivider(
                        thickness: 2,
                        width: 2,
                        color: Colors.white,
                      ),
                      InkWell(
                        splashColor: Colors.green,
                        child: Card(
                          child: Container(
                            child: Center(child: Text('Delete Order')),
                            padding: EdgeInsets.fromLTRB(22, 20, 20, 20),
                          ),
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text("Are you sure?"),
                                    actions: [
                                      TextButton(
                                        child: Text("Delete"),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                      TextButton(
                                        child: Text("Cancel"),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ));
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
