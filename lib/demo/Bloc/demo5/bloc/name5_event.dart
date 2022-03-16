part of 'name5_bloc.dart';

@immutable
abstract class Name5Event {}

class GetStateEvent extends Name5Event {
  final String name;

  GetStateEvent({required this.name});
}
