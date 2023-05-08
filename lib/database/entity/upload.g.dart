// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUploadCollection on Isar {
  IsarCollection<Upload> get uploads => this.collection();
}

const UploadSchema = CollectionSchema(
  name: r'Upload',
  id: 7360031406712869724,
  properties: {
    r'uploadTime': PropertySchema(
      id: 0,
      name: r'uploadTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _uploadEstimateSize,
  serialize: _uploadSerialize,
  deserialize: _uploadDeserialize,
  deserializeProp: _uploadDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'categories': LinkSchema(
      id: 3407062789278738990,
      name: r'categories',
      target: r'CategoryList',
      single: true,
    ),
    r'storages': LinkSchema(
      id: 2150163314152706636,
      name: r'storages',
      target: r'StorageList',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _uploadGetId,
  getLinks: _uploadGetLinks,
  attach: _uploadAttach,
  version: '3.1.0+1',
);

int _uploadEstimateSize(
  Upload object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _uploadSerialize(
  Upload object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.uploadTime);
}

Upload _uploadDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Upload();
  object.id = id;
  object.uploadTime = reader.readDateTimeOrNull(offsets[0]);
  return object;
}

P _uploadDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _uploadGetId(Upload object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _uploadGetLinks(Upload object) {
  return [object.categories, object.storages];
}

void _uploadAttach(IsarCollection<dynamic> col, Id id, Upload object) {
  object.id = id;
  object.categories
      .attach(col, col.isar.collection<CategoryList>(), r'categories', id);
  object.storages
      .attach(col, col.isar.collection<StorageList>(), r'storages', id);
}

extension UploadQueryWhereSort on QueryBuilder<Upload, Upload, QWhere> {
  QueryBuilder<Upload, Upload, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UploadQueryWhere on QueryBuilder<Upload, Upload, QWhereClause> {
  QueryBuilder<Upload, Upload, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Upload, Upload, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Upload, Upload, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Upload, Upload, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Upload, Upload, QAfterWhereClause> idBetween(
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

extension UploadQueryFilter on QueryBuilder<Upload, Upload, QFilterCondition> {
  QueryBuilder<Upload, Upload, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Upload, Upload, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Upload, Upload, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Upload, Upload, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Upload, Upload, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Upload, Upload, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Upload, Upload, QAfterFilterCondition> uploadTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uploadTime',
      ));
    });
  }

  QueryBuilder<Upload, Upload, QAfterFilterCondition> uploadTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uploadTime',
      ));
    });
  }

  QueryBuilder<Upload, Upload, QAfterFilterCondition> uploadTimeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uploadTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Upload, Upload, QAfterFilterCondition> uploadTimeGreaterThan(
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

  QueryBuilder<Upload, Upload, QAfterFilterCondition> uploadTimeLessThan(
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

  QueryBuilder<Upload, Upload, QAfterFilterCondition> uploadTimeBetween(
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
}

extension UploadQueryObject on QueryBuilder<Upload, Upload, QFilterCondition> {}

extension UploadQueryLinks on QueryBuilder<Upload, Upload, QFilterCondition> {
  QueryBuilder<Upload, Upload, QAfterFilterCondition> categories(
      FilterQuery<CategoryList> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'categories');
    });
  }

  QueryBuilder<Upload, Upload, QAfterFilterCondition> categoriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'categories', 0, true, 0, true);
    });
  }

  QueryBuilder<Upload, Upload, QAfterFilterCondition> storages(
      FilterQuery<StorageList> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'storages');
    });
  }

  QueryBuilder<Upload, Upload, QAfterFilterCondition> storagesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'storages', 0, true, 0, true);
    });
  }
}

extension UploadQuerySortBy on QueryBuilder<Upload, Upload, QSortBy> {
  QueryBuilder<Upload, Upload, QAfterSortBy> sortByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.asc);
    });
  }

  QueryBuilder<Upload, Upload, QAfterSortBy> sortByUploadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.desc);
    });
  }
}

extension UploadQuerySortThenBy on QueryBuilder<Upload, Upload, QSortThenBy> {
  QueryBuilder<Upload, Upload, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Upload, Upload, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Upload, Upload, QAfterSortBy> thenByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.asc);
    });
  }

  QueryBuilder<Upload, Upload, QAfterSortBy> thenByUploadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.desc);
    });
  }
}

extension UploadQueryWhereDistinct on QueryBuilder<Upload, Upload, QDistinct> {
  QueryBuilder<Upload, Upload, QDistinct> distinctByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uploadTime');
    });
  }
}

extension UploadQueryProperty on QueryBuilder<Upload, Upload, QQueryProperty> {
  QueryBuilder<Upload, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Upload, DateTime?, QQueryOperations> uploadTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploadTime');
    });
  }
}
