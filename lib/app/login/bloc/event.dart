part of 'bloc.dart';

abstract class Event extends Equatable {
  @override
  List<Object> get props => [];
}

class SendEvent extends Event {
  SendEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
