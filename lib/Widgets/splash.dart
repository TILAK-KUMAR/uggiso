import 'package:device_uuid/device_uuid.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uggiso/app_routes.dart';
import 'package:uggiso/base/common/utils/LocationManager.dart';
import 'package:uggiso/base/common/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? deviceId = '';

  @override
  void initState() {
    super.initState();
    checkUserLoggedStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        color: AppColors.appPrimaryColor,
        child: Image.asset('assets/uggiso_splash.png', width: 200, height: 200)
    );
  }

  void checkUserLoggedStatus(){

    getDeviceId();

  }
  void getDeviceId()async{
    final prefs = await SharedPreferences.getInstance();
    deviceId = await DeviceUuid().getUUID();
    bool? _isUserLoggedIn = false;
    print('this is device id : $deviceId');
    LocationInfo _location = await LocationManager.getCurrentPosition();

    prefs.setString('device_id', deviceId!);
    prefs.setDouble('user_longitude', _location.longitude);
    prefs.setDouble('user_latitude', _location.latitude);

    _isUserLoggedIn = prefs.getBool('is_user_logged_in');
    print('thisd is lat : ${_location.longitude} and ${_location.latitude}');
    if(_isUserLoggedIn==null || _isUserLoggedIn ==false){
      Navigator.popAndPushNamed(context, AppRoutes.homeScreen);

    }
    else{
      Navigator.popAndPushNamed(context, AppRoutes.homeScreen);

    }

  }


}