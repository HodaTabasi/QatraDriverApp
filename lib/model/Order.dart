class Order {
  int? id;
  var orderNo;
  var userId;
  var mosqueType;
  String? status;
  var quantity;
  var mosqueId;
  var receiverId;
  var productId;
  var driverId;
  var image;
  var finalPrice;
  var priceBeforeDiscount;
  var priceAfterDiscount;
  String? productName;
  String? productDescription;
  var countCartoons;
  String? mosqueName;

  Order(
      {this.id,
        this.orderNo,
        this.userId,
        this.mosqueType,
        this.status,
        this.quantity,
        this.mosqueId,
        this.receiverId,
        this.productId,
        this.driverId,
        this.image,
        this.finalPrice,
        this.priceBeforeDiscount,
        this.priceAfterDiscount,
        this.productName,
        this.productDescription,
        this.countCartoons,
        this.mosqueName});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    userId = json['user_id'];
    mosqueType = json['mosque_type'];
    status = json['status'];
    quantity = json['quantity'];
    mosqueId = json['mosque_id'];
    receiverId = json['receiver_id'];
    productId = json['product_id'];
    driverId = json['driver_id'];
    image = json['image'];
    finalPrice = json['final_price'];
    priceBeforeDiscount = json['price_before_discount'];
    priceAfterDiscount = json['price_after_discount'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    countCartoons = json['count_cartoons'];
    mosqueName = json['mosque_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_no'] = this.orderNo;
    data['user_id'] = this.userId;
    data['mosque_type'] = this.mosqueType;
    data['status'] = this.status;
    data['quantity'] = this.quantity;
    data['mosque_id'] = this.mosqueId;
    data['receiver_id'] = this.receiverId;
    data['product_id'] = this.productId;
    data['driver_id'] = this.driverId;
    data['image'] = this.image;
    data['final_price'] = this.finalPrice;
    data['price_before_discount'] = this.priceBeforeDiscount;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['product_name'] = this.productName;
    data['product_description'] = this.productDescription;
    data['count_cartoons'] = this.countCartoons;
    data['mosque_name'] = this.mosqueName;
    return data;
  }
}