// import 'package:hive/hive.dart';
//
// part 'OpenDaysModel.g.dart';
//
// @HiveType(typeId: 2)
// class OpenDays {
//   @HiveField(0)
//   int id;
//
//   @HiveField(1)
//   String nameEn;
//
//   @HiveField(2)
//   String nameTr;
//
//   @HiveField(3)
//   String createdAt;
//
//   @HiveField(4)
//   String updatedAt;
//
//   OpenDays(
//       {required this.id,
//       required this.nameEn,
//       required this.nameTr,
//       required this.createdAt,
//       required this.updatedAt});
//
//   OpenDays.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nameEn = json['name_en'];
//     nameTr = json['name_tr'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name_en'] = this.nameEn;
//     data['name_tr'] = this.nameTr;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
