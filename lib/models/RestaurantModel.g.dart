// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'RestaurantModel.dart';
//
// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************
//
// class RestaurantModelAdapter extends TypeAdapter<RestaurantModel> {
//   @override
//   final int typeId = 6;
//
//   @override
//   RestaurantModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return RestaurantModel(
//       restaurant: fields[0] as Restaurant,
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, RestaurantModel obj) {
//     writer
//       ..writeByte(1)
//       ..writeByte(0)
//       ..write(obj.restaurant);
//   }
//
//   @override
//   int get hashCode => typeId.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is RestaurantModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
//
// class RestaurantAdapter extends TypeAdapter<Restaurant> {
//   @override
//   final int typeId = 1;
//
//   @override
//   Restaurant read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Restaurant(
//       id: fields[0] as int,
//       userId: fields[1] as int,
//       name: fields[2] as String,
//       descriptionEn: fields[3] as String,
//       descriptionTr: fields[15] as String,
//       operatingDays: (fields[4] as List).cast<int>(),
//       availabilityStarts: fields[5] as String,
//       availabilityEnds: fields[6] as String,
//       image: fields[7] as String,
//       priceRange: fields[8] as String,
//       createdAt: fields[9] as String,
//       updatedAt: fields[10] as String,
//       deletedAt: fields[11] as Null,
//       openDays: (fields[12] as List).cast<OpenDays>(),
//       menus: (fields[13] as List).cast<MenusCat>(),
//       contact: fields[14] as Contact,
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, Restaurant obj) {
//     writer
//       ..writeByte(16)
//       ..writeByte(0)
//       ..write(obj.id)
//       ..writeByte(1)
//       ..write(obj.userId)
//       ..writeByte(2)
//       ..write(obj.name)
//       ..writeByte(3)
//       ..write(obj.descriptionEn)
//       ..writeByte(4)
//       ..write(obj.operatingDays)
//       ..writeByte(5)
//       ..write(obj.availabilityStarts)
//       ..writeByte(6)
//       ..write(obj.availabilityEnds)
//       ..writeByte(7)
//       ..write(obj.image)
//       ..writeByte(8)
//       ..write(obj.priceRange)
//       ..writeByte(9)
//       ..write(obj.createdAt)
//       ..writeByte(10)
//       ..write(obj.updatedAt)
//       ..writeByte(11)
//       ..write(obj.deletedAt)
//       ..writeByte(12)
//       ..write(obj.openDays)
//       ..writeByte(13)
//       ..write(obj.menus)
//       ..writeByte(14)
//       ..write(obj.contact)
//       ..writeByte(15)
//       ..write(obj.descriptionTr);
//   }
//
//   @override
//   int get hashCode => typeId.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is RestaurantAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
