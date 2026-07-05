class TemplateModel {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final bool premium;
  final bool active;

  TemplateModel({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.premium,
    required this.active,
  });

  factory TemplateModel.fromMap(
      String id, Map<String, dynamic> data) {
    return TemplateModel(
      id: id,
      title: data['title'] ?? '',
      category: data['category'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      premium: data['premium'] ?? false,
      active: data['active'] ?? true,
    );
  }
}