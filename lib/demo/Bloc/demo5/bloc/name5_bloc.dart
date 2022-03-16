import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'name5_event.dart';
part 'name5_state.dart';

class Name5Bloc extends Bloc<Name5Event, Demo5State> {
  Name5Bloc() : super(const Name5StateInitial()) {
    on<Name5Event>((event, emit) async {
      if(event is GetStateEvent){
        if (event.name.isEmpty) {
          emit(const Name5StateError());
        } else {
          emit(const Name5StateLoading());
          await Future.delayed(const Duration(seconds: 3), () {
            emit(Name5StateLoaded(stateOfName: getString(event.name)));
          });
        }
      }
    });

  }

  String getString(String name) {
    return name.substring(0, 1).toUpperCase();
  }
}
