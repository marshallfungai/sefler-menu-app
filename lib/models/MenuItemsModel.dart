import 'package:hive/hive.dart';


part 'MenuItemsModel.g.dart';

@HiveType(typeId : 4)
class Items {
  @HiveField(0)
  int id;
  @HiveField(1)
  int menuId;
  @HiveField(2)
  String nameEn;
  @HiveField(3)
  String nameTr;
  @HiveField(4)
  String descriptionEn;
  @HiveField(5)
  String descriptionTr;
  @HiveField(6)
  String preparationTime;
  @HiveField(7)
  String price;
  @HiveField(8)
  String priceCurrency;
  @HiveField(9)
  String availabilityStarts;
  @HiveField(10)
  String availabilityEnds;
  @HiveField(11)
  String image;
  @HiveField(12)
  String createdAt;
  @HiveField(13)
  String updatedAt;
  @HiveField(14)
  Null deletedAt;
  @HiveField(15)
  String description;
  @HiveField(16)
  String name;

  Items(
      {this.id,
        this.menuId,
        this.nameEn,
        this.nameTr,
        this.descriptionEn,
        this.descriptionTr,
        this.preparationTime,
        this.price,
        this.priceCurrency,
        this.availabilityStarts,
        this.availabilityEnds,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.description,
        this.name});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menuId = json['menu_id'];
    nameEn = json['name_en'];
    nameTr = json['name_tr'];
    descriptionEn = json['description_en'];
    descriptionTr = json['description_tr'];
    preparationTime = json['preparation_time'];
    price = json['price'];
    priceCurrency = json['price_currency'];
    availabilityStarts = json['availability_starts'];
    availabilityEnds = json['availability_ends'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    description = json['description'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['menu_id'] = this.menuId;
    data['name_en'] = this.nameEn;
    data['name_tr'] = this.nameTr;
    data['description_en'] = this.descriptionEn;
    data['description_tr'] = this.descriptionTr;
    data['preparation_time'] = this.preparationTime;
    data['price'] = this.price;
    data['price_currency'] = this.priceCurrency;
    data['availability_starts'] = this.availabilityStarts;
    data['availability_ends'] = this.availabilityEnds;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['description'] = this.description;
    data['name'] = this.name;
    return data;
  }
}