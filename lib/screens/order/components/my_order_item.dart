import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qatar_driver_app/helper/http_service.dart';
import 'package:qatar_driver_app/helper/provider/order_provider.dart';
import 'package:qatar_driver_app/model/MainResponse.dart';
import 'package:qatar_driver_app/model/Order.dart';
import 'package:qatar_driver_app/screens/details/order_details.dart';


class MyOrderItem extends StatelessWidget {
  Order order;

  MyOrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.4,
      child: GestureDetector(
        onTap: () {
          Provider.of<OrderProvider>(context, listen: false).orderId = order.id;
          Get.to(() => DetailsScreen(), transition: Transition.rightToLeft,
              curve: Curves.easeInOutCubic,
              duration: Duration(milliseconds: 550));
          // NavigationService.navigationService
          //     .navigateToReplacement(DetailsScreen.routeName);
        },
        child: Card(
          color: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "${order.mosqueName}",
                  style: TextStyle(
                      color: Color(0xff0D2784),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        '${order.countCartoons}',
                        style: TextStyle(
                            color: Color(0xff0D2784),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${(int.parse(order.countCartoons) * 20)}',
                        style: TextStyle(
                            color: Color(0xff0D2784),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "عدد الكراتين",
                        style: TextStyle(
                            color: Color(0xff0D2784),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "عدد الزجاج",
                        style: TextStyle(
                            color: Color(0xff0D2784),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${order.status}',
                        style: TextStyle(
                            color: Color(0xff00DAFD),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                  Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/product.png",
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
