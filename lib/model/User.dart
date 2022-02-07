class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String password;
  String phone;
  String city;
  String address;
  bool isBan;
  String createdAt;
  String updatedAt;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.phone,
        this.city,
        this.address,
        this.isBan,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    city = json['city'];
    address = json['address'];
    isBan = json['isBan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['address'] = this.address;
    data['isBan'] = this.isBan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}