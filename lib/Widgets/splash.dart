import 'dart:async';
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
    getDeviceId();
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
  void getDeviceId()async{
    final prefs = await SharedPreferences.getInstance();
    deviceId = await DeviceUuid().getUUID();
    LocationInfo _location = await LocationManager.getCurrentPosition();

    prefs.setString('device_id', deviceId!);
    prefs.setDouble('user_longitude', _location.longitude);
    prefs.setDouble('user_latitude', _location.latitude);

    Timer(Duration(seconds: 3),
            () => Navigator.popAndPushNamed(context, AppRoutes.homeScreen)
    );
  }


}