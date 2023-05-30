// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCommissionUploadCollection on Isar {
  IsarCollection<CommissionUpload> get commissionUploads => this.collection();
}

const CommissionUploadSchema = CollectionSchema(
  name: r'CommissionUpload',
  id: 5709928892684947988,
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
  estimateSize: _commissionUploadEstimateSize,
  serialize: _commissionUploadSerialize,
  deserialize: _commissionUploadDeserialize,
  deserializeProp: _commissionUploadDeserializeProp,
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
    r'commissions': LinkSchema(
      id: 5405984960771299448,
      name: r'commissions',
      target: r'Commission',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _commissionUploadGetId,
  getLinks: _commissionUploadGetLinks,
  attach: _commissionUploadAttach,
  version: '3.1.0+1',
);

int _commissionUploadEstimateSize(
  CommissionUpload object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.fileName.length * 3;
  return bytesCount;
}

void _commissionUploadSerialize(
  CommissionUpload object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.fileName);
  writer.writeDateTime(offsets[1], object.uploadTime);
}

CommissionUpload _commissionUploadDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CommissionUpload();
  object.fileName = reader.readString(offsets[0]);
  object.id = id;
  object.uploadTime = reader.readDateTime(offsets[1]);
  return object;
}

P _commissionUploadDeserializeProp<P>(
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

Id _commissionUploadGetId(CommissionUpload object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _commissionUploadGetLinks(CommissionUpload object) {
  return [object.commissions];
}

void _commissionUploadAttach(
    IsarCollection<dynamic> col, Id id, CommissionUpload object) {
  object.id = id;
  object.commissions
      .attach(col, col.isar.collection<Commission>(), r'commissions', id);
}

extension CommissionUploadByIndex on IsarCollection<CommissionUpload> {
  Future<CommissionUpload?> getByUploadTime(DateTime uploadTime) {
    return getByIndex(r'uploadTime', [uploadTime]);
  }

  CommissionUpload? getByUploadTimeSync(DateTime uploadTime) {
    return getByIndexSync(r'uploadTime', [uploadTime]);
  }

  Future<bool> deleteByUploadTime(DateTime uploadTime) {
    return deleteByIndex(r'uploadTime', [uploadTime]);
  }

  bool deleteByUploadTimeSync(DateTime uploadTime) {
    return deleteByIndexSync(r'uploadTime', [uploadTime]);
  }

  Future<List<CommissionUpload?>> getAllByUploadTime(
      List<DateTime> uploadTimeValues) {
    final values = uploadTimeValues.map((e) => [e]).toList();
    return getAllByIndex(r'uploadTime', values);
  }

  List<CommissionUpload?> getAllByUploadTimeSync(
      List<DateTime> uploadTimeValues) {
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

  Future<Id> putByUploadTime(CommissionUpload object) {
    return putByIndex(r'uploadTime', object);
  }

  Id putByUploadTimeSync(CommissionUpload object, {bool saveLinks = true}) {
    return putByIndexSync(r'uploadTime', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUploadTime(List<CommissionUpload> objects) {
    return putAllByIndex(r'uploadTime', objects);
  }

  List<Id> putAllByUploadTimeSync(List<CommissionUpload> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uploadTime', objects, saveLinks: saveLinks);
  }
}

extension CommissionUploadQueryWhereSort
    on QueryBuilder<CommissionUpload, CommissionUpload, QWhere> {
  QueryBuilder<CommissionUpload, CommissionUpload, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterWhere>
      anyUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'uploadTime'),
      );
    });
  }
}

extension CommissionUploadQueryWhere
    on QueryBuilder<CommissionUpload, CommissionUpload, QWhereClause> {
  QueryBuilder<CommissionUpload, CommissionUpload, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterWhereClause> idBetween(
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterWhereClause>
      uploadTimeEqualTo(DateTime uploadTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uploadTime',
        value: [uploadTime],
      ));
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterWhereClause>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterWhereClause>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterWhereClause>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterWhereClause>
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

extension CommissionUploadQueryFilter
    on QueryBuilder<CommissionUpload, CommissionUpload, QFilterCondition> {
  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      fileNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      fileNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fileName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      fileNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileName',
        value: '',
      ));
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      fileNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fileName',
        value: '',
      ));
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      uploadTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uploadTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

extension CommissionUploadQueryObject
    on QueryBuilder<CommissionUpload, CommissionUpload, QFilterCondition> {}

extension CommissionUploadQueryLinks
    on QueryBuilder<CommissionUpload, CommissionUpload, QFilterCondition> {
  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      commissions(FilterQuery<Commission> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'commissions');
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      commissionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'commissions', length, true, length, true);
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      commissionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'commissions', 0, true, 0, true);
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      commissionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'commissions', 0, false, 999999, true);
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      commissionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'commissions', 0, true, length, include);
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      commissionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'commissions', length, include, 999999, true);
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      commissionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'commissions', lower, includeLower, upper, includeUpper);
    });
  }
}

