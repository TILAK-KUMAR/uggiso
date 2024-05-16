
class Strings{

  static const appName = 'Uggiso';
  static const appVersion = 'v1.0.0';
  static const ordering_made_easy = 'Ordering Made Easy!';
  static const get_ready_to_explore = 'Get Ready to explore delicious dishes from your favourite restaurants';
  static const easy_secure_payment = 'Easy & Secure Payment';
  static const payment_secure_simple = 'Make payment through our secure and simple payment method';
  static const have_fresh_food = 'Have Fresh Food';
  static const experience_the_joy = 'From farm to table, experience the joy of freshness with every bite.';
  static const skip = 'Skip';
  static const hi = 'Hi';
  static const next = 'Next';
  static const uggiso_welcomes_you = 'Uggiso Welcome’s You';
  static const enter_mobile_number = 'Please Enter Your Mobile Number';
  static const get_otp = 'Get OTP';
  static const enter_verification_code = 'Enter Verification code';
  static const enter_4_digit_code = 'You need to enter the 4-digit code we send to your mobile number';
  static const resend_code = 'Didn’t receive the code? Resend';
  static const resend = 'Resend';
  static const verify = 'verify';
  static const welcome = 'Welcome!';
  static const world_of_flavor = 'Step into a world of flavor with';
  static const enter_your_name = 'Enter your Name';
  static const submit = 'Submit';
  static const by_route = 'By Route';
  static const search_now = 'Search Now';
  static const view_all = 'View All';
  static const home = 'Home';
  static const favorite = 'Favorite';
  static const categories = 'Categories';
  static const notifications = 'Notifications';
  static const profile = 'Profile';
  static const view = 'View';
  static const hotels = 'Hotels';
  static const dishes = 'Dishes';
  static const myProfile = 'My Profile';
  static const saved_address = 'Saved Address';
  static const your_orders = 'Your Orders';
  static const orders = 'Orders';
  static const settings = 'Settings';
  static const sign_out = 'Sign out';
  static const help_center = 'Help Center';
  static const edit_profile = 'Edit Profile';
  static const terms_conditions = 'Terms And Conditions';
  static const about_us = 'About Us';
  static const notification_settings = 'Notification Settings';
  static const delete = 'Delete';
  static const terms_service = 'Terms of service';
  static const app_version = 'App version';
  static const open_source_libraries = 'Open source libraries';
  static const licences_registrations = 'Licences and Registrations';
  static const edit_profile_subtitle = 'Update your informations';
  static const about_us_subtitle = 'In case we’re missing something';
  static const notification_settings_subtitle = 'Allow Notifications';
  static const delete_subtitle = 'Delete your account';
  static const error_invalid_credientials = 'Enter a valid mobile number';
  static const top_rated_eateries_nearby = 'TOP RATED EATERIES NEARBY';
  static const all_hotels = 'ALL HOTELS';
  static const card_holder_name  = 'Card Holder Name';
  static const card_number  = 'Card Number';
  static const expiration_date  = 'Expiration Date';
  static const cvv  = 'CVV';
  static const save_my_credentials  = 'Save my Credentials';
  static const wallet  = 'Wallet';
  static const save_wallet  = 'Save Wallet';
  static const pay_by_upi_app  = 'Pay by any UPI App';
  static const preferred_payment  = 'Preferred Payment';
  static const more_payment_options  = 'More Payment Options';
  static const menu  = 'Menu';
  static const veg  = 'veg';
  static const non_veg  = 'Non-veg';
  static const bestseller  = 'Best seller';
  static const add  = 'ADD';
  static const payment_options  = 'Payment Options';
  static const credit_debit_cards  = 'Credit & Debit Cards';
  static const add_new_upi_id  = 'Add new UPI ID';
  static const cash_on_delivery  = 'Cash On Delivery';
  static const net_banking  = 'Net Banking';
  static const google_pay  = 'Google Pay';
  static const phone_pay_upi  = 'PhonePe UPI';
  static const proceed_this_payment_option  = 'Proceed with this option';
  static const you_need_to_have_upi_id  = 'You need to have a registered UPI ID';

  static const List<Map<String, dynamic>> profileItemList = [
    {'image': 'assets/ic_orders.png', 'title': your_orders},
    {'image': 'assets/ic_settings.png', 'title': settings},
    {'image': 'assets/ic_log-out.png', 'title': sign_out},
    {'image': 'assets/ic_help_center.png', 'title': help_center},
  ];

  static const List<Map<String, dynamic>> settingsItemList = [
    {'title': edit_profile,'subtitle': edit_profile_subtitle},
    { 'title': terms_conditions,'subtitle':''},
    {'title': about_us,'subtitle':about_us_subtitle},
    {'title': notification_settings,'subtitle':notification_settings_subtitle},
    {'title': delete,'subtitle':delete_subtitle},
  ];

  static const List<Map<String, dynamic>> aboutUsItemList = [
    {'title': terms_service,'subtitle':''},
    { 'title': app_version,'subtitle':appVersion},
    {'title': open_source_libraries,'subtitle':''},
    {'title': licences_registrations,'subtitle':''},
  ];
  static const List<String> hotel_distance_list = ['Street Hotel',
    'Food Truck',
    'Family Restaurant',
    'Bar and Restaurant'
  ];

  static const List<String> timing_period_list = ['Street Hotel',
    'Food Truck',
    'Family Restaurant',
    'Bar and Restaurant'
  ];
}