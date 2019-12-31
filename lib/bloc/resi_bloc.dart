import 'package:bloc/bloc.dart';
import 'package:cek_resimu/model/resi_model.dart';

class ResiBloc extends Bloc<String,Resi> {
  @override
  Resi get initialState => UninilizedResi();

  @override
  Stream<Resi> mapEventToState(String event) async* {
    try {
      Resi resi = await Resi.getUserFromApi(event);
      yield resi;
    } catch (e) {}
  }
}
