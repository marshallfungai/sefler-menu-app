// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ContactModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactAdapter extends TypeAdapter<Contact> {
  @override
  final int typeId = 5;

  @override
  Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Contact(
      id: fields[0] as int,
      restaurantId: fields[1] as int,
      addressLine1: fields[2] as String,
      city: fields[3] as String,
      whatsappNumber: fields[4] as String,
      officeNumber: fields[5] as String,
      mobileNumber: fields[6] as String,
      emailAddress: fields[7] as String,
      createdAt: fields[8] as String,
      updatedAt: fields[9] as String,
      deletedAt: fields[10] as Null,
    );
  }

  @override
  void write(BinaryWriter writer, Contact obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.restaurantId)
      ..writeByte(2)
      ..write(obj.addressLine1)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.whatsappNumber)
      ..writeByte(5)
      ..write(obj.officeNumber)
      ..writeByte(6)
      ..write(obj.mobileNumber)
      ..writeByte(7)
      ..write(obj.emailAddress)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.updatedAt)
      ..writeByte(10)
      ..write(obj.deletedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
