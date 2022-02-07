import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qatar_driver_app/screens/side_menu/side_menu_screen.dart';

import '../NavigationKey.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;

  CustomAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.menu),
          onPressed: () =>
              Get.to(()=>SideMenuScreen(), transition: Transition.leftToRight,duration: Duration(milliseconds: 900))
          // NavigationService.navigationService
          //     .navigateTo(SideMenuScreen.routeName)
          ),
      title: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [
        Navigator.canPop(context)
            ? IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () =>
                    NavigationService.navigationService.navigatePop(),
              )
            : IconButton(
                color: Colors.white,
                icon: Icon(Icons.search),
                onPressed: () =>
                    NavigationService.navigationService.navigatePop(),
              )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}
