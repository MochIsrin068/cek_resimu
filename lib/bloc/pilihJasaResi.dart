import 'package:bloc/bloc.dart';

class PilihJasaResi extends Bloc<String, String>{
  @override
  String get initialState => "jne";

  @override
  Stream<String> mapEventToState(String event) async*{
    yield event;
  }

}