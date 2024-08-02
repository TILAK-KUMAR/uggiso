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

  Future<void> getEstimatedTravelTime(double originLat, double originLng) async {
    final double destinationLatitude = 12.934730;  // Replace with your destination latitude
    final double destinationLongitude = 77.690483;
    final String url = '';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final String duration = data['rows'][0]['elements'][0]['duration']['text'];
      print('this is the received duration ::::: $duration');

    } else {
      print('failed to get duration');
    }
  }
}