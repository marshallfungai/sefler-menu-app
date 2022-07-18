// import 'package:hive/hive.dart';
//
// import 'MenusModel.dart';
// import 'MenuItemsModel.dart';
// import 'OpenDaysModel.dart';
// import 'ContactModel.dart';
//
// part 'RestaurantModel.g.dart';
// // part 'Restaurant.g.dart';
// // part 'OpenDays.g.dart';
// // part 'Menus.g.dart';
// // part 'Items.g.dart';
// // part 'Contact.g.dart';
//
// @HiveType(typeId: 6)
// class RestaurantModel {
//   @HiveField(0)
//   Restaurant restaurant;
//
//   RestaurantModel({required this.restaurant});
//
//   RestaurantModel.fromJson(Map<String, dynamic> json) {
//     restaurant = (json['restaurant'] != null
//         ? new Restaurant.fromJson(json['restaurant'])
//         : null)!;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.restaurant != null) {
//       data['restaurant'] = this.restaurant.toJson();
//     }
//     return data;
//   }
// }
//
// @HiveType(typeId: 1)
// class Restaurant {
//   @HiveField(0)
//   int id;
//
//   @HiveField(1)
//   int userId;
//
//   @HiveField(2)
//   String name;
//
//   @HiveField(3)
//   String descriptionEn;
//
//   @HiveField(4)
//   List<int> operatingDays;
//
//   @HiveField(5)
//   String availabilityStarts;
//
//   @HiveField(6)
//   String availabilityEnds;
//
//   @HiveField(7)
//   String image;
//
//   @HiveField(8)
//   String priceRange;
//
//   @HiveField(9)
//   String createdAt;
//
//   @HiveField(10)
//   String updatedAt;
//
//   @HiveField(11)
//   Null deletedAt;
//
//   @HiveField(12)
//   List<OpenDays> openDays;
//
//   @HiveField(13)
//   List<MenusCat> menus;
//
//   @HiveField(14)
//   Contact contact;
//
//   @HiveField(15)
//   String descriptionTr;
//
//   Restaurant(
//       {required this.id,
//       required this.userId,
//       required this.name,
//       required this.descriptionEn,
//       required this.descriptionTr,
//       required this.operatingDays,
//       required this.availabilityStarts,
//       required this.availabilityEnds,
//       required this.image,
//       required this.priceRange,
//       required this.createdAt,
//       required this.updatedAt,
//       this.deletedAt,
//       required this.openDays,
//       required this.menus,
//       required this.contact});
//
//   Restaurant.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     name = json['name'];
//     descriptionEn = json['description_en'];
//     descriptionTr = json['description_tr'];
//     operatingDays = json['operating_days'].cast<int>();
//     availabilityStarts = json['availability_starts'];
//     availabilityEnds = json['availability_ends'];
//     image = json['image'];
//     priceRange = json['price_range'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//     if (json['open_days'] != null) {
//       openDays = <OpenDays>[];
//       json['open_days'].forEach((v) {
//         openDays.add(new OpenDays.fromJson(v));
//       });
//     }
//
//     if (json['menus'] != null) {
//       // ignore: deprecated_member_use
//       menus = List<MenusCat>();
//       json['menus'].forEach((v) {
//         menus.add(new MenusCat.fromJson(v));
//       });
//     }
//     contact = (json['contact'] != null
//         ? new Contact.fromJson(json['contact'])
//         : null)!;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['name'] = this.name;
//     data['description_en'] = this.descriptionEn;
//     data['description_tr'] = this.descriptionTr;
//     data['operating_days'] = this.operatingDays;
//     data['availability_starts'] = this.availabilityStarts;
//     data['availability_ends'] = this.availabilityEnds;
//     data['image'] = this.image;
//     data['price_range'] = this.priceRange;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['deleted_at'] = this.deletedAt;
//     if (this.openDays != null) {
//       data['open_days'] = this.openDays.map((v) => v.toJson()).toList();
//     }
//     if (this.menus != null) {
//       data['menus'] = this.menus.map((v) => v.toJson()).toList();
//     }
//     if (this.contact != null) {
//       data['contact'] = this.contact.toJson();
//     }
//     return data;
//   }
// }
