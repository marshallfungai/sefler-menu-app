// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'MenusModel.dart';
//
// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************
//
// class MenusCatAdapter extends TypeAdapter<MenusCat> {
//   @override
//   final int typeId = 3;
//
//   @override
//   MenusCat read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return MenusCat(
//       id: fields[0] as int,
//       restaurantId: fields[1] as int,
//       nameEn: fields[2] as String,
//       nameTr: fields[3] as String,
//       descriptionEn: fields[4] as String,
//       descriptionTr: fields[15] as String,
//       availabilityStarts: fields[5] as String,
//       availabilityEnds: fields[6] as String,
//       image: fields[7] as String,
//       priceRange: fields[8] as String,
//       deletedAt: fields[9] as Null,
//       createdAt: fields[10] as String,
//       updatedAt: fields[11] as String,
//       description: fields[12] as String,
//       name: fields[13] as String,
//       items: (fields[14] as List).cast<Items>(),
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, MenusCat obj) {
//     writer
//       ..writeByte(16)
//       ..writeByte(0)
//       ..write(obj.id)
//       ..writeByte(1)
//       ..write(obj.restaurantId)
//       ..writeByte(2)
//       ..write(obj.nameEn)
//       ..writeByte(3)
//       ..write(obj.nameTr)
//       ..writeByte(4)
//       ..write(obj.descriptionEn)
//       ..writeByte(5)
//       ..write(obj.availabilityStarts)
//       ..writeByte(6)
//       ..write(obj.availabilityEnds)
//       ..writeByte(7)
//       ..write(obj.image)
//       ..writeByte(8)
//       ..write(obj.priceRange)
//       ..writeByte(9)
//       ..write(obj.deletedAt)
//       ..writeByte(10)
//       ..write(obj.createdAt)
//       ..writeByte(11)
//       ..write(obj.updatedAt)
//       ..writeByte(12)
//       ..write(obj.description)
//       ..writeByte(13)
//       ..write(obj.name)
//       ..writeByte(14)
//       ..write(obj.items)
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
//       other is MenusCatAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