extension CommissionUploadQuerySortBy
    on QueryBuilder<CommissionUpload, CommissionUpload, QSortBy> {
  QueryBuilder<CommissionUpload, CommissionUpload, QAfterSortBy>
      sortByFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.asc);
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterSortBy>
      sortByFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.desc);
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterSortBy>
      sortByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.asc);
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterSortBy>
      sortByUploadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.desc);
    });
  }
}

extension CommissionUploadQuerySortThenBy
    on QueryBuilder<CommissionUpload, CommissionUpload, QSortThenBy> {
  QueryBuilder<CommissionUpload, CommissionUpload, QAfterSortBy>
      thenByFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.asc);
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterSortBy>
      thenByFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.desc);
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterSortBy>
      thenByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.asc);
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterSortBy>
      thenByUploadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.desc);
    });
  }
}

extension CommissionUploadQueryWhereDistinct
    on QueryBuilder<CommissionUpload, CommissionUpload, QDistinct> {
  QueryBuilder<CommissionUpload, CommissionUpload, QDistinct>
      distinctByFileName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QDistinct>
      distinctByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uploadTime');
    });
  }
}

extension CommissionUploadQueryProperty
    on QueryBuilder<CommissionUpload, CommissionUpload, QQueryProperty> {
  QueryBuilder<CommissionUpload, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CommissionUpload, String, QQueryOperations> fileNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileName');
    });
  }

  QueryBuilder<CommissionUpload, DateTime, QQueryOperations>
      uploadTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploadTime');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCommissionCollection on Isar {
  IsarCollection<Commission> get commissions => this.collection();
}

const CommissionSchema = CollectionSchema(
  name: r'Commission',
  id: 4921080087218696213,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.string,
    ),
    r'fbo': PropertySchema(
      id: 1,
      name: r'fbo',
      type: IsarType.double,
    ),
    r'fbs': PropertySchema(
      id: 2,
      name: r'fbs',
      type: IsarType.double,
    ),
    r'itemName': PropertySchema(
      id: 3,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'tagWords': PropertySchema(
      id: 4,
      name: r'tagWords',
      type: IsarType.stringList,
    )
  },
  estimateSize: _commissionEstimateSize,
  serialize: _commissionSerialize,
  deserialize: _commissionDeserialize,
  deserializeProp: _commissionDeserializeProp,
  idName: r'id',
  indexes: {
    r'tagWords': IndexSchema(
      id: -2382746471204615764,
      name: r'tagWords',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tagWords',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'upload': LinkSchema(
      id: -5475899690517561306,
      name: r'upload',
      target: r'CommissionUpload',
      single: true,
      linkName: r'commissions',
    )
  },
  embeddedSchemas: {},
  getId: _commissionGetId,
  getLinks: _commissionGetLinks,
  attach: _commissionAttach,
  version: '3.1.0+1',
);

int _commissionEstimateSize(
  Commission object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.itemName.length * 3;
  bytesCount += 3 + object.tagWords.length * 3;
  {
    for (var i = 0; i < object.tagWords.length; i++) {
      final value = object.tagWords[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _commissionSerialize(
  Commission object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.category);
  writer.writeDouble(offsets[1], object.fbo);
  writer.writeDouble(offsets[2], object.fbs);
  writer.writeString(offsets[3], object.itemName);
  writer.writeStringList(offsets[4], object.tagWords);
}

Commission _commissionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Commission();
  object.category = reader.readString(offsets[0]);
  object.fbo = reader.readDouble(offsets[1]);
  object.fbs = reader.readDouble(offsets[2]);
  object.id = id;
  object.itemName = reader.readString(offsets[3]);
  return object;
}

P _commissionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _commissionGetId(Commission object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _commissionGetLinks(Commission object) {
  return [object.upload];
}

void _commissionAttach(IsarCollection<dynamic> col, Id id, Commission object) {
  object.id = id;
  object.upload
      .attach(col, col.isar.collection<CommissionUpload>(), r'upload', id);
}

extension CommissionQueryWhereSort
    on QueryBuilder<Commission, Commission, QWhere> {
  QueryBuilder<Commission, Commission, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Commission, Commission, QAfterWhere> anyTagWordsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'tagWords'),
      );
    });
  }
}

