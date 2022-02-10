// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_lot.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member

extension GetParkingLotCollection on Isar {
  IsarCollection<ParkingLot> get parkingLots {
    return getCollection('ParkingLot');
  }
}

final ParkingLotSchema = CollectionSchema(
  name: 'ParkingLot',
  schema:
      '{"name":"ParkingLot","properties":[{"name":"name","type":"String"}],"indexes":[],"links":[]}',
  adapter: const _ParkingLotAdapter(),
  idName: 'id',
  propertyIds: {'name': 0},
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

class _ParkingLotAdapter extends IsarTypeAdapter<ParkingLot> {
  const _ParkingLotAdapter();

  @override
  int serialize(IsarCollection<ParkingLot> collection, IsarRawObject rawObj,
      ParkingLot object, List<int> offsets,
      [int? existingBufferSize]) {
    rawObj.id = object.id ?? Isar.autoIncrement;
    var dynamicSize = 0;
    final value0 = object.name;
    final _name = BinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += _name.length;
    final size = dynamicSize + 10;

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
    final writer = BinaryWriter(buffer, 10);
    writer.writeBytes(offsets[0], _name);
    return bufferSize;
  }

  @override
  ParkingLot deserialize(IsarCollection<ParkingLot> collection, int id,
      BinaryReader reader, List<int> offsets) {
    final object = ParkingLot();
    object.id = id;
    object.name = reader.readString(offsets[0]);
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
      default:
        throw 'Illegal propertyIndex';
    }
  }
}

extension ParkingLotQueryWhereSort
    on QueryBuilder<ParkingLot, ParkingLot, QWhere> {
  QueryBuilder<ParkingLot, ParkingLot, QAfterWhere> anyId() {
    return addWhereClause(const WhereClause(indexName: null));
  }
}

extension ParkingLotQueryWhere
    on QueryBuilder<ParkingLot, ParkingLot, QWhereClause> {
  QueryBuilder<ParkingLot, ParkingLot, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClause(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterWhereClause> idNotEqualTo(
      int? id) {
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

  QueryBuilder<ParkingLot, ParkingLot, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClause(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClause(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterWhereClause> idBetween(
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

extension ParkingLotQueryFilter
    on QueryBuilder<ParkingLot, ParkingLot, QFilterCondition> {
  QueryBuilder<ParkingLot, ParkingLot, QAfterFilterCondition> idIsNull() {
    return addFilterCondition(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterFilterCondition> idEqualTo(
      int? value) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ParkingLot, ParkingLot, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ParkingLot, ParkingLot, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ParkingLot, ParkingLot, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension ParkingLotQueryWhereSortBy
    on QueryBuilder<ParkingLot, ParkingLot, QSortBy> {
  QueryBuilder<ParkingLot, ParkingLot, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension ParkingLotQueryWhereSortThenBy
    on QueryBuilder<ParkingLot, ParkingLot, QSortThenBy> {
  QueryBuilder<ParkingLot, ParkingLot, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<ParkingLot, ParkingLot, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension ParkingLotQueryWhereDistinct
    on QueryBuilder<ParkingLot, ParkingLot, QDistinct> {
  QueryBuilder<ParkingLot, ParkingLot, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<ParkingLot, ParkingLot, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }
}

extension ParkingLotQueryProperty
    on QueryBuilder<ParkingLot, ParkingLot, QQueryProperty> {
  QueryBuilder<ParkingLot, int?, QQueryOperations> idProperty() {
    return addPropertyName('id');
  }

  QueryBuilder<ParkingLot, String, QQueryOperations> nameProperty() {
    return addPropertyName('name');
  }
}
