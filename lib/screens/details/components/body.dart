import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qatar_driver_app/component/btn_layout.dart';
import 'package:qatar_driver_app/component/loading.dart';
import 'package:qatar_driver_app/helper/http_service.dart';
import 'package:qatar_driver_app/helper/provider/order_provider.dart';
import 'package:qatar_driver_app/model/MainResponse.dart';
import 'package:qatar_driver_app/model/OrderDetailsResponse.dart';
import 'package:qatar_driver_app/screens/details/order_ditails_item.dart';
import 'package:qatar_driver_app/screens/order/my_orders.dart';

import '../../../SizeConfig.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double _width;
  OrderDetailsResponse orderDetailsResponse;
  bool isLoading = false;

  final List<Image> _icons = [
    Image.asset("assets/icon1.png"),
    Image.asset("assets/icon2_s.png"),
    Image.asset("assets/icon3_s.png")
  ];

  final List<String> _titles = ["استيلام الماء", "تسليم المياه", "الصورة"];
  int _curStep = 2;
  final Color _activeColor = const Color(0xff0D2784);
  final Color _inactiveColor = Colors.grey[100];
  final double lineWidth = 3.0;

  getData() async {
    int id = Provider.of<OrderProvider>(context, listen: false).orderId;
    orderDetailsResponse = await HttpService.apiHelper.getOrderDetails(id);
    if (orderDetailsResponse.status) {
      setState(() {
        isLoading = true;
        putStep();
      });
    }
  }

  putStep() {
    switch (orderDetailsResponse.data.status) {
      case "Reserved":
        _curStep = 2;
        break;
      case "Received":
        _curStep = 3;
        break;
      case "Delivered":
        _curStep = 4;
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  onPress() async {
    // final progress = ProgressHUD.of(context);

    print(orderDetailsResponse.data.status);
    switch (orderDetailsResponse.data.status) {
      case "Reserved":
        // progress.show();
        Provider.of<OrderProvider>(context, listen: false).changeLoading(true);
        MainResponse response = await HttpService.apiHelper
            .receivedOrder(orderDetailsResponse.data.id);
        if (response.status) {
          // progress.dismiss();
          Provider.of<OrderProvider>(context, listen: false)
              .changeLoading(false);
          Get.snackbar(
            "",
            "تم العمل بنجاح",
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
          Get.to(() => MyOrderScreen(),
              transition: Transition.leftToRight,
              duration: const Duration(milliseconds: 800));
        } else {
          // progress.dismiss();
          Provider.of<OrderProvider>(context, listen: false)
              .changeLoading(false);
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
        _curStep = 2;
        break;
      case "Received":
        // progress.show();
        Provider.of<OrderProvider>(context, listen: false).changeLoading(true);
        MainResponse response = await HttpService.apiHelper
            .deliverOrder(orderDetailsResponse.data.id);
        if (response.status) {
          // progress.dismiss();
          Provider.of<OrderProvider>(context, listen: false)
              .changeLoading(false);
          takePhoto();
          // Get.to(()=>MyOrderScreen(),transition: Transition.leftToRight,duration: const Duration(milliseconds: 800));
        } else {
          // progress.dismiss();
          Provider.of<OrderProvider>(context, listen: false)
              .changeLoading(false);
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
        break;
      case "Delivered":
        _curStep = 4;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        isLoading
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Flexible(
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            OrderDeiItem(orderDetailsResponse.data),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Divider(
                                color: Color(0xffC1C1C1),
                                height: 2,
                              ),
                            ),
                            Flexible(
                              child: Container(
                                  padding: const EdgeInsets.only(
                                    top: 15.0,
                                    left: 24.0,
                                    right: 24.0,
                                  ),
                                  width: _width,
                                  child: Row(
                                    textDirection: TextDirection.rtl,
                                    children: <Widget>[
                                      Column(
                                        children: _iconViews(),
                                      ),
                                      if (_titles != null)
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              16.0, 16.0, 16.0, 0.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: _titleViews(),
                                          ),
                                        ),
                                    ],
                                  )),
                            ),
                            //
                            orderDetailsResponse.data.image != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.network(
                                      "https://portal.qatrahksa.com/" +
                                          orderDetailsResponse.data.image,
                                      height: 152,
                                      width: 300,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Center(),
                            SizedBox(
                              height: getProportionateScreenHeight(30),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      child: BtnLayout("تأكيد", () => onPress()),
                      opacity: orderDetailsResponse.data.status == "Delivered"
                          ? 0.0
                          : 1.0,
                    )
                  ],
                ),
              )
            : Loading(),
        Provider.of<OrderProvider>(context).isLoading ? Loading() : Center()
      ],
    );
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    _icons.asMap().forEach((i, icon) {
      //colors according to state
      var circleColor =
          (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;

      var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;

      var iconColor =
          (i == 0 || _curStep > i + 1) ? _inactiveColor : _activeColor;

      list.add(
        //dot with icon view
        Container(
          width: 45.0,
          height: 45.0,
          padding: const EdgeInsets.all(0),
          child: icon,
          decoration: BoxDecoration(
              color: circleColor,
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              border: Border.all(
                color: _inactiveColor,
                width: 2.0,
              ),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset.zero)
              ]),
        ),
      );

      //line between icons
      if (i != _icons.length - 1) {
        list.add(SizedBox(
          height: 22.0,
          child: Container(
            margin: const EdgeInsets.all(1.5),
            width: lineWidth,
            color: lineColor,
          ),
        ));
      }
    });

    return list;
  }

  List<Widget> _titleViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, text) {
      list.add(SizedBox(
          height: 70,
          child: Text(text,
              style: TextStyle(
                  color: _activeColor, fontWeight: FontWeight.bold))));
    });
    return list;
  }

  void takePhoto() async {
    PickedFile pickedFile = await ImagePicker()
        // ignore: deprecated_member_use
        .getImage(source: ImageSource.camera);

    // progress.show();
    Provider.of<OrderProvider>(context, listen: false).changeLoading(true);
    MainResponse response = await HttpService.apiHelper
        .proofOrder(orderDetailsResponse.data.id, File(pickedFile.path));

    if (response.status) {
      Provider.of<OrderProvider>(context, listen: false).changeLoading(false);
      // progress.dismiss();
      Get.snackbar(
        "",
        "تم العمل بنجاح",
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
      Get.to(() => MyOrderScreen(),
          transition: Transition.leftToRight,
          duration: const Duration(milliseconds: 800));
    } else {
      Provider.of<OrderProvider>(context, listen: false).changeLoading(false);
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
  }
}
