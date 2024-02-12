import 'package:flutter_application_1/customer/calculator.dart';
import 'package:flutter_application_1/customer/contactus.dart';
import 'package:flutter_application_1/customer/home.dart';
import 'package:flutter_application_1/customer/schedulepickup.dart';
import 'package:flutter_application_1/employee/accountinfoadd.dart';
import 'package:flutter_application_1/employee/emailnotification.dart';
import 'package:flutter_application_1/employee/generatereport.dart';
import 'package:flutter_application_1/employee/modifyaccountinfo.dart';
import 'package:flutter_application_1/employee/modifypackageinfo.dart';
import 'package:flutter_application_1/shared/trackshipment.dart';
import 'package:flutter_application_1/login/login.dart';
import 'package:flutter_application_1/login/signup.dart';
import 'package:flutter_application_1/employee/accountinfoadd.dart';

var appRoutes = {
  '/': (context) => const LoginScreen(),
  '/login/signup': (context) => SignUpScreen(),
  '/customer/contactus': (context) => const ContactUsScreen(),
  '/customer/schedulepickup': (context) => const SchedulePickupScreen(),
  '/customer/calculator': (context) => const CalculatorScreen(),
  '/shared/trackshipment': (context) => const TrackShipmentScreen(),
  '/employee/generatereport': (context) => const GenerateReportScreen(),
  '/employee/modifyaccountinfo': (context) => const ModifyAccountInfoScreen(),
  '/employee/emailnotification': (context) => const EmailNotificationScreen(),
  '/employee/modifypackageinfo': (context) => const ModifyPackageInfoScreen(),
  '/employee/accountinfoadd': (context) => AccountInfoAddScreen(),
};
