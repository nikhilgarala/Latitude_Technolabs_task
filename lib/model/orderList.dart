// To parse this JSON data, do
//
//     final orderList = orderListFromJson(jsonString);

import 'dart:convert';

OrderList orderListFromJson(String str) => OrderList.fromJson(json.decode(str));

String orderListToJson(OrderList data) => json.encode(data.toJson());

class OrderList {
  OrderList({
    this.status,
    this.message,
    this.totalCount,
    this.offerCount,
    this.data,
  });

  int status;
  String message;
  int totalCount;
  int offerCount;
  List<Datum> data;

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
    status: json["status"],
    message: json["message"],
    totalCount: json["total_count"],
    offerCount: json["offer_count"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "total_count": totalCount,
    "offer_count": offerCount,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.profileId,
    this.type,
    this.title,
    this.slug,
    this.address,
    this.city,
    this.state,
    this.country,
    this.lat,
    this.lng,
    this.estimatedPrice,
    this.description,
    this.currency,
    this.isDelivery,
    this.isComplete,
    this.isPayment,
    this.isDeliveryPendingProfileId,
    this.isTaken,
    this.isReceived,
    this.isTakeReciveProfileId,
    this.isFreeLocalPickup,
    this.isPaidDelivery,
    this.isShipsByUsps,
    this.uspsWeight,
    this.offerBoost,
    this.offerRewards,
    this.categoryId,
    this.createdAt,
    this.isExpires,
    this.category,
    this.offerMedia,
    this.profileInfo,
    this.takeReciveProfile,
    this.deliveryPendingProfile,
  });

  int id;
  int profileId;
  Type type;
  String title;
  String slug;
  String address;
  String city;
  String state;
  Country country;
  String lat;
  String lng;
  int estimatedPrice;
  String description;
  Currency currency;
  int isDelivery;
  int isComplete;
  dynamic isPayment;
  dynamic isDeliveryPendingProfileId;
  int isTaken;
  int isReceived;
  int isTakeReciveProfileId;
  int isFreeLocalPickup;
  int isPaidDelivery;
  int isShipsByUsps;
  dynamic uspsWeight;
  int offerBoost;
  dynamic offerRewards;
  int categoryId;
  DateTime createdAt;
  int isExpires;
  Category category;
  List<OfferMedia> offerMedia;
  ProfileInfo profileInfo;
  dynamic takeReciveProfile;
  dynamic deliveryPendingProfile;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    profileId: json["profile_id"],
    type: typeValues.map[json["type"]],
    title: json["title"],
    slug: json["slug"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    country: countryValues.map[json["country"]],
    lat: json["lat"],
    lng: json["lng"],
    estimatedPrice: json["estimated_price"],
    description: json["description"] == null ? null : json["description"],
    currency: currencyValues.map[json["currency"]],
    isDelivery: json["is_delivery"],
    isComplete: json["is_complete"],
    isPayment: json["is_payment"],
    isDeliveryPendingProfileId: json["is_delivery_pending_profile_id"],
    isTaken: json["is_taken"],
    isReceived: json["is_received"],
    isTakeReciveProfileId: json["is_take_recive_profile_id"],
    isFreeLocalPickup: json["is_free_local_pickup"],
    isPaidDelivery: json["is_paid_delivery"],
    isShipsByUsps: json["is_ships_by_usps"],
    uspsWeight: json["usps_weight"],
    offerBoost: json["offer_boost"],
    offerRewards: json["offer_rewards"],
    categoryId: json["category_id"],
    createdAt: DateTime.parse(json["created_at"]),
    isExpires: json["is_expires"],
    category: Category.fromJson(json["category"]),
    offerMedia: List<OfferMedia>.from(json["offer_media"].map((x) => OfferMedia.fromJson(x))),
    profileInfo: ProfileInfo.fromJson(json["profile_info"]),
    takeReciveProfile: json["take_recive_profile"],
    deliveryPendingProfile: json["delivery_pending_profile"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profile_id": profileId,
    "type": typeValues.reverse[type],
    "title": title,
    "slug": slug,
    "address": address,
    "city": city,
    "state": state,
    "country": countryValues.reverse[country],
    "lat": lat,
    "lng": lng,
    "estimated_price": estimatedPrice,
    "description": description == null ? null : description,
    "currency": currencyValues.reverse[currency],
    "is_delivery": isDelivery,
    "is_complete": isComplete,
    "is_payment": isPayment,
    "is_delivery_pending_profile_id": isDeliveryPendingProfileId,
    "is_taken": isTaken,
    "is_received": isReceived,
    "is_take_recive_profile_id": isTakeReciveProfileId,
    "is_free_local_pickup": isFreeLocalPickup,
    "is_paid_delivery": isPaidDelivery,
    "is_ships_by_usps": isShipsByUsps,
    "usps_weight": uspsWeight,
    "offer_boost": offerBoost,
    "offer_rewards": offerRewards,
    "category_id": categoryId,
    "created_at": createdAt.toIso8601String(),
    "is_expires": isExpires,
    "category": category.toJson(),
    "offer_media": List<dynamic>.from(offerMedia.map((x) => x.toJson())),
    "profile_info": profileInfo.toJson(),
    "take_recive_profile": takeReciveProfile,
    "delivery_pending_profile": deliveryPendingProfile,
  };
}

