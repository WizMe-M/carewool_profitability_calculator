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
    r'uploadTime': PropertySchema(
      id: 0,
      name: r'uploadTime',
      type: IsarType.dateTime,
    ),
    r'uploadedItems': PropertySchema(
      id: 1,
      name: r'uploadedItems',
      type: IsarType.objectList,
      target: r'Commission',
    )
  },
  estimateSize: _commissionUploadEstimateSize,
  serialize: _commissionUploadSerialize,
  deserialize: _commissionUploadDeserialize,
  deserializeProp: _commissionUploadDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Commission': CommissionSchema},
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
  bytesCount += 3 + object.uploadedItems.length * 3;
  {
    final offsets = allOffsets[Commission]!;
    for (var i = 0; i < object.uploadedItems.length; i++) {
      final value = object.uploadedItems[i];
      bytesCount += CommissionSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _commissionUploadSerialize(
  CommissionUpload object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.uploadTime);
  writer.writeObjectList<Commission>(
    offsets[1],
    allOffsets,
    CommissionSchema.serialize,
    object.uploadedItems,
  );
}

CommissionUpload _commissionUploadDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CommissionUpload();
  object.id = id;
  object.uploadTime = reader.readDateTimeOrNull(offsets[0]);
  object.uploadedItems = reader.readObjectList<Commission>(
        offsets[1],
        CommissionSchema.deserialize,
        allOffsets,
        Commission(),
      ) ??
      [];
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<Commission>(
            offset,
            CommissionSchema.deserialize,
            allOffsets,
            Commission(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _commissionUploadGetId(CommissionUpload object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _commissionUploadGetLinks(CommissionUpload object) {
  return [];
}

void _commissionUploadAttach(
    IsarCollection<dynamic> col, Id id, CommissionUpload object) {
  object.id = id;
}

extension CommissionUploadQueryWhereSort
    on QueryBuilder<CommissionUpload, CommissionUpload, QWhere> {
  QueryBuilder<CommissionUpload, CommissionUpload, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
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
}

extension CommissionUploadQueryFilter
    on QueryBuilder<CommissionUpload, CommissionUpload, QFilterCondition> {
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
      uploadTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uploadTime',
      ));
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      uploadTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uploadTime',
      ));
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      uploadTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uploadTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
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

extension CommissionUploadQueryObject
    on QueryBuilder<CommissionUpload, CommissionUpload, QFilterCondition> {
  QueryBuilder<CommissionUpload, CommissionUpload, QAfterFilterCondition>
      uploadedItemsElement(FilterQuery<Commission> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'uploadedItems');
    });
  }
}

extension CommissionUploadQueryLinks
    on QueryBuilder<CommissionUpload, CommissionUpload, QFilterCondition> {}

extension CommissionUploadQuerySortBy
    on QueryBuilder<CommissionUpload, CommissionUpload, QSortBy> {
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

  QueryBuilder<CommissionUpload, DateTime?, QQueryOperations>
      uploadTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploadTime');
    });
  }

  QueryBuilder<CommissionUpload, List<Commission>, QQueryOperations>
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

const CommissionSchema = Schema(
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
    )
  },
  estimateSize: _commissionEstimateSize,
  serialize: _commissionSerialize,
  deserialize: _commissionDeserialize,
  deserializeProp: _commissionDeserializeProp,
);

int _commissionEstimateSize(
  Commission object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.itemName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
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
}

Commission _commissionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Commission();
  object.category = reader.readStringOrNull(offsets[0]);
  object.fbo = reader.readDoubleOrNull(offsets[1]);
  object.fbs = reader.readDoubleOrNull(offsets[2]);
  object.itemName = reader.readStringOrNull(offsets[3]);
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
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CommissionQueryFilter
    on QueryBuilder<Commission, Commission, QFilterCondition> {
  QueryBuilder<Commission, Commission, QAfterFilterCondition> categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> categoryEqualTo(
    String? value, {
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
    String? value, {
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
    String? value, {
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
    String? lower,
    String? upper, {
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

  QueryBuilder<Commission, Commission, QAfterFilterCondition> fboIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fbo',
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> fboIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fbo',
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> fboEqualTo(
    double? value, {
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
    double? value, {
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
    double? value, {
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
    double? lower,
    double? upper, {
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

  QueryBuilder<Commission, Commission, QAfterFilterCondition> fbsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fbs',
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> fbsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fbs',
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> fbsEqualTo(
    double? value, {
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
    double? value, {
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
    double? value, {
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
    double? lower,
    double? upper, {
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

  QueryBuilder<Commission, Commission, QAfterFilterCondition> itemNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'itemName',
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition>
      itemNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'itemName',
      ));
    });
  }

  QueryBuilder<Commission, Commission, QAfterFilterCondition> itemNameEqualTo(
    String? value, {
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
    String? value, {
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
    String? value, {
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
    String? lower,
    String? upper, {
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
}

extension CommissionQueryObject
    on QueryBuilder<Commission, Commission, QFilterCondition> {}
