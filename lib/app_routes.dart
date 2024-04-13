import 'package:flutter/material.dart';
import 'package:uggiso/Widgets/AboutUsScreen.dart';
import 'package:uggiso/Widgets/HelpCenter.dart';
import 'package:uggiso/Widgets/HomeLandingScreen.dart';
import 'package:uggiso/Widgets/RegisterUserScreen.dart';
import 'package:uggiso/Widgets/SettingsScreen.dart';
import 'package:uggiso/Widgets/VerifyOtp.dart';
import 'package:uggiso/widgets/IntroLandingScreen.dart';
import 'package:uggiso/widgets/SignUpScreen.dart';
import 'package:uggiso/widgets/splash.dart';

class AppRoutes {
  static const String initialRoute = '/';

  static const String introLanding = '/introLanding';

  static const String signupScreen = '/signup_screen';

  static const String verifyOtp = '/verify_otp';

  static const String homeScreen = '/home_screen';

  static const String registerUser = '/register_user';

  static const String settingsScreen = '/settings';

  static const String yourOrders = '/app_navigation_screen';

  static const String helpCenter = '/help_center';

  static const String aboutUs = '/about_us';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case introLanding:
        return MaterialPageRoute(builder: (_) => const IntroLandingScreen());
      case signupScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case verifyOtp:
        return MaterialPageRoute(builder: (_) => const VerifyOtp());
      case registerUser:
        return MaterialPageRoute(builder: (_) => const RegisterUserScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeLandingScreen());
      case settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case helpCenter:
        return MaterialPageRoute(builder: (_) => const HelpCenter());
      case aboutUs:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());
      default:
        // If there is no such named route in the switch statement, e.g. /randomRoute
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
