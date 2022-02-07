import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qatar_driver_app/SizeConfig.dart';
import 'package:qatar_driver_app/routes.dart';
import 'package:qatar_driver_app/screens/splash.dart';

import 'NavigationKey.dart';
import 'constant.dart';
import 'helper/provider/main_provider.dart';
import 'helper/provider/order_provider.dart';
import 'helper/shared_prefrences_helper.dart';
import 'screens/login/loginbyemail_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefrencesHelper.sharedPrefrencesHelper.initSharedPrefrences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainProvider>(
          create: (context) => MainProvider(),
        ),
        // ChangeNotifierProvider<ProfileProvider>(
        //   create: (context) => ProfileProvider(),
        // ),
        ChangeNotifierProvider<OrderProvider>(
          create: (context) => OrderProvider(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: colorCustom,
            fontFamily: 'Tajawal',
            textTheme: TextTheme(button: TextStyle(fontFamily: 'Tajawal'))),
        initialRoute: Splash.routeName,
        // home: GridViewapp(),
        routes: routes,
        navigatorKey: NavigationService.navigationService.navigatorKey,
      ),
    );
  }
}
