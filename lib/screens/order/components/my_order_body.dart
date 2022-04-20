import 'package:flutter/material.dart';
import 'package:qatar_driver_app/component/loading.dart';
import 'package:qatar_driver_app/component/order_item.dart';
import 'package:qatar_driver_app/helper/http_service.dart';
import 'package:qatar_driver_app/model/OrderResponse.dart';
import 'package:qatar_driver_app/screens/order/components/my_order_item.dart';

import '../../../SizeConfig.dart';

class MyOrderBody extends StatefulWidget {

  @override
  _MyOrderBodyState createState() => _MyOrderBodyState();
}

class _MyOrderBodyState extends State<MyOrderBody> {
  bool isLoading = false;
  OrderResponse? response;

  getData() async {
    response = await HttpService.apiHelper.getMyOrders();
    if(response!.status!){
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
    print("gghhhhh");
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
            itemCount: response!.data!.isEmpty ? 0 : response!.data!.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: MyOrderItem(response!.data![index]),
            ),
          ),
        ),
      ],
    )
        : Loading();
  }
}
