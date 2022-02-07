import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qatar_driver_app/helper/shared_prefrences_helper.dart';
import 'package:qatar_driver_app/screens/login/loginbyemail_screen.dart';
import 'package:qatar_driver_app/screens/order/my_orders.dart';
import 'package:qatar_driver_app/screens/order/order_screen.dart';

import '../../NavigationKey.dart';
import '../extea.dart';

class SideMenuScreen extends StatefulWidget {
  static String routeName = "/side_menu";

  @override
  _SideMenuScreenState createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double v = size.height / 5;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/menu.png'),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 45),
                  child: Row(
                    children: [
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.menu),
                        onPressed: () =>
                            NavigationService.navigationService.navigatePop(),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      ListTile(
                        title: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "الصفحة الرئيسية",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailing: Image.asset("assets/menu_home.png"),
                        onTap: () {
                          Get.offAll(() => OrderScreen(),
                              transition: Transition.leftToRight);
                          // NavigationService.navigationService
                          //     .navigateTo(OrderScreen.routeName);
                        },
                      ),
                      ListTile(
                        title: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "طلباتي",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailing: Image.asset("assets/menu_home.png"),
                        onTap: () {
                          Get.offAll(() => MyOrderScreen(),
                              transition: Transition.leftToRight);
                          // NavigationService.navigationService
                          //     .navigateTo(OrderScreen.routeName);
                        },
                      ),
                      ListTile(
                        title: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "البنود والظروف",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailing: Image.asset("assets/benood.png"),
                        onTap: () {
                          SharedPrefrencesHelper.sharedPrefrencesHelper
                              .setType("services");
                          Get.to(() => Extra(),
                              transition: Transition.leftToRight);
                          // NavigationService.navigationService
                          //     .navigateTo(Extra.routeName);
                        },
                      ),
                      ListTile(
                        title: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "سياسة الخصوصية",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailing: Image.asset("assets/policy.png"),
                        onTap: () {
                          SharedPrefrencesHelper.sharedPrefrencesHelper
                              .setType("privacy");
                          Get.to(() => Extra(),
                              transition: Transition.leftToRight);
                          // NavigationService.navigationService
                          //     .navigateTo(Extra.routeName);
                        },
                      ),
                      ListTile(
                        title: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "عن قطرة",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailing: Image.asset("assets/qatra.png"),
                        onTap: () {
                          SharedPrefrencesHelper.sharedPrefrencesHelper
                              .setType("terms");
                          Get.to(() => Extra(),
                              transition: Transition.leftToRight);
                          // NavigationService.navigationService
                          //     .navigateTo(Extra.routeName);
                        },
                      ),
                      ListTile(
                        title: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "تطوير مياسم",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailing: Image.asset("assets/mayasem.png"),
                        onTap: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(25.0),
              child: ListTile(
                title: const Text(
                  "تسجيل خروج",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Image.asset("assets/logout.png"),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    CupertinoPageRoute(builder: (context) => LoginEmail()),
                    (_) => false,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
