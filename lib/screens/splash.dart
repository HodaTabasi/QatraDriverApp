import 'package:flutter/material.dart';
import 'package:qatar_driver_app/helper/shared_prefrences_helper.dart';
import 'package:qatar_driver_app/screens/login/loginbyemail_screen.dart';
import 'package:qatar_driver_app/screens/order/order_screen.dart';

import '../NavigationKey.dart';
import '../SizeConfig.dart';

class Splash extends StatefulWidget {
  static String routeName = "/splash";

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  AnimationController? animation;

  Animation<double>? _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.8).animate(animation!);

    animation!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        bool? isLoadong =
            SharedPrefrencesHelper.sharedPrefrencesHelper.getIsLogin();
        isLoadong != null
            ? isLoadong
                ? NavigationService.navigationService.navigateTo(OrderScreen.routeName)
                : NavigationService.navigationService
                    .navigateTo(LoginEmail.routeName)
            : NavigationService.navigationService
                .navigateTo(LoginEmail.routeName);
        // animation.reverse();
      }
      // else if(status == AnimationStatus.dismissed){
      //   animation.forward();
      // }
    });
    animation!.forward();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeInFadeOut!,
            child: Image.asset(
              "assets/logo1.png",
              width: 200,
              height: 200,
            ),
          ),
        ));
  }

  @override
  dispose() {
    // you need this
    animation!.dispose();
    super.dispose();
  }
}
