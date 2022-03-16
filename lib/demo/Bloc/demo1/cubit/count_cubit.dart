import 'package:flutter_bloc/flutter_bloc.dart';

part 'count_state.dart';

class CountCubit extends Cubit<CountInitial> {
  CountCubit() :super(CountInitial(countValue: 0));

  void increment() =>
      emit(CountInitial(countValue: state.countValue + 1));

  void decrement() =>
      emit(CountInitial(countValue: state.countValue-1));
}