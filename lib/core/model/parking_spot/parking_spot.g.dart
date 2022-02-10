// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_spot.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member

extension GetParkingSpotCollection on Isar {
  IsarCollection<ParkingSpot> get parkingSpots {
    return getCollection('ParkingSpot');
  }
}

final ParkingSpotSchema = CollectionSchema(
  name: 'ParkingSpot',
  schema:
      '{"name":"ParkingSpot","properties":[{"name":"code","type":"String"},{"name":"dtInsert","type":"String"},{"name":"dtVehicleArrived","type":"String"},{"name":"status","type":"String"},{"name":"time","type":"String"}],"indexes":[],"links":[{"name":"parkingLot","target":"ParkingLot"},{"name":"vehicle","target":"Vehicle"}]}',
  adapter: const _ParkingSpotAdapter(),
  idName: 'id',
  propertyIds: {
    'code': 0,
    'dtInsert': 1,
    'dtVehicleArrived': 2,
    'status': 3,
    'time': 4
  },
  indexIds: {},
  indexTypes: {},
  linkIds: {'parkingLot': 0, 'vehicle': 1},
  backlinkIds: {},
  linkedCollections: ['ParkingLot', 'Vehicle'],
  getId: (obj) => obj.id,
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [obj.parkingLot, obj.vehicle],
  version: 0,
);

class _ParkingSpotAdapter extends IsarTypeAdapter<ParkingSpot> {
  const _ParkingSpotAdapter();

  @override
  int serialize(IsarCollection<ParkingSpot> collection, IsarRawObject rawObj,
      ParkingSpot object, List<int> offsets,
      [int? existingBufferSize]) {
    rawObj.id = object.id ?? Isar.autoIncrement;
    var dynamicSize = 0;
    final value0 = object.code;
    final _code = BinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += _code.length;
    final value1 = object.dtInsert;
    final _dtInsert = BinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += _dtInsert.length;
    final value2 = object.dtVehicleArrived;
    IsarUint8List? _dtVehicleArrived;
    if (value2 != null) {
      _dtVehicleArrived = BinaryWriter.utf8Encoder.convert(value2);
    }
    dynamicSize += _dtVehicleArrived?.length ?? 0;
    final value3 = object.status;
    final _status = BinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += _status.length;
    final value4 = object.time;
    IsarUint8List? _time;
    if (value4 != null) {
      _time = BinaryWriter.utf8Encoder.convert(value4);
    }
    dynamicSize += _time?.length ?? 0;
    final size = dynamicSize + 42;

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
    final writer = BinaryWriter(buffer, 42);
    writer.writeBytes(offsets[0], _code);
    writer.writeBytes(offsets[1], _dtInsert);
    writer.writeBytes(offsets[2], _dtVehicleArrived);
    writer.writeBytes(offsets[3], _status);
    writer.writeBytes(offsets[4], _time);
    attachLinks(collection.isar, object);
    return bufferSize;
  }

