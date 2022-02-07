import 'package:flutter/material.dart';

import '../NavigationKey.dart';
import 'CustomDialogBox.dart';

class BtnLayout extends StatelessWidget {
  String title;
  Function prsee;

  BtnLayout(this.title,this.prsee);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          clipBehavior: Clip.hardEdge,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff28449C)),
                padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16,color: Colors.white))),
            onPressed: prsee,
            child: Text("$title",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w700),),

          ),
        ),
      ),
    );
  }

  // (){
  // NavigationService.navigationService.navigateTo(GMap.routeName);
  // // showDialog(context: context,
  // //     builder: (BuildContext context){
  // //       return CustomDialogBox(
  // //         title: "Custom Dialog Demo",
  // //         // descriptions: "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
  // //         // text: "Yes",
  // //       );
  // //     }
  // // );
  // },


}
