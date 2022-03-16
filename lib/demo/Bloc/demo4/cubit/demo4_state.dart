part of 'name_cubit4.dart';

/// 维护四种状态： 初始/加载/正确/错误
@immutable
abstract class Demo4State {
  const Demo4State();
}

class Name4StateInitial extends Demo4State {
  const Name4StateInitial();
}

class Name4StateLoading extends Demo4State {
  const Name4StateLoading();
}

class Name4StateLoaded extends Demo4State {
  final String stateOfName;
  const Name4StateLoaded( {required this.stateOfName});
}

class Name4StateError extends Demo4State {
  const Name4StateError();
}
