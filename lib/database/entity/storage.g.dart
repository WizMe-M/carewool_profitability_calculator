// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStorageListCollection on Isar {
  IsarCollection<StorageList> get storageLists => this.collection();
}

const StorageListSchema = CollectionSchema(
  name: r'StorageList',
  id: 6179438774574436590,
  properties: {
    r'storages': PropertySchema(
      id: 0,
      name: r'storages',
      type: IsarType.objectList,
      target: r'Storage',
    )
  },
  estimateSize: _storageListEstimateSize,
  serialize: _storageListSerialize,
  deserialize: _storageListDeserialize,
  deserializeProp: _storageListDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Storage': StorageSchema, r'Tariff': TariffSchema},
  getId: _storageListGetId,
  getLinks: _storageListGetLinks,
  attach: _storageListAttach,
  version: '3.1.0+1',
);

int _storageListEstimateSize(
  StorageList object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.storages.length * 3;
  {
    final offsets = allOffsets[Storage]!;
    for (var i = 0; i < object.storages.length; i++) {
      final value = object.storages[i];
      bytesCount += StorageSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _storageListSerialize(
  StorageList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Storage>(
    offsets[0],
    allOffsets,
    StorageSchema.serialize,
    object.storages,
  );
}

StorageList _storageListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StorageList();
  object.id = id;
  object.storages = reader.readObjectList<Storage>(
        offsets[0],
        StorageSchema.deserialize,
        allOffsets,
        Storage(),
      ) ??
      [];
  return object;
}

P _storageListDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
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

Id _storageListGetId(StorageList object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _storageListGetLinks(StorageList object) {
  return [];
}

void _storageListAttach(
    IsarCollection<dynamic> col, Id id, StorageList object) {
  object.id = id;
}

extension StorageListQueryWhereSort
    on QueryBuilder<StorageList, StorageList, QWhere> {
  QueryBuilder<StorageList, StorageList, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StorageListQueryWhere
    on QueryBuilder<StorageList, StorageList, QWhereClause> {
  QueryBuilder<StorageList, StorageList, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StorageList, StorageList, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<StorageList, StorageList, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StorageList, StorageList, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StorageList, StorageList, QAfterWhereClause> idBetween(
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

extension StorageListQueryFilter
    on QueryBuilder<StorageList, StorageList, QFilterCondition> {
  QueryBuilder<StorageList, StorageList, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<StorageList, StorageList, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<StorageList, StorageList, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageList, StorageList, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<StorageList, StorageList, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<StorageList, StorageList, QAfterFilterCondition> idBetween(
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

  QueryBuilder<StorageList, StorageList, QAfterFilterCondition>
      storagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'storages',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<StorageList, StorageList, QAfterFilterCondition>
      storagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'storages',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<StorageList, StorageList, QAfterFilterCondition>
      storagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'storages',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<StorageList, StorageList, QAfterFilterCondition>
      storagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'storages',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<StorageList, StorageList, QAfterFilterCondition>
      storagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'storages',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<StorageList, StorageList, QAfterFilterCondition>
      storagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'storages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension StorageListQueryObject
    on QueryBuilder<StorageList, StorageList, QFilterCondition> {
  QueryBuilder<StorageList, StorageList, QAfterFilterCondition> storagesElement(
      FilterQuery<Storage> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'storages');
    });
  }
}

extension StorageListQueryLinks
    on QueryBuilder<StorageList, StorageList, QFilterCondition> {}

extension StorageListQuerySortBy
    on QueryBuilder<StorageList, StorageList, QSortBy> {}

extension StorageListQuerySortThenBy
    on QueryBuilder<StorageList, StorageList, QSortThenBy> {
  QueryBuilder<StorageList, StorageList, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StorageList, StorageList, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension StorageListQueryWhereDistinct
    on QueryBuilder<StorageList, StorageList, QDistinct> {}

extension StorageListQueryProperty
    on QueryBuilder<StorageList, StorageList, QQueryProperty> {
  QueryBuilder<StorageList, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StorageList, List<Storage>, QQueryOperations>
      storagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storages');
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
