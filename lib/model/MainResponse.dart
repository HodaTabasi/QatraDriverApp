class MainResponse {
  bool status;
  List<String> data;
  List<String> message;

  MainResponse({this.status, this.data, this.message});

  MainResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <String>[];
      json['data'].forEach((v) {
        data.add(v);
      });
    }
    if (json['message'] != null) {
      message = <String>[];
      json['message'].forEach((v) {
        message.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v).toList();
    }
    if (this.message != null) {
      data['message'] = this.message.map((v) => v).toList();
    }
    return data;
  }
}
