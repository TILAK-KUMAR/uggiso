import 'package:http/http.dart' as http;
import 'dart:convert';

void sendNotification(String fcmToken, String title, String body) async {
  var serverKey = 'YOUR_FCM_SERVER_KEY';
  var fcmUrl = 'https://fcm.googleapis.com/fcm/send';

  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'key=$serverKey',
  };

  var bodyJson = {
    'to': fcmToken,
    'notification': {'title': title, 'body': body},
    'priority': 'high',
  };

  var response = await http.post(
    fcmUrl as Uri,
    headers: headers,
    body: jsonEncode(bodyJson),
  );

  print('FCM Response: ${response.body}');
}