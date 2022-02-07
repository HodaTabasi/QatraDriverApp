import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:qatar_driver_app/component/customAppBar.dart';
import 'package:qatar_driver_app/component/loading.dart';
import 'package:qatar_driver_app/component/order_item.dart';
import 'package:qatar_driver_app/helper/http_service.dart';
import 'package:qatar_driver_app/model/OrderResponse.dart';
import 'package:qatar_driver_app/screens/order/components/order_body.dart';

import '../../SizeConfig.dart';

class OrderScreen extends StatefulWidget {
  static String routeName = "/order_screen";

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("الرئيسية"),
      body: ProgressHUD(child: OrderBody())
    );
  }
}
