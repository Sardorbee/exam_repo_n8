class AddressModelFields {
  static const String id = "id";
  static const String lat = "lat";
  static const String long = "long";
  static const String type = "type";
  static const String address = "address";
  static const String createdAt = "createdAt";
  static const String podyezd = "podyezd";
  static const String etaj = "etaj";
  static const String house = "house";
  static const String orientir = "orientir";

  static const String addressTable = "adressTable";
}

class AddressModel {
  final int? id;
  final String? address;
  final String podyezd;
  final String type;
  final String etaj;
  final String house;
  final String orientir;
  final double lat;
  final double long;
  final String createdAt;

  AddressModel({
     this.id,
     this.address,
    required this.podyezd,
    required this.etaj,
    required this.type,
    required this.house,
    required this.orientir,
    required this.lat,
    required this.long,
    required this.createdAt,
  });

  AddressModel copyWith({
    int? id,
    String? address,
    String? podyezd,
    String? type,
    String? etaj,
    String? house,
    String? orientir,
    double? lat,
    double? long,
    String? createdAt,
  }) {
    return AddressModel(
      id: id ?? this.id,
      address: address ?? this.address,
      podyezd: podyezd ?? this.podyezd,
      type: type ?? this.type,
      etaj: etaj ?? this.etaj,
      house: house ?? this.house,
      orientir: orientir ?? this.orientir,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      address: json['address'],
      podyezd: json['podyezd'],
      type: json['type'],
      etaj: json['etaj'],
      house: json['house'],
      orientir: json['orientir'],
      lat: json['lat'],
      long: json['long'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'podyezd': podyezd,
      'type': type,
      'etaj': etaj,
      'house': house,
      'orientir': orientir,
      'lat': lat,
      'long': long,
      'createdAt': createdAt,
    };
  }
}
