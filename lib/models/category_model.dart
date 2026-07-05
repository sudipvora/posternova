class CategoryModel {
  final String id;
  final String name;
  final bool active;

  CategoryModel({
    required this.id,
    required this.name,
    required this.active,
  });

  factory CategoryModel.fromFirestore(
    String id,
    Map data,
  ) {
    return CategoryModel(
      id: id,
      name: data['name'] ?? '',
      active: data['active'] ?? true,
    );
  }
}
