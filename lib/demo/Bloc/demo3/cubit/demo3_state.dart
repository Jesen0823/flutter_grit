part of 'name_cubit3.dart';

/// 维护四种状态： 初始/加载/正确/错误
abstract class Demo3State {
  const Demo3State();
}

class Demo3StateInitial extends Demo3State {
  const Demo3StateInitial();
}

class Demo3StateLoading extends Demo3State {
  const Demo3StateLoading();
}

class Demo3StateLoaded extends Demo3State {
  final String msg;
  const Demo3StateLoaded(this.msg);
}

class Demo3StateError extends Demo3State {
  const Demo3StateError();
}
