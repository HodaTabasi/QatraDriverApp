import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qatar_driver_app/helper/provider/main_provider.dart';

import '../NavigationKey.dart';


class EmailInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: Text("البريد الالكتروني",style: TextStyle(
            color: Color(0xff28449C),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
            textAlign: TextAlign.right,),
        ),
        TextFormField(
          controller: Provider.of<MainProvider>(context).emailController,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            // prefixIcon: InkWell(
            //   onTap: (){
            //     NavigationService.navigationService.navigateTo(Login.routeName);
            //   },
            //   child: const Text(
            //     "استخدم الهاتف",
            //     style: TextStyle(
            //         color: Color(0xFF00DAFD),
            //         fontWeight: FontWeight.w900,
            //         fontSize: 12),
            //   ),
            // ),
            // prefixIconConstraints:
            // const BoxConstraints(minWidth: 0, minHeight: 0),
            suffixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              child: Image.asset("assets/message.png"),
            ),
            suffixIconConstraints:
            const BoxConstraints(minWidth: 20, minHeight: 0),
            border: const UnderlineInputBorder(
            ),
            hintText: 'ادخل البريد الالكتروني',
          ),
        ),
      ],
    );
  }
}
