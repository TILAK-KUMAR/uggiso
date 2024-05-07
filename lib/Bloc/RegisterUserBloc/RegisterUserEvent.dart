import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterUserEvent extends Equatable {
  const RegisterUserEvent();
}

class OnRegisterButtonClicked extends RegisterUserEvent {
  final String name;
  final String number;
  final String deviceId;
  final String token;

  const OnRegisterButtonClicked({required this.name,required this.number,required this.deviceId,required this.token});

  @override
  List<Object> get props => [name];

  @override
  String toString() => 'OnButtonClicked { number: $name }';
}
