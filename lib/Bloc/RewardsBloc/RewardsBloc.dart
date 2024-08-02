import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uggiso/Bloc/RewardsBloc/RewardsEvent.dart';
import 'package:uggiso/Bloc/RewardsBloc/RewardsState.dart';
import 'package:uggiso/Model/WalletDetailsModel.dart';
import 'package:uggiso/Network/apiRepository.dart';

import '../../Network/NetworkError.dart';

class RewardsBloc extends Bloc<RewardsEvent, Rewardsstate> {
  RewardsBloc() : super(InitialState()) {

    final ApiRepository _apiRepository = ApiRepository();
    late WalletDetailsModel data;


    on<OnGetRewardsDetails>((event,emit) async{

      try{
        emit(LoadingState()) ;
        if(event.userId.isNotEmpty) {
          //String name,String number,String userType,String deviceId,String token
          data =  await _apiRepository.getWalletDetails(event.userId);
          if(data.statusCode==200){
            print('wallet details api response: ${data.payload}');
            emit(onLoadedState(data));
          }
          else{
            emit(ErrorState(data.message));
          }
        }
        else{
          emit(ErrorState('Enter Valid Credentials'));
        }

      } on NetworkError {
        print('this is network error');
      }
    });
  }

}