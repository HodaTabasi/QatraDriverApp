import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:qatar_driver_app/component/customAppBar.dart';
import 'package:qatar_driver_app/screens/order/components/my_order_body.dart';


class MyOrderScreen extends StatefulWidget {
  static String routeName = "/my_order_screen";

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("طلباتي"),
      body: ProgressHUD(child: MyOrderBody())
    );
  }
}
