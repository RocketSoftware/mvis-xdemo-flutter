/*
This file handles all calls to MVIS. Flutter has the ability to make asynchronous 
calls what are known as futures. Future are also a type of widget.
*/

import 'dart:convert';
import '../config.dart' as config;


import 'package:http/http.dart' as http;
import 'package:xdemo_mobile_example/widgets/Collection.dart';

/*
This function is responsible for completing the default call to MVIS. MVIS
returns unfiltered data. That JSON package is then passed to the Collection class
constructor which creates a Collection object which is a collection of Movie objects
*/
Future<Collection> fetchCollection() async {
  String username = 'admin';
  String password = 'admin';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  final response = await http.get(
      config.endPointURI + config.port.toString() + '/XDEMO/Products?max=100',
      headers: {'authorization': basicAuth});
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    print(response.statusCode);
    print(response.body);
    return Collection.fromJSON(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}


/*
This function is responsible for completing the filtered calls to MVIS. MVIS
returns unfiltered data. That JSON package is then passed to the Collection class
constructor which creates a Collection object which is a collection of Movie objects
*/
Future<Collection> fetchFilteredCollection(String query) async {
  String username = 'admin';
  String password = 'admin';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password')); 
  final response = await http.get(
      config.endPointURI + config.port.toString() + '/XDEMO/Products?select=' + query,
      headers: {'authorization': basicAuth});
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Collection.fromJSON(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}// © 2019 Rocket Software, Inc. or its affiliates. All Rights Reserved
