import 'dart:async';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_background_service_ios/flutter_background_service_ios.dart';

Future<bool> onStart(ServiceInstance service) {
  int count =0;
  Timer.periodic(Duration(seconds: 20), (timer) {
    print('This statement is printed every 30 seconds. and count ::::$count');
    if(count>4){
      timer.cancel();
    }
    else{
      count++;
    }
  });
  return Future.value(true);
}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  int count=0;

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      isForegroundMode: true,
    ),
    iosConfiguration: IosConfiguration(
      onForeground: onStart,
      onBackground: onStart,
    ),
  );
  service.startService();


}

Future<void> stopService() async {
  final service = FlutterBackgroundService();
  service.invoke("stopService");
}