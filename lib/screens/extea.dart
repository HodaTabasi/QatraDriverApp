import 'package:flutter/material.dart';
import 'package:qatar_driver_app/component/customAppBar.dart';
import 'package:qatar_driver_app/component/loading.dart';
import 'package:qatar_driver_app/helper/http_service.dart';
import 'package:qatar_driver_app/model/SettingResponse.dart';

class Extra extends StatefulWidget {
  static String routeName = "/extra";

  @override
  State<Extra> createState() => _ExtraState();
}

class _ExtraState extends State<Extra> {
  SettingResponse? response;
  bool _isloading = false;

  onCreate() async {
    response = await HttpService.apiHelper.getSetting();
    setState(() {
      _isloading = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onCreate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("قطرة"),
        body: _isloading
            ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  child: response!.status!
                      ? Text(response!.data!.value!)
                      : Text("something error"),
                ),
            )
            : Loading());
  }
}
