import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qatar_driver_app/helper/shared_prefrences_helper.dart';
import 'package:qatar_driver_app/model/LoginResponse.dart';
import 'package:qatar_driver_app/model/MainResponse.dart';
import 'package:qatar_driver_app/model/OrderDetailsResponse.dart';
import 'package:qatar_driver_app/model/OrderResponse.dart';
import 'package:qatar_driver_app/model/SettingResponse.dart';
import 'package:qatar_driver_app/screens/login/loginbyemail_screen.dart';

class HttpService {
  late Dio _dio;

  // final baseUrl = "http://qatra.pal-dev.com/api/";
  final baseUrl = "https://portal.qatrahksa.com/api/";

  static HttpService apiHelper = HttpService();

  HttpService() {
    _dio = Dio();

    // initializeInterceptors();
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        print(e.message);
      },
      onRequest: (options, handler) {
        print("${options.method} ${options.path}");
      },
      onResponse: (e, handler) {
        print(e.data);
      },
    ));
  }

  Future<LoginResponse?> login(String userName, String password) async {
    try {
      Response response = await _dio.post(baseUrl + 'driver/auth/login',
          data: {'email': userName, 'password': password},
          options: Options(headers: {'Accept': 'application/json'}));

      print(response.data);
      LoginResponse registerResponse = LoginResponse.fromJson(response.data);
      return registerResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<OrderResponse?> getHome(context) async {
    try {
      Response response = await _dio.get(baseUrl + 'driver/orders',
          options: Options(headers: {
            'Authorization':
                'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
            'Accept': 'application/json'
          },validateStatus: (status) {
            print("fffffff $status");
            if(status != 200){
              SharedPrefrencesHelper.sharedPrefrencesHelper.clear();
              Navigator.of(context)
                  .pushAndRemoveUntil(
                CupertinoPageRoute(
                    builder: (context) => LoginEmail()
                ),
                    (_) => false,
              );
            }
            return status! < 500;
          }));

      print(response.data);
      OrderResponse homeResponse = OrderResponse.fromJson(response.data);
      return homeResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<OrderResponse?> getMyOrders() async {
    try {
      Response response = await _dio.get(baseUrl + 'driver/own-orders',
          options: Options(headers: {
            'Authorization':
                'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
            'Accept': 'application/json'
          }));

      print(response.data);
      OrderResponse homeResponse = OrderResponse.fromJson(response.data);
      return homeResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<MainResponse?> receivedOrder(orderId) async {
    try {
      Response response = await _dio.post(baseUrl + 'driver/receive-order/$orderId',
          options: Options(headers: {
            'Authorization':
            'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
            'Accept': 'application/json'
          }));

      print(response.data);
      MainResponse homeResponse = MainResponse.fromJson(response.data);
      return homeResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<MainResponse?> deliverOrder(orderId) async {
    try {
      Response response = await _dio.post(baseUrl + 'driver/deliver-order/$orderId',
          options: Options(headers: {
            'Authorization':
            'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
            'Accept': 'application/json'
          }));

      print(response.data);
      MainResponse homeResponse = MainResponse.fromJson(response.data);
      return homeResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<MainResponse?> proofOrder(orderId ,file) async {

    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image":
      await MultipartFile.fromFile(file.path, filename:fileName),
    });
    try {
      Response response = await _dio.post(baseUrl + 'driver/proof-order/$orderId',
          data: formData,
          options: Options(
              headers: {
            'Authorization':
            'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
            'Accept': 'application/json'
          }));

      print(response.data);
      MainResponse homeResponse = MainResponse.fromJson(response.data);
      return homeResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<MainResponse?> driverDeceivedOrder(orderId) async {
    try {
      Response response = await _dio.post(baseUrl + 'driver/reserve-order/$orderId',
          options: Options(
              headers: {
                'Authorization':
                'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
                'Accept': 'application/json'
              }));

      print(response.data);
      MainResponse homeResponse = MainResponse.fromJson(response.data);
      return homeResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }


  Future<SettingResponse?> getSetting() async {
    try {
      Response response = await _dio.get(baseUrl + 'user/settings',
          options: Options(headers: {
            'Authorization':
                'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
            'Accept': 'application/json'
          }),
          queryParameters: {
            "key": SharedPrefrencesHelper.sharedPrefrencesHelper.getType(),
          });

      print(response.data);
      SettingResponse settingResponse = SettingResponse.fromJson(response.data);
      return settingResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<OrderDetailsResponse?> getOrderDetails(int orderId) async {
    try {
      Response response = await _dio.get(baseUrl + 'driver/order/$orderId',
          options: Options(headers: {
            'Authorization':
                'Bearer ${SharedPrefrencesHelper.sharedPrefrencesHelper.getToken()}',
            'Accept': 'application/json'
          }));
      print(response.data);
      OrderDetailsResponse orderDetailsResponse =
          OrderDetailsResponse.fromJson(response.data);
      return orderDetailsResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
    }
  }
}
