import 'package:qatar_driver_app/model/Order.dart';

class OrderDetailsResponse {
  bool? status;
  Order? data;
  List<String>? message;

  OrderDetailsResponse({this.status, this.data, this.message});

  OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Order.fromJson(json['data']) : null;
    if (json['message'] != null) {
      message = [];
      json['message'].forEach((v) {
        message!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v).toList();
    }
    return data;
  }
}
