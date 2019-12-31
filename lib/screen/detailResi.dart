import 'package:cek_resimu/bloc/resi_bloc.dart';
import 'package:cek_resimu/model/resi_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/ResiCard.dart';

class DetailResi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Resi"),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: BlocBuilder<ResiBloc, Resi>(
            builder: (context, resi) => Center(
              child: (resi is UninilizedResi)
                  ? CircularProgressIndicator()
                  : ResiCard(
                      resi: resi,
                    ),
            ),
          ),
        ));
  }
}
