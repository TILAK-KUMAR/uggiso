import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth ;
import '../base/common/utils/strings.dart';

class PushNotificationService {
/*  FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialize() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    FirebaseMessaging.onBackgroundMessage(backgroundHandler);

    await getToken();
  }

  Future<String?> getToken() async {
    String? token = await _fcm.getToken();
    print('Token: $token');
    return token;
  }

  Future<void> backgroundHandler(RemoteMessage message) async {
    print('Handling a background message ${message.messageId}');
  }*/

/*   static Future<String> getAccessToken() async{

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(Strings.serverKeyJson),
      Strings.pushNotificationScope
    );

    auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(Strings.serverKeyJson),
        Strings.pushNotificationScope,client
    );
    client.close();
    return credentials.accessToken.data;
  }*/

  Future<bool> getEstimatedTravelTime(double originLat, double originLng,double destLat,double destlng) async {
    final String url = 'https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=$originLat,$originLng&destinations=$destLat,$destlng&key=AIzaSyB8UoTxemF5no_Va1aJn4x8s10VsFlLQHA';

    final response = await http.get(Uri.parse(url));
    int sec = 0;

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final String duration = data['rows'][0]['elements'][0]['duration']['text'];

      print('this is the received duration ::::: ${duration}');
      sec = convertDurationToMinutes(duration);
      if(sec<=10){
        return true;
      }
      else{
        return false;
      }

    } else {
      print('failed to get duration');
      return false;
    }
  }

  int convertDurationToMinutes(String duration) {
    final hourRegExp = RegExp(r'(\d+)\s*hour');
    final minRegExp = RegExp(r'(\d+)\s*min');

    int hours = 0;
    int minutes = 0;

    final hourMatch = hourRegExp.firstMatch(duration);
    final minMatch = minRegExp.firstMatch(duration);

    if (hourMatch != null) {
      hours = int.parse(hourMatch.group(1)!);
    }

    if (minMatch != null) {
      minutes = int.parse(minMatch.group(1)!);
    }
    print('this isconverted time : ${hours * 60 + minutes}');
    return hours * 60 + minutes;
  }
}