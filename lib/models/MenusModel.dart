// import 'package:hive/hive.dart';
// import 'MenuItemsModel.dart';
//
//
// part 'MenusModel.g.dart';
//
// @HiveType(typeId : 3)
// class MenusCat {
//   @HiveField(0)
//   int id;
//
//   @HiveField(1)
//   int restaurantId;
//
//   @HiveField(2)
//   String nameEn;
//
//   @HiveField(3)
//   String nameTr;
//
//   @HiveField(4)
//   String descriptionEn;
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
//   Null deletedAt;
//
//   @HiveField(10)
//   String createdAt;
//
//   @HiveField(11)
//   String updatedAt;
//
//   @HiveField(12)
//   String description;
//
//   @HiveField(13)
//   String name;
//
//   @HiveField(14)
//   List<Items> items;
//
//   @HiveField(15)
//   String descriptionTr;
//
//   MenusCat(
//       {this.id,
//         this.restaurantId,
//         this.nameEn,
//         this.nameTr,
//         this.descriptionEn,
//         this.descriptionTr,
//         this.availabilityStarts,
//         this.availabilityEnds,
//         this.image,
//         this.priceRange,
//         this.deletedAt,
//         this.createdAt,
//         this.updatedAt,
//         this.description,
//         this.name,
//         this.items});
//
//   MenusCat.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     restaurantId = json['restaurant_id'];
//     nameEn = json['name_en'];
//     nameTr = json['name_tr'];
//     descriptionEn = json['description_en'];
//     descriptionTr = json['description_tr'];
//     availabilityStarts = json['availability_starts'];
//     availabilityEnds = json['availability_ends'];
//     image = json['image'];
//     priceRange = json['price_range'];
//     deletedAt = json['deleted_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     description = json['description'];
//     name = json['name'];
//     if (json['items'] != null) {
//       items = new List<Items>();
//       json['items'].forEach((v) {
//         items.add(new Items.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['restaurant_id'] = this.restaurantId;
//     data['name_en'] = this.nameEn;
//     data['name_tr'] = this.nameTr;
//     data['description_en'] = this.descriptionEn;
//     data['description_tr'] = this.descriptionTr;
//     data['availability_starts'] = this.availabilityStarts;
//     data['availability_ends'] = this.availabilityEnds;
//     data['image'] = this.image;
//     data['price_range'] = this.priceRange;
//     data['deleted_at'] = this.deletedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['description'] = this.description;
//     data['name'] = this.name;
//     if (this.items != null) {
//       data['items'] = this.items.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