  @override
  ParkingSpot deserialize(IsarCollection<ParkingSpot> collection, int id,
      BinaryReader reader, List<int> offsets) {
    final object = ParkingSpot();
    object.code = reader.readString(offsets[0]);
    object.dtInsert = reader.readString(offsets[1]);
    object.dtVehicleArrived = reader.readStringOrNull(offsets[2]);
    object.id = id;
    object.status = reader.readString(offsets[3]);
    object.time = reader.readStringOrNull(offsets[4]);
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
        return (reader.readString(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readStringOrNull(offset)) as P;
      case 3:
        return (reader.readString(offset)) as P;
      case 4:
        return (reader.readStringOrNull(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  void attachLinks(Isar isar, ParkingSpot object) {
    object.parkingLot.attach(
      isar.parkingSpots,
      isar.getCollection<ParkingLot>("ParkingLot"),
      object,
      "parkingLot",
      false,
    );
    object.vehicle.attach(
      isar.parkingSpots,
      isar.getCollection<Vehicle>("Vehicle"),
      object,
      "vehicle",
      false,
    );
  }
}

extension ParkingSpotQueryWhereSort
    on QueryBuilder<ParkingSpot, ParkingSpot, QWhere> {
  QueryBuilder<ParkingSpot, ParkingSpot, QAfterWhere> anyId() {
    return addWhereClause(const WhereClause(indexName: null));
  }
}

extension ParkingSpotQueryWhere
    on QueryBuilder<ParkingSpot, ParkingSpot, QWhereClause> {
  QueryBuilder<ParkingSpot, ParkingSpot, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClause(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClause(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClause(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterWhereClause> idBetween(
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

extension ParkingSpotQueryFilter
    on QueryBuilder<ParkingSpot, ParkingSpot, QFilterCondition> {
  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> codeGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> codeLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> codeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'code',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> codeContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> codeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'code',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> dtInsertEqualTo(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      dtInsertGreaterThan(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      dtInsertLessThan(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> dtInsertBetween(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      dtInsertStartsWith(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      dtInsertEndsWith(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      dtInsertContains(String value, {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'dtInsert',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> dtInsertMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'dtInsert',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      dtVehicleArrivedIsNull() {
    return addFilterCondition(FilterCondition(
      type: ConditionType.isNull,
      property: 'dtVehicleArrived',
      value: null,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      dtVehicleArrivedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'dtVehicleArrived',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      dtVehicleArrivedGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'dtVehicleArrived',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      dtVehicleArrivedLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'dtVehicleArrived',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      dtVehicleArrivedBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'dtVehicleArrived',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      dtVehicleArrivedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'dtVehicleArrived',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      dtVehicleArrivedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'dtVehicleArrived',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      dtVehicleArrivedContains(String value, {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'dtVehicleArrived',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      dtVehicleArrivedMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'dtVehicleArrived',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> idIsNull() {
    return addFilterCondition(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> idEqualTo(
      int? value) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      statusGreaterThan(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      statusStartsWith(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'status',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> timeIsNull() {
    return addFilterCondition(FilterCondition(
      type: ConditionType.isNull,
      property: 'time',
      value: null,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> timeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'time',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> timeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'time',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> timeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'time',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> timeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'time',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> timeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'time',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> timeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'time',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> timeContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'time',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> timeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'time',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension ParkingSpotQueryWhereSortBy
    on QueryBuilder<ParkingSpot, ParkingSpot, QSortBy> {
  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> sortByCode() {
    return addSortByInternal('code', Sort.asc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> sortByCodeDesc() {
    return addSortByInternal('code', Sort.desc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> sortByDtInsert() {
    return addSortByInternal('dtInsert', Sort.asc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> sortByDtInsertDesc() {
    return addSortByInternal('dtInsert', Sort.desc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy>
      sortByDtVehicleArrived() {
    return addSortByInternal('dtVehicleArrived', Sort.asc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy>
      sortByDtVehicleArrivedDesc() {
    return addSortByInternal('dtVehicleArrived', Sort.desc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> sortByStatus() {
    return addSortByInternal('status', Sort.asc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> sortByStatusDesc() {
    return addSortByInternal('status', Sort.desc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> sortByTime() {
    return addSortByInternal('time', Sort.asc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> sortByTimeDesc() {
    return addSortByInternal('time', Sort.desc);
  }
}

extension ParkingSpotQueryWhereSortThenBy
    on QueryBuilder<ParkingSpot, ParkingSpot, QSortThenBy> {
  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> thenByCode() {
    return addSortByInternal('code', Sort.asc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> thenByCodeDesc() {
    return addSortByInternal('code', Sort.desc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> thenByDtInsert() {
    return addSortByInternal('dtInsert', Sort.asc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> thenByDtInsertDesc() {
    return addSortByInternal('dtInsert', Sort.desc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy>
      thenByDtVehicleArrived() {
    return addSortByInternal('dtVehicleArrived', Sort.asc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy>
      thenByDtVehicleArrivedDesc() {
    return addSortByInternal('dtVehicleArrived', Sort.desc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> thenByStatus() {
    return addSortByInternal('status', Sort.asc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> thenByStatusDesc() {
    return addSortByInternal('status', Sort.desc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> thenByTime() {
    return addSortByInternal('time', Sort.asc);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> thenByTimeDesc() {
    return addSortByInternal('time', Sort.desc);
  }
}

extension ParkingSpotQueryWhereDistinct
    on QueryBuilder<ParkingSpot, ParkingSpot, QDistinct> {
  QueryBuilder<ParkingSpot, ParkingSpot, QDistinct> distinctByCode(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('code', caseSensitive: caseSensitive);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QDistinct> distinctByDtInsert(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('dtInsert', caseSensitive: caseSensitive);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QDistinct> distinctByDtVehicleArrived(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('dtVehicleArrived',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('status', caseSensitive: caseSensitive);
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QDistinct> distinctByTime(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('time', caseSensitive: caseSensitive);
  }
}

extension ParkingSpotQueryProperty
    on QueryBuilder<ParkingSpot, ParkingSpot, QQueryProperty> {
  QueryBuilder<ParkingSpot, String, QQueryOperations> codeProperty() {
    return addPropertyName('code');
  }

  QueryBuilder<ParkingSpot, String, QQueryOperations> dtInsertProperty() {
    return addPropertyName('dtInsert');
  }

  QueryBuilder<ParkingSpot, String?, QQueryOperations>
      dtVehicleArrivedProperty() {
    return addPropertyName('dtVehicleArrived');
  }

  QueryBuilder<ParkingSpot, int?, QQueryOperations> idProperty() {
    return addPropertyName('id');
  }

  QueryBuilder<ParkingSpot, String, QQueryOperations> statusProperty() {
    return addPropertyName('status');
  }

  QueryBuilder<ParkingSpot, String?, QQueryOperations> timeProperty() {
    return addPropertyName('time');
  }
}
