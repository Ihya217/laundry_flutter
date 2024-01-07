class PromoModel {
  List<Data>? data;

  PromoModel({this.data});

  PromoModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  int? id;
  String? image;
  int? shopId;
  num? oldPrice;
  num? newPrice;
  String? description;
  String? createdAt;
  String? updatedAt;
  Shop? shop;

  Data(
      {this.id,
      this.image,
      this.shopId,
      this.oldPrice,
      this.newPrice,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.shop});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    shopId = json['shop_id'];
    oldPrice = json['old_price'];
    newPrice = json['new_price'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['shop_id'] = this.shopId;
    data['old_price'] = this.oldPrice;
    data['new_price'] = this.newPrice;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    return data;
  }
}

class Shop {
  int? id;
  String? image;
  String? name;
  String? location;
  String? city;
  int? delivery;
  int? pickup;
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
