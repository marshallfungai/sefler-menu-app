// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'MenuItemsModel.dart';
//
// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************
//
// class ItemsAdapter extends TypeAdapter<Items> {
//   @override
//   final int typeId = 4;
//
//   @override
//   Items read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Items(
//       id: fields[0] as int,
//       menuId: fields[1] as int,
//       nameEn: fields[2] as String,
//       nameTr: fields[3] as String,
//       descriptionEn: fields[4] as String,
//       descriptionTr: fields[5] as String,
//       preparationTime: fields[6] as String,
//       price: fields[7] as String,
//       priceCurrency: fields[8] as String,
//       availabilityStarts: fields[9] as String,
//       availabilityEnds: fields[10] as String,
//       image: fields[11] as String,
//       createdAt: fields[12] as String,
//       updatedAt: fields[13] as String,
//       deletedAt: fields[14] as Null,
//       description: fields[15] as String,
//       name: fields[16] as String,
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, Items obj) {
//     writer
//       ..writeByte(17)
//       ..writeByte(0)
//       ..write(obj.id)
//       ..writeByte(1)
//       ..write(obj.menuId)
//       ..writeByte(2)
//       ..write(obj.nameEn)
//       ..writeByte(3)
//       ..write(obj.nameTr)
//       ..writeByte(4)
//       ..write(obj.descriptionEn)
//       ..writeByte(5)
//       ..write(obj.descriptionTr)
//       ..writeByte(6)
//       ..write(obj.preparationTime)
//       ..writeByte(7)
//       ..write(obj.price)
//       ..writeByte(8)
//       ..write(obj.priceCurrency)
//       ..writeByte(9)
//       ..write(obj.availabilityStarts)
//       ..writeByte(10)
//       ..write(obj.availabilityEnds)
//       ..writeByte(11)
//       ..write(obj.image)
//       ..writeByte(12)
//       ..write(obj.createdAt)
//       ..writeByte(13)
//       ..write(obj.updatedAt)
//       ..writeByte(14)
//       ..write(obj.deletedAt)
//       ..writeByte(15)
//       ..write(obj.description)
//       ..writeByte(16)
//       ..write(obj.name);
//   }
//
//   @override
//   int get hashCode => typeId.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ItemsAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
