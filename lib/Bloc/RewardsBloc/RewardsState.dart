import 'package:equatable/equatable.dart';
import 'package:uggiso/Model/WalletDetailsModel.dart';
import 'package:uggiso/Model/otpModel.dart';

abstract class Rewardsstate extends Equatable {
  const Rewardsstate();

  @override
  List<Object?> get props => [];
}

class InitialState extends Rewardsstate {}

class LoadingState extends Rewardsstate {}

class onLoadedState extends Rewardsstate {
  final WalletDetailsModel data;
  onLoadedState(this.data);
}


class ErrorState extends Rewardsstate {
  final String? message;
  const ErrorState(this.message);
}