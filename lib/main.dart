import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
          apiKey: 'AIzaSyCXfSKnMi_jvtwDIDT4AD9JxoKwJuzWkfQ',
          appId: '1:741537959124:android:ee8a4ae8c6ee76cfd2bf41',
          messagingSenderId: '9964367047',
          projectId: 'uggiso-469cc'));
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
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); // Fix the constructor syntax

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
      /* onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        // Handle the notification
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
        // Handle the notification
      },*/
    );
  }

  Future<void> myBackgroundMessageHandler(Map<String, dynamic> message) async {
    print("Handling a background message: $message");
    // Handle the notification when the app is in the background
  }
}
