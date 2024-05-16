import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/MenuListModel.dart';
import '../../Network/NetworkError.dart';
import '../../Network/apiRepository.dart';
import 'MenuListEvent.dart';
import 'MenuListState.dart';

class MenuListBloc extends Bloc<MenuListEvent, MenuListState> {
  MenuListBloc() : super(FetchListState()){
    final ApiRepository _apiRepository = ApiRepository();

    on<onInitialised>((event,emit)async{
      try{
        emit(FetchingState()) ;
        final res = await _apiRepository.getMenuList(event.id);
        if(res.statusCode == 200) {
          final List<Payload>? items = res.payload; // Extract the list from the response
          emit(FetchedListsState(items));
        } else {
          emit(ErrorState(res.message));
        }
      }on NetworkError {
        emit(ErrorState('this is network error'));
      }
    });

  }

}
