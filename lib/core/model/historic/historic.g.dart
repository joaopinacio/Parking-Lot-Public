// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historic.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member

extension GetHistoricCollection on Isar {
  IsarCollection<Historic> get historics {
    return getCollection('Historic');
  }
}

final HistoricSchema = CollectionSchema(
  name: 'Historic',
  schema:
      '{"name":"Historic","properties":[{"name":"busyTime","type":"String"},{"name":"date","type":"String"},{"name":"dtInsert","type":"String"},{"name":"status","type":"String"}],"indexes":[],"links":[{"name":"parkingLot","target":"ParkingLot"},{"name":"parkingSpot","target":"ParkingSpot"},{"name":"vehicle","target":"Vehicle"}]}',
  adapter: const _HistoricAdapter(),
  idName: 'id',
  propertyIds: {'busyTime': 0, 'date': 1, 'dtInsert': 2, 'status': 3},
  indexIds: {},
  indexTypes: {},
  linkIds: {'parkingLot': 0, 'parkingSpot': 1, 'vehicle': 2},
  backlinkIds: {},
  linkedCollections: ['ParkingLot', 'ParkingSpot', 'Vehicle'],
  getId: (obj) => obj.id,
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [obj.parkingLot, obj.parkingSpot, obj.vehicle],
  version: 0,
);

class _HistoricAdapter extends IsarTypeAdapter<Historic> {
  const _HistoricAdapter();

  @override
  int serialize(IsarCollection<Historic> collection, IsarRawObject rawObj,
      Historic object, List<int> offsets,
      [int? existingBufferSize]) {
    rawObj.id = object.id ?? Isar.autoIncrement;
    var dynamicSize = 0;
    final value0 = object.busyTime;
    IsarUint8List? _busyTime;
    if (value0 != null) {
      _busyTime = BinaryWriter.utf8Encoder.convert(value0);
    }
    dynamicSize += _busyTime?.length ?? 0;
    final value1 = object.date;
    final _date = BinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += _date.length;
    final value2 = object.dtInsert;
    final _dtInsert = BinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += _dtInsert.length;
    final value3 = object.status;
    final _status = BinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += _status.length;
    final size = dynamicSize + 34;

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
    final writer = BinaryWriter(buffer, 34);
    writer.writeBytes(offsets[0], _busyTime);
    writer.writeBytes(offsets[1], _date);
    writer.writeBytes(offsets[2], _dtInsert);
    writer.writeBytes(offsets[3], _status);
    attachLinks(collection.isar, object);
    return bufferSize;
  }

