class CategoryModel {
  String id;
  String name;
  String? bgColor;
  String? iconColor;
  int? iconCodePoint;

  CategoryModel({
    required this.id,
    required this.name,
    this.bgColor,
    this.iconColor,
    this.iconCodePoint,
  });
}
