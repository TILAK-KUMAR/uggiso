import 'package:flutter/material.dart';
import 'package:uggiso/Widgets/AboutUsScreen.dart';
import 'package:uggiso/Widgets/AddCard.dart';
import 'package:uggiso/Widgets/HelpCenter.dart';
import 'package:uggiso/Widgets/HomeLandingScreen.dart';
import 'package:uggiso/Widgets/HomeTab.dart';
import 'package:uggiso/Widgets/MenuListScreen.dart';
import 'package:uggiso/Widgets/PaymentSuccessScreen.dart';
import 'package:uggiso/Widgets/ProfileTab.dart';
import 'package:uggiso/Widgets/RegisterUserScreen.dart';
import 'package:uggiso/Widgets/RewardsScreen.dart';
import 'package:uggiso/Widgets/SettingsScreen.dart';
import 'package:uggiso/Widgets/VerifyOtp.dart';
import 'package:uggiso/base/common/utils/CreateOrderArgs.dart';
import 'package:uggiso/widgets/IntroLandingScreen.dart';
import 'package:uggiso/widgets/SignUpScreen.dart';
import 'package:uggiso/widgets/splash.dart';

import 'Widgets/CreateOrder.dart';
import 'Widgets/OrderSuccessScreen.dart';
import 'Widgets/OrdersTab.dart';
import 'Widgets/PaymentOptionsScreen.dart';
import 'Widgets/ReferralScreen.dart';
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

  static const String paymentSuccessScreen = '/payment_success_screen';

  static const String orderSuccessScreen = '/order_success_screen';

  static const String profileScreen = '/profile_screen';

  static const String referenceScreen = '/referenceScreen';

  static const String rewards = '/rewards';

  static const String myOrders = '/myOrders';

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
        return MaterialPageRoute(builder: (_) => const HomeTab());
      case settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case helpCenter:
        return MaterialPageRoute(builder: (_) => const HelpCenter());
      case aboutUs:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());
      case myOrders:
        return MaterialPageRoute(builder: (_) => const OrdersTab());
      case menuList:
        final args = settings.arguments as MenuListArgs;
        return MaterialPageRoute(
            builder: (_) => MenuListScreen(
                  restaurantId: args.restaurantId,
                  restaurantName: args.name,
                  foodType: args.foodType,
                  ratings: args.ratings,
                  landmark: args.landmark,
                  distance: args.distance,
                  duration: args.duration,
                  payload: args.payload,
                ));
      case saveCard:
        return MaterialPageRoute(builder: (_) => const AddCard());
      case createOrder:
        final create_order_args = settings.arguments as CreateOrderArgs;
        return MaterialPageRoute(
            builder: (_) => CreateOrder(
                  orderlist: create_order_args.orderlist,
                  restaurantId: create_order_args.restaurantId,
                  restaurantName: create_order_args.restaurantName,
                ));
      case paymentOptions:
        return MaterialPageRoute(builder: (_) => const PaymentOptionsScreen());
      case paymentSuccessScreen:
        return MaterialPageRoute(builder: (_) => const PaymentSuccessScreen());

      case orderSuccessScreen:
        return MaterialPageRoute(builder: (_) => const OrderSuccessScreen());

      case rewards:
        return MaterialPageRoute(builder: (_) => const RewardsScreen());

      case profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileTab());

        case referenceScreen:
        return MaterialPageRoute(builder: (_) => const ReferralScreen());
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
