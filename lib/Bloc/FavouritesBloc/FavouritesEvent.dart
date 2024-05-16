import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class FavouritesEvent extends Equatable {}

class FetchList extends FavouritesEvent {
  @override
  String toString() => 'Fetch Fav List';

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
