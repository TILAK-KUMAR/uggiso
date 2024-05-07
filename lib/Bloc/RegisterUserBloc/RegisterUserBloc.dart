import 'package:bloc/bloc.dart';
import 'package:uggiso/Bloc/RegisterUserBloc/RegisterUserEvent.dart';
import 'package:uggiso/Bloc/RegisterUserBloc/RegisterUserState.dart';
import 'package:uggiso/Network/NetworkError.dart';
import 'package:uggiso/Network/apiRepository.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  RegisterUserBloc() : super(InitialState()){
    final ApiRepository _apiRepository = ApiRepository();

    on<OnRegisterButtonClicked>((event,emit) async{

      try{
        emit(LoadingState()) ;
        if(event.name.isNotEmpty) {
          //String name,String number,String userType,String deviceId,String token
          await _apiRepository.registerUser(event.name,event.number,
              'CUSTOMER',event.deviceId,event.token);
          emit(onLoadedState());
        }
        else{
          emit(ErrorState(''));
        }

      } on NetworkError {
        print('this is network error');
      }
    });
  }

}
