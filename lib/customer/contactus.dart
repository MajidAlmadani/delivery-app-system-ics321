import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 200, 20, 0),
            child: Column(
              children: const [
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  iconColor: Colors.white,
                  shape: StadiumBorder(
                      side: BorderSide(color: Colors.white, width: 3)),
                  leading: Icon(
                    FontAwesomeIcons.phone,
                    size: 25,
                  ),
                  title: Text(
                    '+966546884747',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  iconColor: Colors.white,
                  shape: StadiumBorder(
                      side: BorderSide(color: Colors.white, width: 3)),
                  leading: Icon(
                    FontAwesomeIcons.envelope,
                    size: 25,
                  ),
                  title: Text(
                    's201912340@kfupm.edu.sa',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
