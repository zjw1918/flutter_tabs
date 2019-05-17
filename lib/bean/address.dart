class Address {
  final String name;
  final String address;
  final num latitude;
  final num longitude;
  final String geohash;

  Address({
    this.name, 
    this.address, 
    this.latitude, 
    this.longitude, 
    this.geohash
  });

  factory Address.fromjson(Map<String, dynamic> json) => 
    Address(
      name: json['name'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      geohash: json['geohash'],
    );

  @override
  String toString() {
    return '$name, $address, $latitude, $longitude, $geohash';
  }
}
