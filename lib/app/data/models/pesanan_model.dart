class PesananModel {
  List<PesananData>? data;

  PesananModel({this.data});

  PesananModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PesananData>[];
      json['data'].forEach((v) {
        data!.add(new PesananData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PesananData {
  num? id;
  String? claimCode;
  num? userId;
  num? shopId;
  num? weight;
  num? withPickup;
  num? withDelivery;
  String? pickupAddress;
  String? deliveryAddress;
  num? total;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;
  Shop? shop;
  User? user;

  PesananData(
      {this.id,
      this.claimCode,
      this.userId,
      this.shopId,
      this.weight,
      this.withPickup,
      this.withDelivery,
      this.pickupAddress,
      this.deliveryAddress,
      this.total,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.shop,
      this.user});

  PesananData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    claimCode = json['claim_code'];
    userId = json['user_id'];
    shopId = json['shop_id'];
    weight = json['weight'];
    withPickup = json['with_pickup'];
    withDelivery = json['with_delivery'];
    pickupAddress = json['pickup_address'];
    deliveryAddress = json['delivery_address'];
    total = json['total'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['claim_code'] = this.claimCode;
    data['user_id'] = this.userId;
    data['shop_id'] = this.shopId;
    data['weight'] = this.weight;
    data['with_pickup'] = this.withPickup;
    data['with_delivery'] = this.withDelivery;
    data['pickup_address'] = this.pickupAddress;
    data['delivery_address'] = this.deliveryAddress;
    data['total'] = this.total;
    data['description'] = this.description;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Shop {
  num? id;
  String? image;
  String? name;
  String? location;
  String? city;
  num? delivery;
  num? pickup;
  String? whatsapp;
  String? description;
  num? price;
  num? rate;
  String? createdAt;
  String? updatedAt;

  Shop(
      {this.id,
      this.image,
      this.name,
      this.location,
      this.city,
      this.delivery,
      this.pickup,
      this.whatsapp,
      this.description,
      this.price,
      this.rate,
      this.createdAt,
      this.updatedAt});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    location = json['location'];
    city = json['city'];
    delivery = json['delivery'];
    pickup = json['pickup'];
    whatsapp = json['whatsapp'];
    description = json['description'];
    price = json['price'];
    rate = json['rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['location'] = this.location;
    data['city'] = this.city;
    data['delivery'] = this.delivery;
    data['pickup'] = this.pickup;
    data['whatsapp'] = this.whatsapp;
    data['description'] = this.description;
    data['price'] = this.price;
    data['rate'] = this.rate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  num? id;
  String? username;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.username,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
