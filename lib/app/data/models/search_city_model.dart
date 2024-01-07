class SearchCityModel {
  List<SearchCityData>? data;

  SearchCityModel({this.data});

  SearchCityModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SearchCityData>[];
      json['data'].forEach((v) {
        data!.add(new SearchCityData.fromJson(v));
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

class SearchCityData {
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

  SearchCityData(
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

  SearchCityData.fromJson(Map<String, dynamic> json) {
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
