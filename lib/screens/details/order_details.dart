import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:qatar_driver_app/component/customAppBar.dart';

import 'components/body.dart';

class DetailsScreen extends StatefulWidget {
  static String routeName = "/details_screenq";

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F7),
        appBar: CustomAppBar("تفاصيل الطلب"),
        body: ProgressHUD(child: Body()));
  }



}
