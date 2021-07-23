import 'dart:convert';
import 'dart:io';

import 'package:eczaneistanbul/models/ibb/parks.dart';
import 'package:eczaneistanbul/models/pharmacy.dart';
// import 'package:flutter/foundation.dart';
// import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

Future<List> getPharmacies(
  bool isReverse,
) async {
  var values = [];
  final response = await http
      .get(Uri.parse('https://openapi.izmir.bel.tr/api/ibb/eczaneler'));
  if (response.statusCode == HttpStatus.ok) {
    final pharmacy = jsonDecode(response.body);
    for (var i = 0; i < pharmacy.length; i++) {
      values.add(Pharmacy(
        pharmacy.elementAt(i)['Tarih'],
        pharmacy.elementAt(i)['LokasyonY'],
        pharmacy.elementAt(i)['LokasyonX'],
        pharmacy.elementAt(i)['Adi'],
        pharmacy.elementAt(i)['Telefon'],
        pharmacy.elementAt(i)['Adres'],
        int.parse(pharmacy.elementAt(i)['BolgeId'].toString()),
        pharmacy.elementAt(i)['Bolge'],
        int.parse(pharmacy.elementAt(i)['EczaneId'].toString()),
        int.parse(pharmacy.elementAt(i)['IlceId'].toString()),
      ));
    }
    await Future.delayed(Duration(seconds: 1));
  }
  if (isReverse) {
    values = values.reversed.toList();
    // eqListSearch = eqListSearch.reversed.toList();
  }
  return values;
}

Future<List> getParksIBB() async {
  var values = [];
  final response = await http.get(Uri.parse(
      'https://data.ibb.gov.tr/api/3/action/datastore_search?resource_id=d588f256-2982-43d2-b372-c38978d7200b'));
  if (response.statusCode == HttpStatus.ok) {
    final parkIbb = jsonDecode(response.body)['result']['records'];
    for (var i = 0; i < parkIbb.length; i++) {
      values.add(ParksIBB(
        double.parse(parkIbb.elementAt(i)['LATITUDE'].toString()),
        double.parse(parkIbb.elementAt(i)['LONGITUDE'].toString()),
        parkIbb.elementAt(i)['NAME'],
        parkIbb.elementAt(i)['NEIGHBORHOOD_NAME'],
        parkIbb.elementAt(i)['COUNTY_NAME'],
        int.parse(parkIbb.elementAt(i)['_id'].toString()),
      ));
    }
    await Future.delayed(Duration(seconds: 1));
  }
  return values;
}

Future<List> getWifiIBB() async {
  var values = [];
  final response = await http.get(Uri.parse(
      'https://data.ibb.gov.tr/dataset/ibb-wi-fi-lokasyon/resource/5d0a0b1e-9e56-4038-b966-7d3e7b46f882'));
  if (response.statusCode == HttpStatus.ok) {
    final parkIbb = jsonDecode(response.body)['result']['records'];
    for (var i = 0; i < parkIbb.length; i++) {
      values.add(ParksIBB(
        double.parse(parkIbb.elementAt(i)['LATITUDE'].toString()),
        double.parse(parkIbb.elementAt(i)['LONGITUDE'].toString()),
        parkIbb.elementAt(i)['NAME'],
        parkIbb.elementAt(i)['NEIGHBORHOOD_NAME'],
        parkIbb.elementAt(i)['COUNTY_NAME'],
        int.parse(parkIbb.elementAt(i)['_id'].toString()),
      ));
    }
    await Future.delayed(Duration(seconds: 1));
  }
  return values;
}

Future<List> getWasteIBB() async {
  var values = [];
  final response = await http.get(Uri.parse(
      'https://data.ibb.gov.tr/api/3/action/datastore_search?resource_id=0124b01f-cfe7-4af8-ac80-88cb44ab5d64'));
  if (response.statusCode == HttpStatus.ok) {
    final parkIbb = jsonDecode(response.body)['result']['records'];
    for (var i = 0; i < parkIbb.length; i++) {
      values.add(ParksIBB(
        double.parse(parkIbb.elementAt(i)['LATITUDE'].toString()),
        double.parse(parkIbb.elementAt(i)['LONGITUDE'].toString()),
        parkIbb.elementAt(i)['NAME'],
        parkIbb.elementAt(i)['NEIGHBORHOOD_NAME'],
        parkIbb.elementAt(i)['COUNTY_NAME'],
        int.parse(parkIbb.elementAt(i)['_id'].toString()),
      ));
    }
    await Future.delayed(Duration(seconds: 1));
  }
  return values;
}
