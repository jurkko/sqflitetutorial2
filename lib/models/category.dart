class Category {
  int id;
  String name;

  Category({
    this.id,
    this.name,
  });

  Category.fromMap(dynamic obj) {
    this.id = obj['categoryId'];
    this.name = obj['categoryName'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'categoryName': name,
    };

    return map;
  }
}
