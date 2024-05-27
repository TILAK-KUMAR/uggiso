import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class VerifyOtpEvent extends Equatable {
  const VerifyOtpEvent();
}

class OnButtonClicked extends VerifyOtpEvent {
  final String? number;
  final String otp;

  const OnButtonClicked({required this.number,required this.otp});

  @override
  List<Object> get props => [number!!,otp];

  @override
  String toString() => 'OnButtonClicked { number: $number , otp: $otp}';
}

class OnResendOtpButtonClicked extends VerifyOtpEvent {
  final String number;

  const OnResendOtpButtonClicked({required this.number});

  @override
  List<Object> get props => [number];

  @override
  String toString() => 'OnButtonClicked { number: $number }';
}