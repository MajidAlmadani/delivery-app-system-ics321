import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollections {
  static final _databaseRef = FirebaseFirestore.instance;
  final CollectionReference person = _databaseRef.collection('PERSON');
  final CollectionReference shipment = _databaseRef.collection('SHIPMENT');
}

class Person {
  late final String id;
  final String name;
  final String username;
  final String password;
  final String email;
  final String gender;
  final String phone_number;
  final String address;
  final String? retail_id;
  final String ssn;
  final bool isAdmin;

  Person({
    this.id = '',
    required this.name,
    required this.username,
    required this.password,
    required this.email,
    required this.gender,
    required this.phone_number,
    required this.address,
    this.retail_id = '',
    required this.ssn,
    required this.isAdmin,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'password': password,
        'email': email,
        'gender': gender,
        'ssn': ssn,
        'phone_number': phone_number,
        'address': address,
        'retail_id': retail_id,
        'isAdmin': isAdmin,
      };

  static Person fromJson(Map<String, dynamic> json) => Person(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        password: json['password'],
        email: json['email'],
        ssn: json['ssn'],
        gender: json['gender'],
        phone_number: json['phone_number'],
        address: json['address'],
        retail_id: json['retail_id'],
        isAdmin: json['isAdmin'],
      );
}

class Shipment {
  final Timestamp deliveryDate;
  final String dimension;
  final String insuranceMoney;
  final String packageNum;
  final String pSSN;
  final String rID;
  final String value;
  final String weight;
  final String rSSN;

  Shipment({
    required this.deliveryDate,
    required this.dimension,
    required this.insuranceMoney,
    required this.packageNum,
    required this.pSSN,
    required this.rID,
    required this.value,
    required this.weight,
    required this.rSSN,
  });

  Map<String, dynamic> toJson() => {
        'deliverydate': deliveryDate,
        'Dimension': dimension,
        'Insurance money': insuranceMoney,
        'PackageNum': packageNum,
        'Pssn': pSSN,
        'RID': rID,
        'Value': value,
        'Weight': weight,
        'Rssn': rSSN,
      };

  static Shipment fromJson(Map<String, dynamic> json) => Shipment(
        deliveryDate: json['deliverydate'],
        dimension: json['Dimension'].toString(),
        insuranceMoney: json['Insurance money'].toString(),
        packageNum: json['PackageNum'],
        pSSN: json['Pssn'],
        rID: json['RID'],
        value: json['Value'].toString(),
        weight: json['Weight'].toString(),
        rSSN: json['Rssn'],
      );
}

class History {
  final Timestamp Sdate;
  final Timestamp Rdate;
  final String location;
  final String pnum;
  final String typeOfDelivery;

  History({
    required this.Sdate,
    required this.Rdate,
    required this.location,
    required this.pnum,
    required this.typeOfDelivery,
  });

  Map<String, dynamic> toJson() => {
        'Sdate': Sdate,
        'Rdate': Rdate,
        'location': location,
        'pnum': pnum,
        'typeOfDelivery': typeOfDelivery,
      };

  static History fromJson(Map<String, dynamic> json) => History(
        Sdate: json['sdate'],
        Rdate: json['Rdate'],
        location: json['Location'],
        pnum: json['Pnum'],
        typeOfDelivery: json['Type of delivery'],
      );
}

class Pickup {
  final String date;
  final String time;
  final String weight;
  final String width;
  final String dimension;
  final String toCity;
  final String fromCity;

  Pickup({
    required this.date,
    required this.time,
    required this.weight,
    required this.width,
    required this.dimension,
    required this.toCity,
    required this.fromCity,
  });

  Map<String, dynamic> toJson() => {
        'date': date,
        'time': time,
        'Weight': weight,
        'Width': width,
        'Dimension': dimension,
        'ToCity': toCity,
        'FromCity': fromCity,
      };

  static Pickup fromJson(Map<String, dynamic> json) => Pickup(
        date: json['date'],
        time: json['time'],
        weight: json['Weight'].toString(),
        width: json['Width'].toString(),
        dimension: json['Dimension'].toString(),
        toCity: json['ToCity'],
        fromCity: json['FromCity'],
      );
}
