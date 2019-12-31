import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class OngkirScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height,
      child: Timeline(
        position: TimelinePosition.Center,
        children: <TimelineModel>[
          TimelineModel(
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                color: Colors.amber,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Data Text 1"),
                    Text("Data Text 2"),
                    Text("Data Text 3"),
                  ],
                ),
              ),
              position: TimelineItemPosition.left,
              iconBackground: Colors.redAccent,
              icon: Icon(Icons.blur_circular)),
          TimelineModel(
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                color: Colors.amber,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Data Text 1"),
                    Text("Data Text 2"),
                    Text("Data Text 3"),
                  ],
                ),
              ),
              position: TimelineItemPosition.right,
              iconBackground: Colors.redAccent,
              icon: Icon(Icons.blur_circular)),
        ],
      ),
    );
  }
}
