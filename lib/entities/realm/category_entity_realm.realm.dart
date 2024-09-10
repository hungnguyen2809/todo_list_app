// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entity_realm.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CategoryEntityRealm extends _CategoryEntityRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  CategoryEntityRealm(
    ObjectId id,
    String name, {
    String? color,
    String? iconColor,
    int? iconCodePoint,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'color', color);
    RealmObjectBase.set(this, 'iconColor', iconColor);
    RealmObjectBase.set(this, 'iconCodePoint', iconCodePoint);
  }

  CategoryEntityRealm._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get color => RealmObjectBase.get<String>(this, 'color') as String?;
  @override
  set color(String? value) => RealmObjectBase.set(this, 'color', value);

  @override
  String? get iconColor =>
      RealmObjectBase.get<String>(this, 'iconColor') as String?;
  @override
  set iconColor(String? value) => RealmObjectBase.set(this, 'iconColor', value);

  @override
  int? get iconCodePoint =>
      RealmObjectBase.get<int>(this, 'iconCodePoint') as int?;
  @override
  set iconCodePoint(int? value) =>
      RealmObjectBase.set(this, 'iconCodePoint', value);

  @override
  Stream<RealmObjectChanges<CategoryEntityRealm>> get changes =>
      RealmObjectBase.getChanges<CategoryEntityRealm>(this);

  @override
  Stream<RealmObjectChanges<CategoryEntityRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<CategoryEntityRealm>(this, keyPaths);

  @override
  CategoryEntityRealm freeze() =>
      RealmObjectBase.freezeObject<CategoryEntityRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'color': color.toEJson(),
      'iconColor': iconColor.toEJson(),
      'iconCodePoint': iconCodePoint.toEJson(),
    };
  }

  static EJsonValue _toEJson(CategoryEntityRealm value) => value.toEJson();
  static CategoryEntityRealm _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
      } =>
        CategoryEntityRealm(
          fromEJson(id),
          fromEJson(name),
          color: fromEJson(ejson['color']),
          iconColor: fromEJson(ejson['iconColor']),
          iconCodePoint: fromEJson(ejson['iconCodePoint']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(CategoryEntityRealm._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, CategoryEntityRealm, 'CategoryEntityRealm', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('color', RealmPropertyType.string, optional: true),
      SchemaProperty('iconColor', RealmPropertyType.string, optional: true),
      SchemaProperty('iconCodePoint', RealmPropertyType.int, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
