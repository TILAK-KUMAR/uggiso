import 'dart:async';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uggiso/Network/PushNotificationService.dart';
import 'package:uggiso/Network/apiRepository.dart';
import 'package:uggiso/base/common/utils/LocationManager.dart';


ApiRepository repository = ApiRepository();
Future<bool> onStart(ServiceInstance service) async{

  int count =0;
  bool? stop;
  final prefs = await SharedPreferences.getInstance();
  double? destLat = prefs.getDouble('destLat');
  double? destLng = prefs.getDouble('destLng');
  String? orderId = prefs.getString('orderId');
  Timer.periodic(Duration(seconds: 10), (timer)async {
    stop = await _getUserLocation(destLat!,destLng!);
    // getEstimatedTravelTime('','','','');
    print('this is status : $stop');
    if(stop!){
      repository.updateOrderStatus(orderId!, 'REACHING');
      timer.cancel();
    }
  });
  return Future.value(true);
}

Future<void> initializeService(double destLat,double destLng,String orderId) async {
  final service = FlutterBackgroundService();
  int count=0;
  final prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('destLat', destLat);
  await prefs.setDouble('destLng', destLng);
  await prefs.setString('orderId', orderId);

  print('this rest lat lng : $destLat and $destLng');

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


Future<bool> _getUserLocation(double destLat,double destLng)async{
  bool stopTimer = false;
  try {
    LocationInfo _location = await LocationManager.getCurrentPosition();
    stopTimer = await PushNotificationService().getEstimatedTravelTime(destLat,destLng,_location.latitude,_location.longitude);
    return stopTimer;
  } catch (e) {

    return true;
  }
}