// To parse this JSON data, do
//
//     final orderListItemDetails = orderListItemDetailsFromJson(jsonString);

import 'dart:convert';

OrderListItemDetails orderListItemDetailsFromJson(String str) => OrderListItemDetails.fromJson(json.decode(str));

String orderListItemDetailsToJson(OrderListItemDetails data) => json.encode(data.toJson());

class OrderListItemDetails {
  OrderListItemDetails({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory OrderListItemDetails.fromJson(Map<String, dynamic> json) => OrderListItemDetails(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
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
    this.profileId,
    this.likeSum,
    this.viewSum,
    this.createdAt,
    this.paymentId,
    this.currency,
    this.offerComment,
    this.isOfferReport,
    this.offerUrl,
    this.offerChatUser,
    this.isExpires,
    this.isLiked,
    this.thread,
    this.category,
    this.offerMedia,
    this.offerMediaDeleted,
    this.profileInfo,
    this.offerWishlist,
    this.takeReciveProfile,
    this.deliveryPendingProfile,
  });

  int id;
  String type;
  String title;
  String slug;
  String address;
  String city;
  String state;
  String country;
  String lat;
  String lng;
  int estimatedPrice;
  dynamic description;
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
  int profileId;
  int likeSum;
  int viewSum;
  DateTime createdAt;
  dynamic paymentId;
  String currency;
  List<dynamic> offerComment;
  int isOfferReport;
  String offerUrl;
  List<dynamic> offerChatUser;
  int isExpires;
  int isLiked;
  String thread;
  Category category;
  List<OfferMedia> offerMedia;
  List<dynamic> offerMediaDeleted;
  ProfileInfo profileInfo;
  List<dynamic> offerWishlist;
  dynamic takeReciveProfile;
  dynamic deliveryPendingProfile;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    type: json["type"],
    title: json["title"],
    slug: json["slug"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    lat: json["lat"],
    lng: json["lng"],
    estimatedPrice: json["estimated_price"],
    description: json["description"],
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
    profileId: json["profile_id"],
    likeSum: json["like_sum"],
    viewSum: json["view_sum"],
    createdAt: DateTime.parse(json["created_at"]),
    paymentId: json["payment_id"],
    currency: json["currency"],
    offerComment: List<dynamic>.from(json["offer_comment"].map((x) => x)),
    isOfferReport: json["is_offer_report"],
    offerUrl: json["offer_url"],
    offerChatUser: List<dynamic>.from(json["offer_chat_user"].map((x) => x)),
    isExpires: json["is_expires"],
    isLiked: json["is_liked"],
    thread: json["thread"],
    category: Category.fromJson(json["category"]),
    offerMedia: List<OfferMedia>.from(json["offer_media"].map((x) => OfferMedia.fromJson(x))),
    offerMediaDeleted: List<dynamic>.from(json["offer_media_deleted"].map((x) => x)),
    profileInfo: ProfileInfo.fromJson(json["profile_info"]),
    offerWishlist: List<dynamic>.from(json["offer_wishlist"].map((x) => x)),
    takeReciveProfile: json["take_recive_profile"],
    deliveryPendingProfile: json["delivery_pending_profile"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "title": title,
    "slug": slug,
    "address": address,
    "city": city,
    "state": state,
    "country": country,
    "lat": lat,
    "lng": lng,
    "estimated_price": estimatedPrice,
    "description": description,
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
    "profile_id": profileId,
    "like_sum": likeSum,
    "view_sum": viewSum,
    "created_at": createdAt.toIso8601String(),
    "payment_id": paymentId,
    "currency": currency,
    "offer_comment": List<dynamic>.from(offerComment.map((x) => x)),
    "is_offer_report": isOfferReport,
    "offer_url": offerUrl,
    "offer_chat_user": List<dynamic>.from(offerChatUser.map((x) => x)),
    "is_expires": isExpires,
    "is_liked": isLiked,
    "thread": thread,
    "category": category.toJson(),
    "offer_media": List<dynamic>.from(offerMedia.map((x) => x.toJson())),
    "offer_media_deleted": List<dynamic>.from(offerMediaDeleted.map((x) => x)),
    "profile_info": profileInfo.toJson(),
    "offer_wishlist": List<dynamic>.from(offerWishlist.map((x) => x)),
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

class OfferMedia {
  OfferMedia({
    this.id,
    this.offerId,
    this.file,
    this.storageName,
    this.imageOrder,
  });

  int id;
  int offerId;
  String file;
  String storageName;
  dynamic imageOrder;

  factory OfferMedia.fromJson(Map<String, dynamic> json) => OfferMedia(
    id: json["id"],
    offerId: json["offer_id"],
    file: json["file"],
    storageName: json["storage_name"],
    imageOrder: json["image_order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "offer_id": offerId,
    "file": file,
    "storage_name": storageName,
    "image_order": imageOrder,
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
  dynamic city;
  dynamic state;
  String country;
  dynamic about;
  dynamic gender;
  dynamic dateOfBirth;
  String email;
  dynamic fileName;
  dynamic hideAge;
  dynamic interest;
  int credit;
  int profileLikeSum;
  String currency;
  int primeUser;

  factory ProfileInfo.fromJson(Map<String, dynamic> json) => ProfileInfo(
    id: json["id"],
    name: json["name"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    about: json["about"],
    gender: json["gender"],
    dateOfBirth: json["date_of_birth"],
    email: json["email"],
    fileName: json["file_name"],
    hideAge: json["hide_age"],
    interest: json["interest"],
    credit: json["credit"],
    profileLikeSum: json["profile_like_sum"],
    currency: json["currency"],
    primeUser: json["prime_user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "city": city,
    "state": state,
    "country": country,
    "about": about,
    "gender": gender,
    "date_of_birth": dateOfBirth,
    "email": email,
    "file_name": fileName,
    "hide_age": hideAge,
    "interest": interest,
    "credit": credit,
    "profile_like_sum": profileLikeSum,
    "currency": currency,
    "prime_user": primeUser,
  };
}
