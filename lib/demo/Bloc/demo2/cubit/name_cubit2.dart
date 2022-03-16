import 'package:flutter_bloc/flutter_bloc.dart';

part 'name_state2.dart';

class NameCubit2 extends Cubit<NameInitial2> {
  NameCubit2() :super(NameInitial2(stateOfName: "~|~"));

  void updateName(String name) =>
      emit(NameInitial2(stateOfName: getStart(name)));
  

  // 业务代码，判断名字开头
  String getStart(String name){
    if(name.isEmpty) return '#';
    return name.substring(0, 1).toUpperCase();
  }
}