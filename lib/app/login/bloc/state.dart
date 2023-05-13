part of 'bloc.dart';

@immutable
abstract class State extends Equatable {
  const State(this.model);

  final Model model;

  @override
  List<Object?> get props => [model];
}

class InitialState extends State {
  const InitialState(Model model) : super(model);
}

class SendingState extends State {
  const SendingState(Model model) : super(model);
}

class SendedState extends State {
  const SendedState(Model model) : super(model);
}

class FailureState extends State {
  const FailureState(Model model) : super(model);
}

class Model extends Equatable {
  const Model({
    this.userCredential,
  });

  final UserCredential? userCredential;

  Model copyWith({
    UserCredential? userCredential,
  }) =>
      Model(
        userCredential: userCredential ?? this.userCredential,
      );

  @override
  List<Object?> get props => [
        userCredential,
      ];
}
