import 'package:cek_resimu/screen/InfoScreen.dart';
import 'package:cek_resimu/screen/OngkirScreen.dart';
import 'package:cek_resimu/screen/ResiScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cek Resi dan Ongkir"),
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[ResiScreen(), OngkirScreen(), InfoScreen()],
          )),
      bottomNavigationBar: Material(
        elevation: 10.0,
        child: TabBar(
          labelColor: Colors.red,
          controller: _tabController,
          tabs: <Widget>[
            Tab(icon: Icon(FontAwesomeIcons.receipt), text: "Cek Resi",),
            Tab(icon: Icon(FontAwesomeIcons.cashRegister), text: "Cek Ongkir"),
            Tab(icon: Icon(FontAwesomeIcons.info), text: "Info"),
          ],
        ),
      ),
    );
  }
}
