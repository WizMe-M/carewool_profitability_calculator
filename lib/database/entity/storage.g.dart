// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStorageUploadCollection on Isar {
  IsarCollection<StorageUpload> get storageUploads => this.collection();
}

const StorageUploadSchema = CollectionSchema(
  name: r'StorageUpload',
  id: 9173515174592646890,
  properties: {
    r'uploadTime': PropertySchema(
      id: 0,
      name: r'uploadTime',
      type: IsarType.dateTime,
    ),
    r'uploadedItems': PropertySchema(
      id: 1,
      name: r'uploadedItems',
      type: IsarType.objectList,
      target: r'Storage',
    )
  },
  estimateSize: _storageUploadEstimateSize,
  serialize: _storageUploadSerialize,
  deserialize: _storageUploadDeserialize,
  deserializeProp: _storageUploadDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Storage': StorageSchema, r'Tariff': TariffSchema},
  getId: _storageUploadGetId,
  getLinks: _storageUploadGetLinks,
  attach: _storageUploadAttach,
  version: '3.1.0+1',
);

int _storageUploadEstimateSize(
  StorageUpload object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.uploadedItems.length * 3;
  {
    final offsets = allOffsets[Storage]!;
    for (var i = 0; i < object.uploadedItems.length; i++) {
      final value = object.uploadedItems[i];
      bytesCount += StorageSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _storageUploadSerialize(
  StorageUpload object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.uploadTime);
  writer.writeObjectList<Storage>(
    offsets[1],
    allOffsets,
    StorageSchema.serialize,
    object.uploadedItems,
  );
}

StorageUpload _storageUploadDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StorageUpload();
  object.id = id;
  object.uploadTime = reader.readDateTimeOrNull(offsets[0]);
  object.uploadedItems = reader.readObjectList<Storage>(
        offsets[1],
        StorageSchema.deserialize,
        allOffsets,
        Storage(),
      ) ??
      [];
  return object;
}

P _storageUploadDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<Storage>(
            offset,
            StorageSchema.deserialize,
            allOffsets,
            Storage(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _storageUploadGetId(StorageUpload object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _storageUploadGetLinks(StorageUpload object) {
  return [];
}

void _storageUploadAttach(
    IsarCollection<dynamic> col, Id id, StorageUpload object) {
  object.id = id;
}

extension StorageUploadQueryWhereSort
    on QueryBuilder<StorageUpload, StorageUpload, QWhere> {
  QueryBuilder<StorageUpload, StorageUpload, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StorageUploadQueryWhere
    on QueryBuilder<StorageUpload, StorageUpload, QWhereClause> {
  QueryBuilder<StorageUpload, StorageUpload, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StorageUploadQueryFilter
    on QueryBuilder<StorageUpload, StorageUpload, QFilterCondition> {
  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      uploadTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uploadTime',
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      uploadTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uploadTime',
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      uploadTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uploadTime',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      uploadTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uploadTime',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      uploadTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uploadTime',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      uploadTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uploadTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      uploadedItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uploadedItems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      uploadedItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uploadedItems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      uploadedItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uploadedItems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      uploadedItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uploadedItems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      uploadedItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uploadedItems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      uploadedItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uploadedItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension StorageUploadQueryObject
    on QueryBuilder<StorageUpload, StorageUpload, QFilterCondition> {
  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      uploadedItemsElement(FilterQuery<Storage> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'uploadedItems');
    });
  }
}

extension StorageUploadQueryLinks
    on QueryBuilder<StorageUpload, StorageUpload, QFilterCondition> {}

extension StorageUploadQuerySortBy
    on QueryBuilder<StorageUpload, StorageUpload, QSortBy> {
  QueryBuilder<StorageUpload, StorageUpload, QAfterSortBy> sortByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.asc);
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterSortBy>
      sortByUploadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.desc);
    });
  }
}

extension StorageUploadQuerySortThenBy
    on QueryBuilder<StorageUpload, StorageUpload, QSortThenBy> {
  QueryBuilder<StorageUpload, StorageUpload, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterSortBy> thenByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.asc);
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterSortBy>
      thenByUploadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.desc);
    });
  }
}

