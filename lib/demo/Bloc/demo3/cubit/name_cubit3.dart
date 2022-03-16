import 'package:flutter_bloc/flutter_bloc.dart';

part 'demo3_state.dart';

class NameCubit3 extends Cubit<Demo3State> {
  NameCubit3() : super(const Demo3StateInitial());

  Future<void> displayData(String data) async {
    emit(const Demo3StateLoading());
    await Future.delayed(const Duration(seconds: 3), () {
      print('---isEmpty:'+data);
      data.isNotEmpty ? emit(Demo3StateLoaded(data)) : emit(Demo3StateError());
    });
  }

  Future<void> restartState() async {
    emit(const Demo3StateLoading());
    await Future.delayed(const Duration(seconds: 3), () {
      emit(Demo3StateInitial());
    });
  }
}
