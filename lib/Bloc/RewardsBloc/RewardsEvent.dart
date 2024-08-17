import 'package:equatable/equatable.dart';

abstract class RewardsEvent extends Equatable {
  const RewardsEvent();
}

class OnGetRewardsDetails extends RewardsEvent {
  final String userId;

  const OnGetRewardsDetails({required this.userId});

  @override
  List<Object> get props => [userId];

  @override
  String toString() => 'OnButtonClicked { number: $userId }';
}