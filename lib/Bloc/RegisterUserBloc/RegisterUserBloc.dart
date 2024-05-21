import 'package:bloc/bloc.dart';
import 'package:uggiso/Bloc/RegisterUserBloc/RegisterUserEvent.dart';
import 'package:uggiso/Bloc/RegisterUserBloc/RegisterUserState.dart';
import 'package:uggiso/Network/NetworkError.dart';
import 'package:uggiso/Network/apiRepository.dart';

import '../../Model/RegisterUserModel.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  RegisterUserBloc() : super(InitialState()){
    final ApiRepository _apiRepository = ApiRepository();
    late RegisterUserModel data;

    on<OnRegisterButtonClicked>((event,emit) async{

      try{
        emit(LoadingState()) ;
        if(event.name.isNotEmpty) {
          //String name,String number,String userType,String deviceId,String token
         data =  await _apiRepository.registerUser(event.name,event.number,
              'CUSTOMER',event.deviceId,event.token);
         if(data.payload!=null ||data.payload?.userId!=null && data.statusCode==200){
           emit(onLoadedState(data.payload!.userId!));
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
