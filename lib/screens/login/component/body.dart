import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qatar_driver_app/component/btn_layout.dart';
import 'package:qatar_driver_app/component/email_input.dart';
import 'package:qatar_driver_app/component/loading.dart';
import 'package:qatar_driver_app/component/password_input.dart';
import 'package:qatar_driver_app/helper/http_service.dart';
import 'package:qatar_driver_app/helper/provider/main_provider.dart';
import 'package:qatar_driver_app/helper/shared_prefrences_helper.dart';
import 'package:qatar_driver_app/model/LoginResponse.dart';
import 'package:qatar_driver_app/screens/order/order_screen.dart';

import '../../../NavigationKey.dart';
import '../../../SizeConfig.dart';


class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;


  onPress() async {
    FocusScope.of(context).requestFocus(FocusNode());
    String userName =
        Provider
            .of<MainProvider>(context, listen: false)
            .emailController
            .text;
    String password = Provider
        .of<MainProvider>(context, listen: false)
        .passwordController
        .text;

    // final progress = ProgressHUD.of(context);
    // progress.show();

    setState(() {
      isLoading = true;
    });
    LoginResponse? response =
    await HttpService.apiHelper.login(userName, password);


    if (response!.status!) {
      SharedPrefrencesHelper.sharedPrefrencesHelper.setIsLogin(true);
      SharedPrefrencesHelper.sharedPrefrencesHelper
          .setToken(response.data!.token!.accessToken!);

      setState(() {
        isLoading = false;
      });

      Get.offAll(() => OrderScreen(),transition: Transition.rightToLeft,
          curve: Curves.easeInOutCubic,
          duration: Duration(milliseconds: 550));
      // progress.dismiss();
      // NavigationService.navigationService.navigateTo(OrderScreen.routeName);
    } else {
      // progress.dismiss();
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(
          msg: response.message!.first,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: Provider
              .of<MainProvider>(context)
              .formKey,
          child: Scaffold(
              backgroundColor: const Color(0xFFF5F5F7),
              body: Container(
                margin: EdgeInsets.all(16),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/logo.png",
                          width: 127,
                          height: 70,
                        ),
                        SizedBox(height: (SizeConfig.screenHeight) * 0.08),
                        EmailInput(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        PassInput(),
                        SizedBox(height: getProportionateScreenHeight(50)),
                        BtnLayout("تسجيل دخول", () => onPress()),
                      ],
                    ),
                  ),
                ),
              )),
        ),
        isLoading
            ? Loading()
            : Center()
      ],
    );
  }
}
