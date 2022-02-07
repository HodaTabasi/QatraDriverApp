import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qatar_driver_app/helper/http_service.dart';
import 'package:qatar_driver_app/helper/provider/main_provider.dart';
import 'package:qatar_driver_app/model/MainResponse.dart';
import 'package:qatar_driver_app/model/Order.dart';

class OrderItem extends StatelessWidget {
  Order order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.4,
      child: GestureDetector(
        onTap: () {
          Get.snackbar(
            "",
            "اقبل المشروع حتى تتمكن من رؤية التفاصيل",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: const Duration(seconds: 2),
            borderRadius: 20,
            margin: const EdgeInsets.all(15),
            isDismissible: true,
            dismissDirection: SnackDismissDirection.HORIZONTAL,
            forwardAnimationCurve: Curves.easeOutBack,
          );

          // Provider.of<OrderProvider>(context, listen: false).orderId = order.id;
          // Get.to(() => DetailsScreen(), transition: Transition.leftToRight);
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
                padding:const EdgeInsets.all(8.0),
                child: Text(
                  order.mosqueName,
                  style: const TextStyle(
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
                        style: const TextStyle(
                            color: Color(0xff0D2784),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${(int.parse(order.countCartoons) * 20)}',
                        style: const TextStyle(
                            color: Color(0xff0D2784),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(const Color(0xff28449C)),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(fontSize: 12, color: Colors.white))),
                        onPressed: () async {
                          // final progress = ProgressHUD.of(context);
                          Provider.of<MainProvider>(context, listen: false).changeLoading(true);
                          // progress.show();
                          MainResponse response = await HttpService.apiHelper
                              .driverDeceivedOrder(order.id);
                          if (response.status) {
                            // progress.dismiss();
                            Provider.of<MainProvider>(context, listen: false).changeLoading(false);
                            Get.snackbar(
                              "",
                              "تم قبول الطلب بنجاح",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                              duration: const Duration(seconds: 2),
                              isDismissible: true,
                              dismissDirection: SnackDismissDirection.HORIZONTAL,
                              forwardAnimationCurve: Curves.easeOutBack,
                              borderRadius: 20,
                              margin: const EdgeInsets.all(15),
                            );
                          } else {
                            // progress.dismiss();
                            Provider.of<MainProvider>(context, listen: false).changeLoading(false);
                            Get.snackbar(
                              "",
                              response.message.first,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              duration: const Duration(seconds: 2),
                              borderRadius: 20,
                              margin: const EdgeInsets.all(15),
                              isDismissible: true,
                              dismissDirection: SnackDismissDirection.HORIZONTAL,
                              forwardAnimationCurve: Curves.easeOutBack,
                            );
                          }
                        },
                        child: const Text(
                          "قبول الطلب",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        "عدد الكراتين",
                        style: TextStyle(
                            color: Color(0xff0D2784),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "عدد الزجاج",
                        style: TextStyle(
                            color: Color(0xff0D2784),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        order.status,
                        style: const TextStyle(
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
