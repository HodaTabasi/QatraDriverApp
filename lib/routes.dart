import 'package:flutter/widgets.dart';
import 'package:qatar_driver_app/screens/details/Stepper.dart';
import 'package:qatar_driver_app/screens/details/order_details.dart';
import 'package:qatar_driver_app/screens/extea.dart';
import 'package:qatar_driver_app/screens/login/loginbyemail_screen.dart';
import 'package:qatar_driver_app/screens/order/my_orders.dart';
import 'package:qatar_driver_app/screens/order/order_screen.dart';
import 'package:qatar_driver_app/screens/side_menu/side_menu_screen.dart';
import 'package:qatar_driver_app/screens/splash.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  Splash.routeName: (context) => Splash(),
  // IntroScreen.routeName: (context) => IntroScreen(),
  // Login.routeName: (context) => Login(),
  // OtpScreen.routeName: (context) => OtpScreen(),
  LoginEmail.routeName: (context) => LoginEmail(),
  // NewUser.routeName: (context) => NewUser(),
  // ForgetPassword.routeName: (context) => ForgetPassword(),
  // ProductScreen.routeName: (context) => ProductScreen(),
  // GMap.routeName: (context) => GMap(),
  // ConfirmOrders.routeName: (context) => ConfirmOrders(),
  // ConfirmOrders1.routeName: (context) => ConfirmOrders1(),
  // SelectCard.routeName: (context) => SelectCard(),
  // Payment.routeName: (context) => Payment(),
  // ProfileScreen.routeName: (context) => ProfileScreen(),
  OrderScreen.routeName: (context) => OrderScreen(),
  MyOrderScreen.routeName: (context) => MyOrderScreen(),
  StepperPage.routeName: (context) => StepperPage(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  SideMenuScreen.routeName: (context) => SideMenuScreen(),
  Extra.routeName: (context) => Extra(),
};
