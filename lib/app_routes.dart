import 'package:flutter/material.dart';
import 'package:uggiso/Widgets/AboutUsScreen.dart';
import 'package:uggiso/Widgets/AddCard.dart';
import 'package:uggiso/Widgets/HelpCenter.dart';
import 'package:uggiso/Widgets/HomeLandingScreen.dart';
import 'package:uggiso/Widgets/MenuListScreen.dart';
import 'package:uggiso/Widgets/PaymentSuccessScreen.dart';
import 'package:uggiso/Widgets/PlaceSearchScreen.dart';
import 'package:uggiso/Widgets/RegisterUserScreen.dart';
import 'package:uggiso/Widgets/SettingsScreen.dart';
import 'package:uggiso/Widgets/VerifyOtp.dart';
import 'package:uggiso/widgets/IntroLandingScreen.dart';
import 'package:uggiso/widgets/SignUpScreen.dart';
import 'package:uggiso/widgets/splash.dart';

import 'Widgets/CreateOrder.dart';
import 'Widgets/PaymentOptionsScreen.dart';
import 'base/common/utils/MenuListArgs.dart';

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

  static const String menuList = '/menu_list';

  static const String saveCard = '/save_card';

  static const String createOrder = '/create_order';

  static const String paymentOptions = '/payment_options';

  static const String searchScreen = '/search_screen';

  static const String paymentSuccessScreen = '/payment_success_screen';

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
      case menuList:
        final args = settings.arguments as MenuListArgs;
        return MaterialPageRoute(
            builder: (_) => MenuListScreen(
                  restaurantId: args.restaurantId,
                  restaurantName: args.name,
                  foodType: args.foodType,
                  ratings: args.ratings,
                  landmark: args.landmark,
                ));
      case saveCard:
        return MaterialPageRoute(builder: (_) => const AddCard());
      case createOrder:
        return MaterialPageRoute(builder: (_) => const CreateOrder());
      case paymentOptions:
        return MaterialPageRoute(builder: (_) => const PaymentOptionsScreen());
      case searchScreen:
        return MaterialPageRoute(builder: (_) => const PlaceSearchScreen());
      case paymentSuccessScreen:
        return MaterialPageRoute(builder: (_) => const PaymentSuccessScreen());
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
