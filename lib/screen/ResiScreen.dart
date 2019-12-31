import 'package:cek_resimu/bloc/pilihJasaResi.dart';
import 'package:cek_resimu/bloc/resi_bloc.dart';
import 'package:cek_resimu/model/dataJasaOngkir.dart';
import 'package:cek_resimu/screen/detailResi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PilihJasaResi pilihJasaResi = BlocProvider.of<PilihJasaResi>(context);
    ResiBloc resiBloc = BlocProvider.of<ResiBloc>(context);

    TextEditingController textEditingController = TextEditingController(text: "SOCAG00183235715");

    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
                prefixIcon: Icon(FontAwesomeIcons.search),
                hintText: "Kode Resi",
                border: OutlineInputBorder()),
          ),
          SizedBox(height: 10.0),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: BlocBuilder(
                bloc: pilihJasaResi,
                builder: (context, snap) {
                  return DropdownButton(
                    underline: Container(),
                    icon: Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width - 150),
                        child: Icon(FontAwesomeIcons.arrowAltCircleDown)),
                    value: snap,
                    onChanged: (newValue) {
                      print(newValue);
                      pilihJasaResi.valueOption = newValue;
                      print(pilihJasaResi.valueOption);
                      pilihJasaResi.add(newValue);
                    },
                    items: kodeJasaResi.map((String v) {
                      return DropdownMenuItem(
                        value: v,
                        child: Text(v.toUpperCase()),
                      );
                    }).toList(),
                  );
                },
              )),
          SizedBox(height: 10.0),
          MaterialButton(
            color: Colors.amber,
            onPressed: () {
              print(pilihJasaResi.valueOption);
              List<String> newEvent = [textEditingController.text, pilihJasaResi.valueOption];
              resiBloc.add(newEvent);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailResi()
              ));
            },
            child: Text("Cek Resimu", style: TextStyle(color: Colors.white)),
          ),
          Divider(),
        ],
      ),
    );
  }
}
