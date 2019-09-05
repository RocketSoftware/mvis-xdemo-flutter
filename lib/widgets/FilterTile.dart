import 'package:flutter/material.dart';

/*
This class defines the widget used for a filter option in the filter drop down menu. When the user selects a filter, the user
taps on a drop down menu, with a number of filter option tiles. These filter options are modeled with this widget.


This is a statefulwidget. Stateful widgets are dynamic in nature and can be rebuilt on command.
*/

/*
Initial constructor. Defines model for stateful widget.
*/
class FilterTile extends StatefulWidget {
  final UniqueKey uniKey;

  final String filter;

  final String type;

  final String qryFilter;

  final ValueChanged<String> parentAction;
  //define parameters for the widget
  const FilterTile(
      {Key key,
      this.uniKey,
      this.filter,
      this.parentAction,
      this.qryFilter,
      this.type})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FilterTileState();
  }
}

/*
Constructor for actual state based widget.
*/
class FilterTileState extends State<FilterTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(widget.filter),
        onTap: () {
          widget.parentAction(
            widget.qryFilter,
          );
        });
  }
} // © 2019 Rocket Software, Inc. or its affiliates. All Rights Reserved
