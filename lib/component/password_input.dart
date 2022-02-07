import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qatar_driver_app/helper/provider/main_provider.dart';

class PassInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: Text("كلمة المرور",style: TextStyle(
            color: Color(0xff28449C),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
            textAlign: TextAlign.right,),
        ),
        TextFormField(
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          controller: Provider.of<MainProvider>(context).passwordController,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              child: Image.asset("assets/pass.png"),
            ),
            suffixIconConstraints:
            const BoxConstraints(minWidth: 20, minHeight: 0),
            border: const UnderlineInputBorder(
            ),
            hintText: 'ادخل كلمة المرور هنا',
          ),
        ),
      ],
    );
  }
}
