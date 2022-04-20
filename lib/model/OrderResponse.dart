import 'package:qatar_driver_app/model/Order.dart';

class OrderResponse {
  bool? status;
  List<Order>? data;
  List<String>? message;

  OrderResponse({this.status, this.data, this.message});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new Order.fromJson(v));
      });
    }
    if (json['message'] != null) {
      message = <String>[];
      json['message'].forEach((v) {
        message!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v).toList();
    }
    return data;
  }
}