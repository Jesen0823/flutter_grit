import 'package:bloc/bloc.dart';
import 'package:bloc_use_demo/repo/show_repo.dart';
import 'package:meta/meta.dart';

import '../models/data_mo_entity.dart';

part 'show_data_event.dart';
part 'show_data_state.dart';

class ShowDataBloc extends Bloc<ShowDataEvent, ShowDataState> {
  final ShowRepo repo;

  ShowDataBloc(this.repo) : super(ShowDataInitialState()) {
    on<ShowDataEvent>((event, emit) async{
      if(event is LoadShowDataEvent){
        emit(ShowDataLoadingState());
        var dataResult = await repo.requestShowData();
        if(dataResult == null){
          emit(ShowDataErrorState());
        }else{
          emit(ShowDataLoadedState(apiResult: dataResult));
        }
      }
    });
  }
}
