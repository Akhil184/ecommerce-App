class sub {
  late List<Subcategory> subcategory;

  sub({required this.subcategory});

  sub.fromJson(Map<String, dynamic> json) {
    if (json['subcategory'] != null) {
      subcategory = <Subcategory>[];
      json['subcategory'].forEach((v) {
        subcategory.add(new Subcategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategory {
  late String subcategoryId;
  late String name;
  late String img;

  Subcategory({required this.subcategoryId, required this.name, required this.img});

  Subcategory.fromJson(Map<String, dynamic> json) {
    subcategoryId = json['subcategory_id'];
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subcategory_id'] = this.subcategoryId;
    data['name'] = this.name;
    data['img'] = this.img;
    return data;
  }
}