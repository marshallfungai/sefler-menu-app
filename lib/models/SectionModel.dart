class CategoryModel {
  int id;
  List<Menu> menu;
  String nameEn;
  String nameTr;
  String descriptionEn;
  String descriptionTr;
  String image;

  CategoryModel({this.id, this.menu, this.nameEn, this.nameTr, this.descriptionEn, this.descriptionTr, this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['menu'] != null) {
      menu = new List<Menu>();
      json['menu'].forEach((v) { menu.add(new Menu.fromJson(v)); });
    }
    nameEn = json['name_en'];
    nameTr = json['name_tr'];
    descriptionEn = json['description_en'];
    descriptionTr = json['description_tr'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.menu != null) {
      data['menu'] = this.menu.map((v) => v.toJson()).toList();
    }
    data['name_en'] = this.nameEn;
    data['name_tr'] = this.nameTr;
    data['description_en'] = this.descriptionEn;
    data['description_tr'] = this.descriptionTr;
    data['image'] = this.image;
    return data;
  }
}
class Menu {
  int id;
  String restaurant;
  String nameEn;
  String nameTr;
  String descriptionEn;
  String descriptionTr;
  String availabilityStarts;
  String availabilityEnds;
  String image;
  String priceRange;

  Menu(
      {this.id,
        this.restaurant,
        this.nameEn,
        this.nameTr,
        this.descriptionEn,
        this.descriptionTr,
        this.availabilityStarts,
        this.availabilityEnds,
        this.image,
        this.priceRange});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurant = json['restaurant'];
    nameEn = json['name_en'];
    nameTr = json['name_tr'];
    descriptionEn = json['description_en'];
    descriptionTr = json['description_tr'];
    availabilityStarts = json['availability_starts'];
    availabilityEnds = json['availability_ends'];
    image = json['image'];
    priceRange = json['price_range'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['restaurant'] = this.restaurant;
    data['name_en'] = this.nameEn;
    data['name_tr'] = this.nameTr;
    data['description_en'] = this.descriptionEn;
    data['description_tr'] = this.descriptionTr;
    data['availability_starts'] = this.availabilityStarts;
    data['availability_ends'] = this.availabilityEnds;
    data['image'] = this.image;
    data['price_range'] = this.priceRange;
    return data;
  }
}