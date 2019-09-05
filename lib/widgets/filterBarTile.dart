import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter/widgets.dart';

/*
This widget defines the structure and look and feel of a filter bar tile. When a filter is pressed, a bar on the main screen appears with all active filters.
These filters are displayed using this widget. 

This is a statefulwidget. Stateful widgets are dynamic in nature and can be rebuilt on command.
*/

/*
Initial constructor. Defines model for stateful widget.
*/
class FilterBarTile extends StatefulWidget {
  final String filter;
  final int index;

  final ValueChanged<String> parentAction;
  // FilterBarTile(String filter) {
  //   this.filter = filter;
  // }

  //Defining parameters for the widget
  const FilterBarTile({Key key, this.filter, this.parentAction, this.index})
      : super(key: key);

  //Creates instance of widge, which will be rebuilt with state chnages
  @override
  State<StatefulWidget> createState() {
    return FilterBarTileState();
  }

  Object getText() {
    return this.filter;
  }
}
/*
Constructor for actual state based widget.
*/
class FilterBarTileState extends State<FilterBarTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(6),
        //padding: EdgeInsets.all(5),
        color: Colors.lightBlue,
        width: (widget.filter.length * 10).toDouble(),
        child: Center(
          child: ListTile(
            contentPadding: EdgeInsets.all(5),
            leading: Text(
              widget.filter,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
            trailing: IconButton(
              icon: Icon(Icons.close),
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              onPressed: () {
                print("Ive been pressed");
                widget.parentAction(widget.filter);
              },
            ),
          ),
        ),
      );
  }
}
// © 2019 Rocket Software, Inc. or its affiliates. All Rights Reserved
