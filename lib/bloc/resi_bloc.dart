import 'package:bloc/bloc.dart';
import 'package:cek_resimu/model/resi_model.dart';

class ResiBloc extends Bloc<List,Resi> {
  @override
  Resi get initialState => UninilizedResi();

  @override
  Stream<Resi> mapEventToState(List event) async* {
    try {
      Resi resi = await Resi.getUserFromApi(event[0], event[1]);
      yield resi;
    } catch (e) {}
  }
}
