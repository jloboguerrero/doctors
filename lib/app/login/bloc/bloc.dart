import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class Bloc extends bloc.Bloc<Event, State> {
  Bloc() : super(const InitialState(Model())) {
    on<SendEvent>(_onSendEvent);
  }

  void _onSendEvent(SendEvent event, Emitter<State> emit) async {
    try {
      emit(SendingState(state.model));
      // await Future.delayed(const Duration(seconds: 2));
      UserCredential? credential;
      try {
        credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
          // email: 'jlobo12@gmail.com',
          // password: '123456',
        );
        print('here is $credential');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          emit(FailureState(state.model));
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          emit(FailureState(state.model));
        }
        return;
      }
      emit(SendedState(state.model.copyWith(
        userCredential: credential,
      )));
    } catch (_) {
      emit(FailureState(state.model));
    }
  }
}
