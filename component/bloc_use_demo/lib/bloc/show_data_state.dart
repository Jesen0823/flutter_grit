part of 'show_data_bloc.dart';

@immutable
abstract class ShowDataState {}

class ShowDataInitialState extends ShowDataState {}

//////////////////////////////////
class ShowDataLoadingState extends ShowDataState{}

class ShowDataLoadedState extends ShowDataState{
  final List<DataMoShowapiResBodyContentlist> apiResult;

  ShowDataLoadedState({required this.apiResult});
}

class ShowDataErrorState extends ShowDataState{}