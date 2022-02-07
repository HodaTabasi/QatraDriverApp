import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../../SizeConfig.dart';
import 'component/body.dart';

class LoginEmail extends StatefulWidget {
  static String routeName = "/login_email";

  @override
  _LoginEmailState createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {


  @override
  Widget build(BuildContext context) {
    return Body();
    // return ProgressHUD(child: Body());
  }
}
