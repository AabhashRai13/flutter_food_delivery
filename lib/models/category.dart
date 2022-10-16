class CategoryId {
  final String categoryId;
  final Name name;

  CategoryId({required this.categoryId, required this.name});
}

class Name {
  final String name;

  Name({required this.name});

  Name.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
