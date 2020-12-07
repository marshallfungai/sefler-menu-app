import 'package:hive/hive.dart';



part 'ContactModel.g.dart';

@HiveType(typeId : 5)
class Contact {
  @HiveField(0)
  int id;
  @HiveField(1)
  int restaurantId;
  @HiveField(2)
  String addressLine1;
  @HiveField(3)
  String city;
  @HiveField(4)
  String whatsappNumber;
  @HiveField(5)
  String officeNumber;
  @HiveField(6)
  String mobileNumber;
  @HiveField(7)
  String emailAddress;
  @HiveField(8)
  String createdAt;
  @HiveField(9)
  String updatedAt;
  @HiveField(10)
  Null deletedAt;

  Contact(
      {this.id,
        this.restaurantId,
        this.addressLine1,
        this.city,
        this.whatsappNumber,
        this.officeNumber,
        this.mobileNumber,
        this.emailAddress,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantId = json['restaurant_id'];
    addressLine1 = json['address_line_1'];
    city = json['city'];
    whatsappNumber = json['whatsapp_number'];
    officeNumber = json['office_number'];
    mobileNumber = json['mobile_number'];
    emailAddress = json['email_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['restaurant_id'] = this.restaurantId;
    data['address_line_1'] = this.addressLine1;
    data['city'] = this.city;
    data['whatsapp_number'] = this.whatsappNumber;
    data['office_number'] = this.officeNumber;
    data['mobile_number'] = this.mobileNumber;
    data['email_address'] = this.emailAddress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}