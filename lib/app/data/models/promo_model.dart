class PromoModel {
  final int id;
  final String image;
  final int shopId;
  final int oldPrice;
  final int newPrice;
  final String description;
  final String createdAt;
  final String updatedAt;
  final Shop shop;

  PromoModel({
    required this.id,
    required this.image,
    required this.shopId,
    required this.oldPrice,
    required this.newPrice,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.shop,
  });

  factory PromoModel.fromJson(Map<String, dynamic> json) {
    return PromoModel(
      id: json['id'],
      image: json['image'],
      shopId: json['shop_id'],
      oldPrice: json['old_price'],
      newPrice: json['new_price'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      shop: Shop.fromJson(json['shop']),
    );
  }
}

class Shop {
  final int id;
  final String image;
  final String name;
  final String location;
  final String city;
  final int delivery;
  final int pickup;
  final String whatsapp;
  final String description;
  final int price;
  final double rate;
  final String createdAt;
  final String updatedAt;

  Shop({
    required this.id,
    required this.image,
    required this.name,
    required this.location,
    required this.city,
    required this.delivery,
    required this.pickup,
    required this.whatsapp,
    required this.description,
    required this.price,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
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
      rate: json['rate'].toDouble(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class PromoData {
  final List<PromoModel> data;

  PromoData({
    required this.data,
  });

  factory PromoData.fromJson(Map<String, dynamic> json) {
    List<PromoModel> promoList = List<PromoModel>.from(
      json['data'].map((promo) => PromoModel.fromJson(promo)),
    );

    return PromoData(data: promoList);
  }
}
