import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qatar_driver_app/component/loading.dart';
import 'package:qatar_driver_app/component/order_item.dart';
import 'package:qatar_driver_app/helper/http_service.dart';
import 'package:qatar_driver_app/helper/provider/main_provider.dart';
import 'package:qatar_driver_app/model/OrderResponse.dart';

import '../../../SizeConfig.dart';

class OrderBody extends StatefulWidget {
  @override
  _OrderBodyState createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {
  bool isLoading = false;
  OrderResponse response;

  getData() async {
    response = await HttpService.apiHelper.getHome(context);
    if (response.status) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: response.data.isEmpty ? 0 : response.data.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: OrderItem(response.data[index]),
                  ),
                ),
              ),
              Provider.of<MainProvider>(context).isLoading
                  ? Loading()
                  : Center()
            ],
          )
        : Loading();
  }
}
