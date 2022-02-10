// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member

extension GetVehicleCollection on Isar {
  IsarCollection<Vehicle> get vehicles {
    return getCollection('Vehicle');
  }
}

final VehicleSchema = CollectionSchema(
  name: 'Vehicle',
  schema:
      '{"name":"Vehicle","properties":[{"name":"nmOwner","type":"String"},{"name":"type","type":"String"},{"name":"uid","type":"String"}],"indexes":[],"links":[]}',
  adapter: const _VehicleAdapter(),
  idName: 'id',
  propertyIds: {'nmOwner': 0, 'type': 1, 'uid': 2},
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) => obj.id,
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 0,
);

class _VehicleAdapter extends IsarTypeAdapter<Vehicle> {
  const _VehicleAdapter();

  @override
  int serialize(IsarCollection<Vehicle> collection, IsarRawObject rawObj,
      Vehicle object, List<int> offsets,
      [int? existingBufferSize]) {
    rawObj.id = object.id ?? Isar.autoIncrement;
    var dynamicSize = 0;
    final value0 = object.nmOwner;
    final _nmOwner = BinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += _nmOwner.length;
    final value1 = object.type;
    final _type = BinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += _type.length;
    final value2 = object.uid;
    final _uid = BinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += _uid.length;
    final size = dynamicSize + 26;

    late int bufferSize;
    if (existingBufferSize != null) {
      if (existingBufferSize < size) {
        isarFree(rawObj.buffer);
        rawObj.buffer = isarMalloc(size);
        bufferSize = size;
      } else {
        bufferSize = existingBufferSize;
      }
    } else {
      rawObj.buffer = isarMalloc(size);
      bufferSize = size;
    }
    rawObj.buffer_length = size;
    final buffer = bufAsBytes(rawObj.buffer, size);
    final writer = BinaryWriter(buffer, 26);
    writer.writeBytes(offsets[0], _nmOwner);
    writer.writeBytes(offsets[1], _type);
    writer.writeBytes(offsets[2], _uid);
    return bufferSize;
  }

  @override
  Vehicle deserialize(IsarCollection<Vehicle> collection, int id,
      BinaryReader reader, List<int> offsets) {
    final object = Vehicle();
    object.id = id;
    object.nmOwner = reader.readString(offsets[0]);
    object.type = reader.readString(offsets[1]);
    object.uid = reader.readString(offsets[2]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, BinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readString(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }
}

extension VehicleQueryWhereSort on QueryBuilder<Vehicle, Vehicle, QWhere> {
  QueryBuilder<Vehicle, Vehicle, QAfterWhere> anyId() {
    return addWhereClause(const WhereClause(indexName: null));
  }
}

extension VehicleQueryWhere on QueryBuilder<Vehicle, Vehicle, QWhereClause> {
  QueryBuilder<Vehicle, Vehicle, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClause(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterWhereClause> idNotEqualTo(int? id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClause(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClause(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClause(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClause(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Vehicle, Vehicle, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClause(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClause(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterWhereClause> idBetween(
    int? lowerId,
    int? upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClause(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }
}

extension VehicleQueryFilter
    on QueryBuilder<Vehicle, Vehicle, QFilterCondition> {
  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> idIsNull() {
    return addFilterCondition(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> idEqualTo(int? value) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> nmOwnerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'nmOwner',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> nmOwnerGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nmOwner',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> nmOwnerLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nmOwner',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> nmOwnerBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'nmOwner',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> nmOwnerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'nmOwner',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> nmOwnerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'nmOwner',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> nmOwnerContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'nmOwner',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> nmOwnerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'nmOwner',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> typeGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> typeLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'type',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'type',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> uidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'uid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> uidGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'uid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> uidLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'uid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> uidBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'uid',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> uidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'uid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> uidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'uid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> uidContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'uid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehicle, Vehicle, QAfterFilterCondition> uidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'uid',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension VehicleQueryWhereSortBy on QueryBuilder<Vehicle, Vehicle, QSortBy> {
  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByNmOwner() {
    return addSortByInternal('nmOwner', Sort.asc);
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByNmOwnerDesc() {
    return addSortByInternal('nmOwner', Sort.desc);
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByUid() {
    return addSortByInternal('uid', Sort.asc);
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> sortByUidDesc() {
    return addSortByInternal('uid', Sort.desc);
  }
}

extension VehicleQueryWhereSortThenBy
    on QueryBuilder<Vehicle, Vehicle, QSortThenBy> {
  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByNmOwner() {
    return addSortByInternal('nmOwner', Sort.asc);
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByNmOwnerDesc() {
    return addSortByInternal('nmOwner', Sort.desc);
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByUid() {
    return addSortByInternal('uid', Sort.asc);
  }

  QueryBuilder<Vehicle, Vehicle, QAfterSortBy> thenByUidDesc() {
    return addSortByInternal('uid', Sort.desc);
  }
}

extension VehicleQueryWhereDistinct
    on QueryBuilder<Vehicle, Vehicle, QDistinct> {
  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByNmOwner(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('nmOwner', caseSensitive: caseSensitive);
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('type', caseSensitive: caseSensitive);
  }

  QueryBuilder<Vehicle, Vehicle, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('uid', caseSensitive: caseSensitive);
  }
}

extension VehicleQueryProperty
    on QueryBuilder<Vehicle, Vehicle, QQueryProperty> {
  QueryBuilder<Vehicle, int?, QQueryOperations> idProperty() {
    return addPropertyName('id');
  }

  QueryBuilder<Vehicle, String, QQueryOperations> nmOwnerProperty() {
    return addPropertyName('nmOwner');
  }

  QueryBuilder<Vehicle, String, QQueryOperations> typeProperty() {
    return addPropertyName('type');
  }

  QueryBuilder<Vehicle, String, QQueryOperations> uidProperty() {
    return addPropertyName('uid');
  }
}
