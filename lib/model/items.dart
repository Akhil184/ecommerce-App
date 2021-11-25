class categoryitems {
  late List<Category> category;

  categoryitems({
    required this.category
  });

  categoryitems.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
 late String categoryId;
  late String name;
 late String img;

  Category({
    required this.categoryId,
    required this.name,
    required this.img
  });

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['img'] = this.img;
    return data;
  }
}