class DropLocationModel{
  String? address,title,city,country;
  double? lat;
  double? lng;

  DropLocationModel({this.address,this.title,this.city,this.country, this.lat, this.lng});

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      "title" : title,
      "city" : city,
      "country" : country,
      'lat': lat,
      'lng': lng,
    };
  }

  factory DropLocationModel.fromMap(Map map) {
    return DropLocationModel(
      address: map['address'] == null ? "" : map['address'] as String,
      title: map['title'] == null ? "" : map['title'] as String,
      city: map['city'] == null ? "" : map['city'] as String,
      country: map['country'] == null ? "" : map['country'] as String,
      lat: map['lat'] == null ? 0.0 : map['lat'] as double,
      lng: map['lng'] == null ? 0.0 : map['lng'] as double,
    );
  }
}