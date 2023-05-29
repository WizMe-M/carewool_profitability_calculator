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
    r'fileName': PropertySchema(
      id: 0,
      name: r'fileName',
      type: IsarType.string,
    ),
    r'uploadTime': PropertySchema(
      id: 1,
      name: r'uploadTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _storageUploadEstimateSize,
  serialize: _storageUploadSerialize,
  deserialize: _storageUploadDeserialize,
  deserializeProp: _storageUploadDeserializeProp,
  idName: r'id',
  indexes: {
    r'uploadTime': IndexSchema(
      id: -1308871467908879180,
      name: r'uploadTime',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'uploadTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'storages': LinkSchema(
      id: 3753665804502481360,
      name: r'storages',
      target: r'Storage',
      single: false,
    )
  },
  embeddedSchemas: {},
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
  bytesCount += 3 + object.fileName.length * 3;
  return bytesCount;
}

void _storageUploadSerialize(
  StorageUpload object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.fileName);
  writer.writeDateTime(offsets[1], object.uploadTime);
}

StorageUpload _storageUploadDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StorageUpload();
  object.fileName = reader.readString(offsets[0]);
  object.id = id;
  object.uploadTime = reader.readDateTime(offsets[1]);
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
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _storageUploadGetId(StorageUpload object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _storageUploadGetLinks(StorageUpload object) {
  return [object.storages];
}

void _storageUploadAttach(
    IsarCollection<dynamic> col, Id id, StorageUpload object) {
  object.id = id;
  object.storages.attach(col, col.isar.collection<Storage>(), r'storages', id);
}

extension StorageUploadByIndex on IsarCollection<StorageUpload> {
  Future<StorageUpload?> getByUploadTime(DateTime uploadTime) {
    return getByIndex(r'uploadTime', [uploadTime]);
  }

  StorageUpload? getByUploadTimeSync(DateTime uploadTime) {
    return getByIndexSync(r'uploadTime', [uploadTime]);
  }

  Future<bool> deleteByUploadTime(DateTime uploadTime) {
    return deleteByIndex(r'uploadTime', [uploadTime]);
  }

  bool deleteByUploadTimeSync(DateTime uploadTime) {
    return deleteByIndexSync(r'uploadTime', [uploadTime]);
  }

  Future<List<StorageUpload?>> getAllByUploadTime(
      List<DateTime> uploadTimeValues) {
    final values = uploadTimeValues.map((e) => [e]).toList();
    return getAllByIndex(r'uploadTime', values);
  }

  List<StorageUpload?> getAllByUploadTimeSync(List<DateTime> uploadTimeValues) {
    final values = uploadTimeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uploadTime', values);
  }

  Future<int> deleteAllByUploadTime(List<DateTime> uploadTimeValues) {
    final values = uploadTimeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uploadTime', values);
  }

  int deleteAllByUploadTimeSync(List<DateTime> uploadTimeValues) {
    final values = uploadTimeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uploadTime', values);
  }

  Future<Id> putByUploadTime(StorageUpload object) {
    return putByIndex(r'uploadTime', object);
  }

  Id putByUploadTimeSync(StorageUpload object, {bool saveLinks = true}) {
    return putByIndexSync(r'uploadTime', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUploadTime(List<StorageUpload> objects) {
    return putAllByIndex(r'uploadTime', objects);
  }

  List<Id> putAllByUploadTimeSync(List<StorageUpload> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uploadTime', objects, saveLinks: saveLinks);
  }
}

extension StorageUploadQueryWhereSort
    on QueryBuilder<StorageUpload, StorageUpload, QWhere> {
  QueryBuilder<StorageUpload, StorageUpload, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterWhere> anyUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'uploadTime'),
      );
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

  QueryBuilder<StorageUpload, StorageUpload, QAfterWhereClause>
      uploadTimeEqualTo(DateTime uploadTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uploadTime',
        value: [uploadTime],
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterWhereClause>
      uploadTimeNotEqualTo(DateTime uploadTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uploadTime',
              lower: [],
              upper: [uploadTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uploadTime',
              lower: [uploadTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uploadTime',
              lower: [uploadTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uploadTime',
              lower: [],
              upper: [uploadTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterWhereClause>
      uploadTimeGreaterThan(
    DateTime uploadTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uploadTime',
        lower: [uploadTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterWhereClause>
      uploadTimeLessThan(
    DateTime uploadTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uploadTime',
        lower: [],
        upper: [uploadTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterWhereClause>
      uploadTimeBetween(
    DateTime lowerUploadTime,
    DateTime upperUploadTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uploadTime',
        lower: [lowerUploadTime],
        includeLower: includeLower,
        upper: [upperUploadTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StorageUploadQueryFilter
    on QueryBuilder<StorageUpload, StorageUpload, QFilterCondition> {
  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      fileNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      fileNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      fileNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      fileNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      fileNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      fileNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      fileNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      fileNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fileName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      fileNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileName',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      fileNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fileName',
        value: '',
      ));
    });
  }

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
      uploadTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uploadTime',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      uploadTimeGreaterThan(
    DateTime value, {
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
    DateTime value, {
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
    DateTime lower,
    DateTime upper, {
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
}

extension StorageUploadQueryObject
    on QueryBuilder<StorageUpload, StorageUpload, QFilterCondition> {}

extension StorageUploadQueryLinks
    on QueryBuilder<StorageUpload, StorageUpload, QFilterCondition> {
  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition> storages(
      FilterQuery<Storage> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'storages');
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      storagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'storages', length, true, length, true);
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      storagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'storages', 0, true, 0, true);
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      storagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'storages', 0, false, 999999, true);
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      storagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'storages', 0, true, length, include);
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      storagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'storages', length, include, 999999, true);
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterFilterCondition>
      storagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'storages', lower, includeLower, upper, includeUpper);
    });
  }
}

extension StorageUploadQuerySortBy
    on QueryBuilder<StorageUpload, StorageUpload, QSortBy> {
  QueryBuilder<StorageUpload, StorageUpload, QAfterSortBy> sortByFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.asc);
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterSortBy>
      sortByFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.desc);
    });
  }

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
  QueryBuilder<StorageUpload, StorageUpload, QAfterSortBy> thenByFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.asc);
    });
  }

  QueryBuilder<StorageUpload, StorageUpload, QAfterSortBy>
      thenByFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.desc);
    });
  }

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
  QueryBuilder<StorageUpload, StorageUpload, QDistinct> distinctByFileName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileName', caseSensitive: caseSensitive);
    });
  }

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

  QueryBuilder<StorageUpload, String, QQueryOperations> fileNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileName');
    });
  }

  QueryBuilder<StorageUpload, DateTime, QQueryOperations> uploadTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploadTime');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStorageCollection on Isar {
  IsarCollection<Storage> get storages => this.collection();
}

