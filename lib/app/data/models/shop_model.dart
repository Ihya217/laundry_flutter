class ShopModel {
  List<ShopData>? data;

  ShopModel({this.data});

  ShopModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ShopData>[];
      json['data'].forEach((v) {
        data!.add(new ShopData.fromJson(v));
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

class ShopData {
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

  ShopData({
    this.id,
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
    this.updatedAt,
  });

  factory ShopData.fromJson(Map<String, dynamic> json) {
    return ShopData(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      location: json['location'],
      city: json['city'],
      delivery: json['delivery'],
      pickup: json['pickup'],
      whatsapp: json['whatsapp'],
      description: json['description'],
      price: json['price'],
      rate: json['rate'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'image': image,
      'name': name,
      'location': location,
      'city': city,
      'delivery': delivery,
      'pickup': pickup,
      'whatsapp': whatsapp,
      'description': description,
      'price': price,
      'rate': rate,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
    return data;
  }
}