  @override
  Historic deserialize(IsarCollection<Historic> collection, int id,
      BinaryReader reader, List<int> offsets) {
    final object = Historic();
    object.busyTime = reader.readStringOrNull(offsets[0]);
    object.date = reader.readString(offsets[1]);
    object.dtInsert = reader.readString(offsets[2]);
    object.id = id;
    object.status = reader.readString(offsets[3]);
    attachLinks(collection.isar, object);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, BinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readStringOrNull(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readString(offset)) as P;
      case 3:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  void attachLinks(Isar isar, Historic object) {
    object.parkingLot.attach(
      isar.historics,
      isar.getCollection<ParkingLot>("ParkingLot"),
      object,
      "parkingLot",
      false,
    );
    object.parkingSpot.attach(
      isar.historics,
      isar.getCollection<ParkingSpot>("ParkingSpot"),
      object,
      "parkingSpot",
      false,
    );
    object.vehicle.attach(
      isar.historics,
      isar.getCollection<Vehicle>("Vehicle"),
      object,
      "vehicle",
      false,
    );
  }
}

extension HistoricQueryWhereSort on QueryBuilder<Historic, Historic, QWhere> {
  QueryBuilder<Historic, Historic, QAfterWhere> anyId() {
    return addWhereClause(const WhereClause(indexName: null));
  }
}

extension HistoricQueryWhere on QueryBuilder<Historic, Historic, QWhereClause> {
  QueryBuilder<Historic, Historic, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClause(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterWhereClause> idNotEqualTo(int? id) {
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

  QueryBuilder<Historic, Historic, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClause(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClause(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterWhereClause> idBetween(
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

extension HistoricQueryFilter
    on QueryBuilder<Historic, Historic, QFilterCondition> {
  QueryBuilder<Historic, Historic, QAfterFilterCondition> busyTimeIsNull() {
    return addFilterCondition(FilterCondition(
      type: ConditionType.isNull,
      property: 'busyTime',
      value: null,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> busyTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'busyTime',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> busyTimeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'busyTime',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> busyTimeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'busyTime',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> busyTimeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'busyTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> busyTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'busyTime',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> busyTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'busyTime',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> busyTimeContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'busyTime',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> busyTimeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'busyTime',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> dateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'date',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> dateGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'date',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> dateLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'date',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> dateBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'date',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'date',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'date',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> dateContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'date',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> dateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'date',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> dtInsertEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'dtInsert',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> dtInsertGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'dtInsert',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> dtInsertLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'dtInsert',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> dtInsertBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'dtInsert',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> dtInsertStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'dtInsert',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> dtInsertEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'dtInsert',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> dtInsertContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'dtInsert',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> dtInsertMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'dtInsert',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> idIsNull() {
    return addFilterCondition(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> idEqualTo(
      int? value) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Historic, Historic, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Historic, Historic, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Historic, Historic, QAfterFilterCondition> statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> statusGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> statusLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> statusBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'status',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Historic, Historic, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'status',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension HistoricQueryWhereSortBy
    on QueryBuilder<Historic, Historic, QSortBy> {
  QueryBuilder<Historic, Historic, QAfterSortBy> sortByBusyTime() {
    return addSortByInternal('busyTime', Sort.asc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> sortByBusyTimeDesc() {
    return addSortByInternal('busyTime', Sort.desc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> sortByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> sortByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> sortByDtInsert() {
    return addSortByInternal('dtInsert', Sort.asc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> sortByDtInsertDesc() {
    return addSortByInternal('dtInsert', Sort.desc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> sortByStatus() {
    return addSortByInternal('status', Sort.asc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> sortByStatusDesc() {
    return addSortByInternal('status', Sort.desc);
  }
}

extension HistoricQueryWhereSortThenBy
    on QueryBuilder<Historic, Historic, QSortThenBy> {
  QueryBuilder<Historic, Historic, QAfterSortBy> thenByBusyTime() {
    return addSortByInternal('busyTime', Sort.asc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> thenByBusyTimeDesc() {
    return addSortByInternal('busyTime', Sort.desc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> thenByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> thenByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> thenByDtInsert() {
    return addSortByInternal('dtInsert', Sort.asc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> thenByDtInsertDesc() {
    return addSortByInternal('dtInsert', Sort.desc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> thenByStatus() {
    return addSortByInternal('status', Sort.asc);
  }

  QueryBuilder<Historic, Historic, QAfterSortBy> thenByStatusDesc() {
    return addSortByInternal('status', Sort.desc);
  }
}

extension HistoricQueryWhereDistinct
    on QueryBuilder<Historic, Historic, QDistinct> {
  QueryBuilder<Historic, Historic, QDistinct> distinctByBusyTime(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('busyTime', caseSensitive: caseSensitive);
  }

  QueryBuilder<Historic, Historic, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('date', caseSensitive: caseSensitive);
  }

  QueryBuilder<Historic, Historic, QDistinct> distinctByDtInsert(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('dtInsert', caseSensitive: caseSensitive);
  }

  QueryBuilder<Historic, Historic, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Historic, Historic, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('status', caseSensitive: caseSensitive);
  }
}

extension HistoricQueryProperty
    on QueryBuilder<Historic, Historic, QQueryProperty> {
  QueryBuilder<Historic, String?, QQueryOperations> busyTimeProperty() {
    return addPropertyName('busyTime');
  }

  QueryBuilder<Historic, String, QQueryOperations> dateProperty() {
    return addPropertyName('date');
  }

  QueryBuilder<Historic, String, QQueryOperations> dtInsertProperty() {
    return addPropertyName('dtInsert');
  }

  QueryBuilder<Historic, int?, QQueryOperations> idProperty() {
    return addPropertyName('id');
  }

  QueryBuilder<Historic, String, QQueryOperations> statusProperty() {
    return addPropertyName('status');
  }
}