const StorageSchema = CollectionSchema(
  name: r'Storage',
  id: 1211984339887552882,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'nameWords': PropertySchema(
      id: 1,
      name: r'nameWords',
      type: IsarType.stringList,
    ),
    r'tariffs': PropertySchema(
      id: 2,
      name: r'tariffs',
      type: IsarType.objectList,
      target: r'Tariff',
    )
  },
  estimateSize: _storageEstimateSize,
  serialize: _storageSerialize,
  deserialize: _storageDeserialize,
  deserializeProp: _storageDeserializeProp,
  idName: r'id',
  indexes: {
    r'nameWords': IndexSchema(
      id: 8960882405442787957,
      name: r'nameWords',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nameWords',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'upload': LinkSchema(
      id: 7925296032143477193,
      name: r'upload',
      target: r'StorageUpload',
      single: false,
      linkName: r'storages',
    )
  },
  embeddedSchemas: {r'Tariff': TariffSchema},
  getId: _storageGetId,
  getLinks: _storageGetLinks,
  attach: _storageAttach,
  version: '3.1.0+1',
);

int _storageEstimateSize(
  Storage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.nameWords.length * 3;
  {
    for (var i = 0; i < object.nameWords.length; i++) {
      final value = object.nameWords[i];
      bytesCount += value.length * 3;
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
  writer.writeStringList(offsets[1], object.nameWords);
  writer.writeObjectList<Tariff>(
    offsets[2],
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
  object.id = id;
  object.name = reader.readString(offsets[0]);
  object.tariffs = reader.readObjectList<Tariff>(
        offsets[2],
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
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
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

Id _storageGetId(Storage object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _storageGetLinks(Storage object) {
  return [object.upload];
}

void _storageAttach(IsarCollection<dynamic> col, Id id, Storage object) {
  object.id = id;
  object.upload
      .attach(col, col.isar.collection<StorageUpload>(), r'upload', id);
}

extension StorageQueryWhereSort on QueryBuilder<Storage, Storage, QWhere> {
  QueryBuilder<Storage, Storage, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Storage, Storage, QAfterWhere> anyNameWordsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'nameWords'),
      );
    });
  }
}

extension StorageQueryWhere on QueryBuilder<Storage, Storage, QWhereClause> {
  QueryBuilder<Storage, Storage, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Storage, Storage, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Storage, Storage, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Storage, Storage, QAfterWhereClause> idBetween(
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

  QueryBuilder<Storage, Storage, QAfterWhereClause> nameWordsElementEqualTo(
      String nameWordsElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nameWords',
        value: [nameWordsElement],
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterWhereClause> nameWordsElementNotEqualTo(
      String nameWordsElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nameWords',
              lower: [],
              upper: [nameWordsElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nameWords',
              lower: [nameWordsElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nameWords',
              lower: [nameWordsElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nameWords',
              lower: [],
              upper: [nameWordsElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Storage, Storage, QAfterWhereClause> nameWordsElementGreaterThan(
    String nameWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nameWords',
        lower: [nameWordsElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterWhereClause> nameWordsElementLessThan(
    String nameWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nameWords',
        lower: [],
        upper: [nameWordsElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterWhereClause> nameWordsElementBetween(
    String lowerNameWordsElement,
    String upperNameWordsElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nameWords',
        lower: [lowerNameWordsElement],
        includeLower: includeLower,
        upper: [upperNameWordsElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterWhereClause> nameWordsElementStartsWith(
      String NameWordsElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nameWords',
        lower: [NameWordsElementPrefix],
        upper: ['$NameWordsElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterWhereClause> nameWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nameWords',
        value: [''],
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterWhereClause>
      nameWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'nameWords',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'nameWords',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'nameWords',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'nameWords',
              upper: [''],
            ));
      }
    });
  }
}

extension StorageQueryFilter
    on QueryBuilder<Storage, Storage, QFilterCondition> {
  QueryBuilder<Storage, Storage, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Storage, Storage, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Storage, Storage, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameWordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition>
      nameWordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition>
      nameWordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameWordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameWords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition>
      nameWordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition>
      nameWordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition>
      nameWordsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameWordsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameWords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition>
      nameWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameWords',
        value: '',
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition>
      nameWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameWords',
        value: '',
      ));
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameWordsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nameWords',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameWordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nameWords',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameWordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nameWords',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameWordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nameWords',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition>
      nameWordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nameWords',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> nameWordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nameWords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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

extension StorageQueryLinks
    on QueryBuilder<Storage, Storage, QFilterCondition> {
  QueryBuilder<Storage, Storage, QAfterFilterCondition> upload(
      FilterQuery<StorageUpload> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'upload');
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> uploadLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'upload', length, true, length, true);
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> uploadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'upload', 0, true, 0, true);
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> uploadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'upload', 0, false, 999999, true);
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> uploadLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'upload', 0, true, length, include);
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> uploadLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'upload', length, include, 999999, true);
    });
  }

  QueryBuilder<Storage, Storage, QAfterFilterCondition> uploadLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'upload', lower, includeLower, upper, includeUpper);
    });
  }
}

