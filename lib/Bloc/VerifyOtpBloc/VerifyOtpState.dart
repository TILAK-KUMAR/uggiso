import 'package:equatable/equatable.dart';
import 'package:uggiso/Model/otpModel.dart';

import '../../Model/VerifyOtpModel.dart';

abstract class VerifyOtpState extends Equatable {
  const VerifyOtpState();

  @override
  List<Object?> get props => [];
}

class InitialState extends VerifyOtpState {}

class LoadingState extends VerifyOtpState {}

class onLoadedState extends VerifyOtpState {}

class userAlreadyRegistered extends VerifyOtpState {
  final VerifyOtpModel? data;
  const userAlreadyRegistered(this.data);
}


class onResendOTPSuccessState extends VerifyOtpState {}

class ErrorState extends VerifyOtpState {
  final String? message;
  const ErrorState(this.message);
}