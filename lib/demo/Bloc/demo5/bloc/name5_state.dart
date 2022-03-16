part of 'name5_bloc.dart';

/// 维护四种状态： 初始/加载/正确/错误

@immutable
abstract class Demo5State {
  const Demo5State();
}

class Name5StateInitial extends Demo5State {
  const Name5StateInitial();
}

class Name5StateLoading extends Demo5State {
  const Name5StateLoading();
}

class Name5StateLoaded extends Demo5State {
  final String stateOfName;
  const Name5StateLoaded( {required this.stateOfName});
}

class Name5StateError extends Demo5State {
  const Name5StateError();
}
