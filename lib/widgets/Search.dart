import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


/*

This class defines the widget used for the look and feel of the search bar.
It has a call back function attached to send over data in the form of inputted text.
This is a statefulwidget. Stateful widgets are dynamic in nature and can be rebuilt on command.

*/

/*
Initial constructor. Defines model for stateful widget.
*/
class Search extends StatefulWidget {
  TextEditingController controller;
  String filter;

  //define widget parameters
  Search({Key key,this.filter, this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchState();
}

//Constructor for actual stateful widget
class SearchState extends State<Search> {
  

  String filter;

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(top: 12),
          ),
          new TextField(
            decoration: new InputDecoration(labelText: "Search a movie!"),
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}
// © 2019 Rocket Software, Inc. or its affiliates. All Rights Reserved