extension StorageQuerySortBy on QueryBuilder<Storage, Storage, QSortBy> {
  QueryBuilder<Storage, Storage, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Storage, Storage, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension StorageQuerySortThenBy
    on QueryBuilder<Storage, Storage, QSortThenBy> {
  QueryBuilder<Storage, Storage, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Storage, Storage, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Storage, Storage, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Storage, Storage, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension StorageQueryWhereDistinct
    on QueryBuilder<Storage, Storage, QDistinct> {
  QueryBuilder<Storage, Storage, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Storage, Storage, QDistinct> distinctByNameWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameWords');
    });
  }
}

extension StorageQueryProperty
    on QueryBuilder<Storage, Storage, QQueryProperty> {
  QueryBuilder<Storage, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Storage, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Storage, List<String>, QQueryOperations> nameWordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameWords');
    });
  }

  QueryBuilder<Storage, List<Tariff>, QQueryOperations> tariffsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tariffs');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

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
  bytesCount += 3 + object.name.length * 3;
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
  object.baseCost = reader.readDouble(offsets[0]);
  object.costPerLiter = reader.readDouble(offsets[1]);
  object.name = reader.readString(offsets[2]);
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
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TariffQueryFilter on QueryBuilder<Tariff, Tariff, QFilterCondition> {
  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> baseCostEqualTo(
    double value, {
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
    double value, {
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
    double value, {
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
    double lower,
    double upper, {
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

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> costPerLiterEqualTo(
    double value, {
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
    double value, {
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
    double value, {
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
    double lower,
    double upper, {
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

  QueryBuilder<Tariff, Tariff, QAfterFilterCondition> nameEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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
