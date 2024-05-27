import 'package:bloc/bloc.dart';
import 'package:uggiso/Bloc/VerifyOtpBloc/VerifyOtpEvent.dart';
import 'package:uggiso/Bloc/VerifyOtpBloc/VerifyOtpState.dart';
import 'package:uggiso/Network/NetworkError.dart';
import 'package:uggiso/Network/apiRepository.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  VerifyOtpBloc() : super(InitialState()){
    final ApiRepository _apiRepository = ApiRepository();

    on<OnButtonClicked>((event,emit) async{

      try{

        emit(LoadingState()) ;
        await _apiRepository.verifyOtp(event.number,event.otp);
        emit(onLoadedState());

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
