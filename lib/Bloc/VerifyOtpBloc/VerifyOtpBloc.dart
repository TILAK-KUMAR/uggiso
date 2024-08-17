import 'package:bloc/bloc.dart';
import 'package:uggiso/Bloc/VerifyOtpBloc/VerifyOtpEvent.dart';
import 'package:uggiso/Bloc/VerifyOtpBloc/VerifyOtpState.dart';
import 'package:uggiso/Network/NetworkError.dart';
import 'package:uggiso/Network/apiRepository.dart';

import '../../Model/VerifyOtpModel.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  VerifyOtpBloc() : super(InitialState()){
    final ApiRepository _apiRepository = ApiRepository();
    late VerifyOtpModel data;

    on<OnButtonClicked>((event,emit) async{

      try{

        emit(LoadingState()) ;
        data = await _apiRepository.verifyOtp(event.number,event.otp);
        if(data.payload==null && data.statusCode==200){
          emit(onLoadedState());
        }
        else if(data.payload!=null && data.statusCode==200){
          emit(userAlreadyRegistered(data));
        }
        else{
          emit(ErrorState(data.message));
        }


      } on NetworkError {
        print('this is network error');
      }
    });


    on<OnResendOtpButtonClicked>((event,emit) async{

      try{
        emit(LoadingState()) ;
        if(event.number.isNotEmpty && event.number.length == 10) {
          await _apiRepository.getOtp(event.number);
          emit(onResendOTPSuccessState());
        }
        else{
          print('this is error');
          emit(ErrorState('unable to resend'));
        }

      } on NetworkError {
        print('this is network error');
      }
    });
  }
}