class Category {
  Category({
    this.id,
    this.title,
  });

  int id;
  String title;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}

enum Country { INDIA, UNITED_STATES, COLOMBIA }

final countryValues = EnumValues({
  "Colombia": Country.COLOMBIA,
  "India": Country.INDIA,
  "United States": Country.UNITED_STATES
});

enum Currency { USD }

final currencyValues = EnumValues({
  "USD": Currency.USD
});

class OfferMedia {
  OfferMedia({
    this.id,
    this.offerId,
    this.file,
    this.storageName,
  });

  int id;
  int offerId;
  String file;
  String storageName;

  factory OfferMedia.fromJson(Map<String, dynamic> json) => OfferMedia(
    id: json["id"],
    offerId: json["offer_id"],
    file: json["file"],
    storageName: json["storage_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "offer_id": offerId,
    "file": file,
    "storage_name": storageName,
  };
}

class ProfileInfo {
  ProfileInfo({
    this.id,
    this.name,
    this.city,
    this.state,
    this.country,
    this.about,
    this.gender,
    this.dateOfBirth,
    this.email,
    this.fileName,
    this.hideAge,
    this.interest,
    this.credit,
    this.profileLikeSum,
    this.currency,
    this.primeUser,
  });

  int id;
  String name;
  String city;
  String state;
  Country country;
  String about;
  int gender;
  DateTime dateOfBirth;
  String email;
  dynamic fileName;
  int hideAge;
  String interest;
  int credit;
  int profileLikeSum;
  Currency currency;
  int primeUser;

  factory ProfileInfo.fromJson(Map<String, dynamic> json) => ProfileInfo(
    id: json["id"],
    name: json["name"],
    city: json["city"] == null ? null : json["city"],
    state: json["state"] == null ? null : json["state"],
    country: countryValues.map[json["country"]],
    about: json["about"] == null ? null : json["about"],
    gender: json["gender"] == null ? null : json["gender"],
    dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
    email: json["email"],
    fileName: json["file_name"],
    hideAge: json["hide_age"] == null ? null : json["hide_age"],
    interest: json["interest"] == null ? null : json["interest"],
    credit: json["credit"],
    profileLikeSum: json["profile_like_sum"],
    currency: currencyValues.map[json["currency"]],
    primeUser: json["prime_user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "city": city == null ? null : city,
    "state": state == null ? null : state,
    "country": countryValues.reverse[country],
    "about": about == null ? null : about,
    "gender": gender == null ? null : gender,
    "date_of_birth": dateOfBirth == null ? null : dateOfBirth.toIso8601String(),
    "email": email,
    "file_name": fileName,
    "hide_age": hideAge == null ? null : hideAge,
    "interest": interest == null ? null : interest,
    "credit": credit,
    "profile_like_sum": profileLikeSum,
    "currency": currencyValues.reverse[currency],
    "prime_user": primeUser,
  };
}

enum Type { GIVEAWAY }

final typeValues = EnumValues({
  "GIVEAWAY": Type.GIVEAWAY
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
