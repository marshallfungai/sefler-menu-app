// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'OpenDaysModel.dart';
//
// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************
//
// class OpenDaysAdapter extends TypeAdapter<OpenDays> {
//   @override
//   final int typeId = 2;
//
//   @override
//   OpenDays read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return OpenDays(
//       id: fields[0] as int,
//       nameEn: fields[1] as String,
//       nameTr: fields[2] as String,
//       createdAt: fields[3] as String,
//       updatedAt: fields[4] as String,
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, OpenDays obj) {
//     writer
//       ..writeByte(5)
//       ..writeByte(0)
//       ..write(obj.id)
//       ..writeByte(1)
//       ..write(obj.nameEn)
//       ..writeByte(2)
//       ..write(obj.nameTr)
//       ..writeByte(3)
//       ..write(obj.createdAt)
//       ..writeByte(4)
//       ..write(obj.updatedAt);
//   }
//
//   @override
//   int get hashCode => typeId.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is OpenDaysAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