extension StorageUploadQueryWhereDistinct
    on QueryBuilder<StorageUpload, StorageUpload, QDistinct> {
  QueryBuilder<StorageUpload, StorageUpload, QDistinct> distinctByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uploadTime');
    });
  }
}

extension StorageUploadQueryProperty
    on QueryBuilder<StorageUpload, StorageUpload, QQueryProperty> {
  QueryBuilder<StorageUpload, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StorageUpload, DateTime?, QQueryOperations>
      uploadTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploadTime');
    });
  }

  QueryBuilder<StorageUpload, List<Storage>, QQueryOperations>
      uploadedItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploadedItems');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const StorageSchema = Schema(
  name: r'Storage',
  id: 1211984339887552882,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'tariffs': PropertySchema(
      id: 1,
      name: r'tariffs',
      type: IsarType.objectList,
      target: r'Tariff',
    )
  },
  estimateSize: _storageEstimateSize,
  serialize: _storageSerialize,
  deserialize: _storageDeserialize,
  deserializeProp: _storageDeserializeProp,
);

int _storageEstimateSize(
  Storage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tariffs.length * 3;
  {
    final offsets = allOffsets[Tariff]!;
    for (var i = 0; i < object.tariffs.length; i++) {
      final value = object.tariffs[i];
      bytesCount += TariffSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _storageSerialize(
  Storage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeObjectList<Tariff>(
    offsets[1],
    allOffsets,
    TariffSchema.serialize,
    object.tariffs,
  );
}

Storage _storageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Storage();
  object.name = reader.readStringOrNull(offsets[0]);
  object.tariffs = reader.readObjectList<Tariff>(
        offsets[1],
        TariffSchema.deserialize,
        allOffsets,
        Tariff(),
      ) ??
      [];
  return object;
}

P _storageDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<Tariff>(
            offset,
            TariffSchema.deserialize,
            allOffsets,
            Tariff(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension StorageQueryFilter
    on QueryBuilder<Storage, Storage, QFilterCondition> {
  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> tariffsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tariffs',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> tariffsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tariffs',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> tariffsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tariffs',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> tariffsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tariffs',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition>
      tariffsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tariffs',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> tariffsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tariffs',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension StorageQueryObject
    on QueryBuilder<Storage, Storage, QFilterCondition> {
  QueryBuilder<Storage, Storage, QAfterFilterCondition> tariffsElement(
      FilterQuery<Tariff> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'tariffs');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TariffSchema = Schema(
  name: r'Tariff',
  id: 7950035533870099206,
  properties: {
    r'baseCost': PropertySchema(
      id: 0,
      name: r'baseCost',
      type: IsarType.double,
    ),
    r'costPerLiter': PropertySchema(
      id: 1,
      name: r'costPerLiter',
      type: IsarType.double,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _tariffEstimateSize,
  serialize: _tariffSerialize,
  deserialize: _tariffDeserialize,
  deserializeProp: _tariffDeserializeProp,
);

int _tariffEstimateSize(
  Tariff object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _tariffSerialize(
  Tariff object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.baseCost);
  writer.writeDouble(offsets[1], object.costPerLiter);
  writer.writeString(offsets[2], object.name);
}

Tariff _tariffDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Tariff();
  object.baseCost = reader.readDoubleOrNull(offsets[0]);
  object.costPerLiter = reader.readDoubleOrNull(offsets[1]);
  object.name = reader.readStringOrNull(offsets[2]);
  return object;
}

P _tariffDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TariffQueryFilter on QueryBuilder<Tariff, Tariff, QFilterCondition> {
  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> baseCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baseCost',
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> baseCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baseCost',
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> baseCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> baseCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baseCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> baseCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baseCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> baseCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baseCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> costPerLiterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'costPerLiter',
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> costPerLiterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'costPerLiter',
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> costPerLiterEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'costPerLiter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> costPerLiterGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'costPerLiter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> costPerLiterLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'costPerLiter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> costPerLiterBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'costPerLiter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension TariffQueryObject on QueryBuilder<Tariff, Tariff, QFilterCondition> {}
