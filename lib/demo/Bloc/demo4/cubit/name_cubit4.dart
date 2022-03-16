import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'demo4_state.dart';

class NameCubit4 extends Cubit<Demo4State> {
  NameCubit4() : super(const Name4StateInitial());

  Future<void> updateName(String data) async {
    if (data.isEmpty) {
      emit(const Name4StateError());
    } else {
      emit(const Name4StateLoading());
      await Future.delayed(const Duration(seconds: 3), () {
        emit(Name4StateLoaded(stateOfName: getString(data)));
      });
    }
  }

  String getString(String name) {
    return name.substring(0, 1).toUpperCase();
  }
}