extension CommissionQueryWhere
    on QueryBuilder<Commission, Commission, QWhereClause> {
  QueryBuilder<Commission, Commission, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Commission, Commission, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Commission, Commission, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Commission, Commission, QAfterWhereClause> idBetween(
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

  QueryBuilder<Commission, Commission, QAfterWhereClause>
      tagWordsElementEqualTo(String tagWordsElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tagWords',
        value: [tagWordsElement],
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterWhereClause>
      tagWordsElementNotEqualTo(String tagWordsElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tagWords',
              lower: [],
              upper: [tagWordsElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tagWords',
              lower: [tagWordsElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tagWords',
              lower: [tagWordsElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tagWords',
              lower: [],
              upper: [tagWordsElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Commission, Commission, QAfterWhereClause>
      tagWordsElementGreaterThan(
    String tagWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tagWords',
        lower: [tagWordsElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterWhereClause>
      tagWordsElementLessThan(
    String tagWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tagWords',
        lower: [],
        upper: [tagWordsElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterWhereClause>
      tagWordsElementBetween(
    String lowerTagWordsElement,
    String upperTagWordsElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tagWords',
        lower: [lowerTagWordsElement],
        includeLower: includeLower,
        upper: [upperTagWordsElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterWhereClause>
      tagWordsElementStartsWith(String TagWordsElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tagWords',
        lower: [TagWordsElementPrefix],
        upper: ['$TagWordsElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterWhereClause>
      tagWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tagWords',
        value: [''],
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterWhereClause>
      tagWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'tagWords',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'tagWords',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'tagWords',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'tagWords',
              upper: [''],
            ));
      }
    });
  }
}

extension CommissionQueryFilter
    on QueryBuilder<Commission, Commission, QFilterCondition> {
  QueryBuilder<Commission, Commission, QAfterFilterCondition> categoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      categoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> categoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> categoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> categoryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> categoryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> fboEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fbo',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> fboGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fbo',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> fboLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fbo',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> fboBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fbo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> fbsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> fbsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> fbsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> fbsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Commission, Commission, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Commission, Commission, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Commission, Commission, QAfterFilterCondition> itemNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      itemNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> itemNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> itemNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      itemNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> itemNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> itemNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> itemNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      tagWordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      tagWordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tagWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      tagWordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tagWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      tagWordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tagWords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      tagWordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tagWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      tagWordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tagWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      tagWordsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tagWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      tagWordsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tagWords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      tagWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagWords',
        value: '',
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      tagWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tagWords',
        value: '',
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      tagWordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagWords',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      tagWordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagWords',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      tagWordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagWords',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      tagWordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagWords',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      tagWordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagWords',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      tagWordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagWords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension CommissionQueryObject
    on QueryBuilder<Commission, Commission, QFilterCondition> {}

extension CommissionQueryLinks
    on QueryBuilder<Commission, Commission, QFilterCondition> {
  QueryBuilder<Commission, Commission, QAfterFilterCondition> upload(
      FilterQuery<CommissionUpload> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'upload');
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> uploadIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'upload', 0, true, 0, true);
    });
  }
}

extension CommissionQuerySortBy
    on QueryBuilder<Commission, Commission, QSortBy> {
  QueryBuilder<Commission, Commission, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<Commission, Commission, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<Commission, Commission, QAfterSortBy> sortByFbo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fbo', Sort.asc);
    });
  }

  QueryBuilder<Commission, Commission, QAfterSortBy> sortByFboDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fbo', Sort.desc);
    });
  }

  QueryBuilder<Commission, Commission, QAfterSortBy> sortByFbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fbs', Sort.asc);
    });
  }

  QueryBuilder<Commission, Commission, QAfterSortBy> sortByFbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fbs', Sort.desc);
    });
  }

  QueryBuilder<Commission, Commission, QAfterSortBy> sortByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<Commission, Commission, QAfterSortBy> sortByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }
}

extension CommissionQuerySortThenBy
    on QueryBuilder<Commission, Commission, QSortThenBy> {
  QueryBuilder<Commission, Commission, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<Commission, Commission, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<Commission, Commission, QAfterSortBy> thenByFbo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fbo', Sort.asc);
    });
  }

  QueryBuilder<Commission, Commission, QAfterSortBy> thenByFboDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fbo', Sort.desc);
    });
  }

  QueryBuilder<Commission, Commission, QAfterSortBy> thenByFbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fbs', Sort.asc);
    });
  }

  QueryBuilder<Commission, Commission, QAfterSortBy> thenByFbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fbs', Sort.desc);
    });
  }

  QueryBuilder<Commission, Commission, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Commission, Commission, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Commission, Commission, QAfterSortBy> thenByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<Commission, Commission, QAfterSortBy> thenByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }
}

extension CommissionQueryWhereDistinct
    on QueryBuilder<Commission, Commission, QDistinct> {
  QueryBuilder<Commission, Commission, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Commission, Commission, QDistinct> distinctByFbo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fbo');
    });
  }

  QueryBuilder<Commission, Commission, QDistinct> distinctByFbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fbs');
    });
  }

  QueryBuilder<Commission, Commission, QDistinct> distinctByItemName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Commission, Commission, QDistinct> distinctByTagWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tagWords');
    });
  }
}

extension CommissionQueryProperty
    on QueryBuilder<Commission, Commission, QQueryProperty> {
  QueryBuilder<Commission, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Commission, String, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<Commission, double, QQueryOperations> fboProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fbo');
    });
  }

  QueryBuilder<Commission, double, QQueryOperations> fbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fbs');
    });
  }

  QueryBuilder<Commission, String, QQueryOperations> itemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemName');
    });
  }

  QueryBuilder<Commission, List<String>, QQueryOperations> tagWordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tagWords');
    });
  }
}
