import 'package:equatable/equatable.dart';
import 'package:uggiso/Model/otpModel.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

class InitialState extends SignUpState {}

class LoadingState extends SignUpState {}

class onLoadedState extends SignUpState {}

class ErrorState extends SignUpState {}