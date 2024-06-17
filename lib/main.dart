import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uggiso/Bloc/SignUpBloc/signup_bloc.dart';
import 'package:uggiso/Bloc/VerifyOtpBloc/VerifyOtpBloc.dart';
import 'package:uggiso/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDZwpGWvzkb9D8YHqYGaHn2QXPgW1YoLWs',
          appId: '1:180656452731:android:6dab108216f2733b189ede',
          messagingSenderId: '180656452731',
          projectId: 'uggiso-customer',
        storageBucket: 'gs://uggiso-customer.appspot.com',
      ));
  /*try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Error initializing Firebase: $e');
  }*/
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [SystemUiOverlay.bottom],
  );

  runApp(MultiBlocProvider(providers: [
    BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(),
    ),
    BlocProvider<VerifyOtpBloc>(
      create: (context) => VerifyOtpBloc(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final NotificationService _notificationService = NotificationService();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance; // Fix the constructor syntax

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    _firebaseMessaging.getToken().then((token) {
      print('Token: $token');
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('onMessage: ${message.messageId}');
      // Handle the notification when the app is in the foreground
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('onMessageOpenedApp: $message');
      // Handle the notification when the app is in the background and opened
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // onBackgroundMessage: myBackgroundMessageHandler, // Add this line

      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: const CupertinoPageTransitionsBuilder(),
            // For Android
            TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
            // For iOS
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print('Handling a background message: ${message.messageId}');
    // Handle the notification when the app is in the background or terminated
  }
}
