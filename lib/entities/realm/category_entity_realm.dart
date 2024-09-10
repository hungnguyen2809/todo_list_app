import 'package:realm/realm.dart';

part 'category_entity_realm.realm.dart';

@RealmModel()
class _CategoryEntityRealm {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late String? color;
  late String? iconColor;
  late int? iconCodePoint;
}
