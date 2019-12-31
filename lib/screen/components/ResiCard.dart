import 'package:cek_resimu/model/resi_model.dart';
import 'package:cek_resimu/screen/components/TimeLineModelCard.dart';
import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class ResiCard extends StatelessWidget {
  final Resi resi;

  ResiCard({this.resi});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Card(
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(resi.status,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                    Divider(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(6.0),
                            width: 130.0,
                            color: Colors.amber,
                            height: 65.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(resi.shipperName,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                Text(resi.origin, style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward),
                          Container(
                            padding: EdgeInsets.all(6.0),
                            width: 130.0,
                            height: 65.0,
                            color: Colors.amber,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(resi.receiverName,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                Text(resi.destination, style: TextStyle(color: Colors.white)),
                                // Text(resi.receiverAddress1),
                                // Text(resi.receiverAddress2),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          resi.courierCode == "jne" ? Image.asset("assets/logo/jne.png", width: 70.0, height: 70.0,) : (resi.courierCode),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(resi.waybillNumber, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0),
          height: MediaQuery.of(context).size.height / 2,
          child: Timeline(
            position: TimelinePosition.Left,
            children: resi.manifest
                .map<TimelineModel>(
                  (manifest) => TimelineModel(
                      TimeLineModelCard(
                        cityName: manifest["city_name"],
                        manifestDate: manifest["manifest_date"],
                        manifestDescription: manifest["manifest_description"],
                        manifestTime: manifest["manifest_time"],
                      ),
                      position: TimelineItemPosition.left,
                      iconBackground: Colors.redAccent,
                      icon: Icon(Icons.blur_circular,  color: Colors.white,)),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
