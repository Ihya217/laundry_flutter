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
    data['id'] = id;
    data['claim_code'] = claimCode;
    data['user_id'] = userId;
    data['shop_id'] = shopId;
    data['weight'] = weight;
    data['with_pickup'] = withPickup;
    data['with_delivery'] = withDelivery;
    data['pickup_address'] = pickupAddress;
    data['delivery_address'] = deliveryAddress;
    data['total'] = total;
    data['description'] = description;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (shop != null) {
      data['shop'] = shop!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
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
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['location'] = location;
    data['city'] = city;
    data['delivery'] = delivery;
    data['pickup'] = pickup;
    data['whatsapp'] = whatsapp;
    data['description'] = description;
    data['price'] = price;
    data['rate'] = rate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class User {
  num? id;
  String? username;
  String? email;
  String? createdAt;
  String? updatedAt;

  User({this.id, this.username, this.email, this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
