// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profitability.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProfitabilityCalcCollection on Isar {
  IsarCollection<ProfitabilityCalc> get profitabilityCalcs => this.collection();
}

const ProfitabilityCalcSchema = CollectionSchema(
  name: r'ProfitabilityCalc',
  id: -1433036784303571420,
  properties: {
    r'pricing': PropertySchema(
      id: 0,
      name: r'pricing',
      type: IsarType.object,
      target: r'Pricing',
    ),
    r'size': PropertySchema(
      id: 1,
      name: r'size',
      type: IsarType.object,
      target: r'Size',
    ),
    r'tax': PropertySchema(
      id: 2,
      name: r'tax',
      type: IsarType.string,
      enumMap: _ProfitabilityCalctaxEnumValueMap,
    )
  },
  estimateSize: _profitabilityCalcEstimateSize,
  serialize: _profitabilityCalcSerialize,
  deserialize: _profitabilityCalcDeserialize,
  deserializeProp: _profitabilityCalcDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'costPrice': LinkSchema(
      id: -5770848950083124934,
      name: r'costPrice',
      target: r'CostPrice',
      single: true,
    ),
    r'storage': LinkSchema(
      id: -2795659081949365372,
      name: r'storage',
      target: r'Storage',
      single: true,
    ),
    r'commission': LinkSchema(
      id: -1128142566014110406,
      name: r'commission',
      target: r'Commission',
      single: true,
    )
  },
  embeddedSchemas: {r'Size': SizeSchema, r'Pricing': PricingSchema},
  getId: _profitabilityCalcGetId,
  getLinks: _profitabilityCalcGetLinks,
  attach: _profitabilityCalcAttach,
  version: '3.1.0+1',
);

int _profitabilityCalcEstimateSize(
  ProfitabilityCalc object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      PricingSchema.estimateSize(
          object.pricing, allOffsets[Pricing]!, allOffsets);
  bytesCount +=
      3 + SizeSchema.estimateSize(object.size, allOffsets[Size]!, allOffsets);
  bytesCount += 3 + object.tax.name.length * 3;
  return bytesCount;
}

void _profitabilityCalcSerialize(
  ProfitabilityCalc object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Pricing>(
    offsets[0],
    allOffsets,
    PricingSchema.serialize,
    object.pricing,
  );
  writer.writeObject<Size>(
    offsets[1],
    allOffsets,
    SizeSchema.serialize,
    object.size,
  );
  writer.writeString(offsets[2], object.tax.name);
}

ProfitabilityCalc _profitabilityCalcDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProfitabilityCalc();
  object.id = id;
  object.pricing = reader.readObjectOrNull<Pricing>(
        offsets[0],
        PricingSchema.deserialize,
        allOffsets,
      ) ??
      Pricing();
  object.size = reader.readObjectOrNull<Size>(
        offsets[1],
        SizeSchema.deserialize,
        allOffsets,
      ) ??
      Size();
  object.tax =
      _ProfitabilityCalctaxValueEnumMap[reader.readStringOrNull(offsets[2])] ??
          SimpleTaxationSystem.perIncome;
  return object;
}

P _profitabilityCalcDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Pricing>(
            offset,
            PricingSchema.deserialize,
            allOffsets,
          ) ??
          Pricing()) as P;
    case 1:
      return (reader.readObjectOrNull<Size>(
            offset,
            SizeSchema.deserialize,
            allOffsets,
          ) ??
          Size()) as P;
    case 2:
      return (_ProfitabilityCalctaxValueEnumMap[
              reader.readStringOrNull(offset)] ??
          SimpleTaxationSystem.perIncome) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ProfitabilityCalctaxEnumValueMap = {
  r'perIncome': r'perIncome',
  r'perProfit': r'perProfit',
};
const _ProfitabilityCalctaxValueEnumMap = {
  r'perIncome': SimpleTaxationSystem.perIncome,
  r'perProfit': SimpleTaxationSystem.perProfit,
};

Id _profitabilityCalcGetId(ProfitabilityCalc object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _profitabilityCalcGetLinks(
    ProfitabilityCalc object) {
  return [object.costPrice, object.storage, object.commission];
}

void _profitabilityCalcAttach(
    IsarCollection<dynamic> col, Id id, ProfitabilityCalc object) {
  object.id = id;
  object.costPrice
      .attach(col, col.isar.collection<CostPrice>(), r'costPrice', id);
  object.storage.attach(col, col.isar.collection<Storage>(), r'storage', id);
  object.commission
      .attach(col, col.isar.collection<Commission>(), r'commission', id);
}

extension ProfitabilityCalcQueryWhereSort
    on QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QWhere> {
  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProfitabilityCalcQueryWhere
    on QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QWhereClause> {
  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterWhereClause>
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

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterWhereClause>
      idBetween(
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

extension ProfitabilityCalcQueryFilter
    on QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QFilterCondition> {
  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
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

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
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

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
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

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      taxEqualTo(
    SimpleTaxationSystem value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      taxGreaterThan(
    SimpleTaxationSystem value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      taxLessThan(
    SimpleTaxationSystem value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      taxBetween(
    SimpleTaxationSystem lower,
    SimpleTaxationSystem upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      taxStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      taxEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      taxContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      taxMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tax',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      taxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tax',
        value: '',
      ));
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      taxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tax',
        value: '',
      ));
    });
  }
}

extension ProfitabilityCalcQueryObject
    on QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QFilterCondition> {
  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      pricing(FilterQuery<Pricing> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pricing');
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      size(FilterQuery<Size> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'size');
    });
  }
}

extension ProfitabilityCalcQueryLinks
    on QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QFilterCondition> {
  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      costPrice(FilterQuery<CostPrice> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'costPrice');
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      costPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'costPrice', 0, true, 0, true);
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      storage(FilterQuery<Storage> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'storage');
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      storageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'storage', 0, true, 0, true);
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      commission(FilterQuery<Commission> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'commission');
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterFilterCondition>
      commissionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'commission', 0, true, 0, true);
    });
  }
}

extension ProfitabilityCalcQuerySortBy
    on QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QSortBy> {
  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterSortBy> sortByTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tax', Sort.asc);
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterSortBy>
      sortByTaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tax', Sort.desc);
    });
  }
}

extension ProfitabilityCalcQuerySortThenBy
    on QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QSortThenBy> {
  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterSortBy> thenByTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tax', Sort.asc);
    });
  }

  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QAfterSortBy>
      thenByTaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tax', Sort.desc);
    });
  }
}

extension ProfitabilityCalcQueryWhereDistinct
    on QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QDistinct> {
  QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QDistinct> distinctByTax(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tax', caseSensitive: caseSensitive);
    });
  }
}

extension ProfitabilityCalcQueryProperty
    on QueryBuilder<ProfitabilityCalc, ProfitabilityCalc, QQueryProperty> {
  QueryBuilder<ProfitabilityCalc, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProfitabilityCalc, Pricing, QQueryOperations> pricingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pricing');
    });
  }

  QueryBuilder<ProfitabilityCalc, Size, QQueryOperations> sizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'size');
    });
  }

  QueryBuilder<ProfitabilityCalc, SimpleTaxationSystem, QQueryOperations>
      taxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tax');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SizeSchema = Schema(
  name: r'Size',
  id: 8468558329950140313,
  properties: {
    r'height': PropertySchema(
      id: 0,
      name: r'height',
      type: IsarType.double,
    ),
    r'length': PropertySchema(
      id: 1,
      name: r'length',
      type: IsarType.double,
    ),
    r'width': PropertySchema(
      id: 2,
      name: r'width',
      type: IsarType.double,
    )
  },
  estimateSize: _sizeEstimateSize,
  serialize: _sizeSerialize,
  deserialize: _sizeDeserialize,
  deserializeProp: _sizeDeserializeProp,
);

int _sizeEstimateSize(
  Size object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _sizeSerialize(
  Size object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.height);
  writer.writeDouble(offsets[1], object.length);
  writer.writeDouble(offsets[2], object.width);
}

Size _sizeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Size();
  object.height = reader.readDouble(offsets[0]);
  object.length = reader.readDouble(offsets[1]);
  object.width = reader.readDouble(offsets[2]);
  return object;
}

P _sizeDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SizeQueryFilter on QueryBuilder<Size, Size, QFilterCondition> {
  QueryBuilder<Size, Size, QAfterFilterCondition> heightEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Size, Size, QAfterFilterCondition> heightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Size, Size, QAfterFilterCondition> heightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Size, Size, QAfterFilterCondition> heightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'height',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Size, Size, QAfterFilterCondition> lengthEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'length',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Size, Size, QAfterFilterCondition> lengthGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'length',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Size, Size, QAfterFilterCondition> lengthLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'length',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Size, Size, QAfterFilterCondition> lengthBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'length',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Size, Size, QAfterFilterCondition> widthEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'width',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Size, Size, QAfterFilterCondition> widthGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'width',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Size, Size, QAfterFilterCondition> widthLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'width',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Size, Size, QAfterFilterCondition> widthBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'width',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension SizeQueryObject on QueryBuilder<Size, Size, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PricingSchema = Schema(
  name: r'Pricing',
  id: 8897751389473275896,
  properties: {
    r'customerPrice': PropertySchema(
      id: 0,
      name: r'customerPrice',
      type: IsarType.double,
    ),
    r'regularCustomerDiscount': PropertySchema(
      id: 1,
      name: r'regularCustomerDiscount',
      type: IsarType.long,
    ),
    r'sellerDiscount': PropertySchema(
      id: 2,
      name: r'sellerDiscount',
      type: IsarType.long,
    )
  },
  estimateSize: _pricingEstimateSize,
  serialize: _pricingSerialize,
  deserialize: _pricingDeserialize,
  deserializeProp: _pricingDeserializeProp,
);

int _pricingEstimateSize(
  Pricing object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _pricingSerialize(
  Pricing object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.customerPrice);
  writer.writeLong(offsets[1], object.regularCustomerDiscount);
  writer.writeLong(offsets[2], object.sellerDiscount);
}

Pricing _pricingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Pricing();
  object.customerPrice = reader.readDouble(offsets[0]);
  object.regularCustomerDiscount = reader.readLong(offsets[1]);
  object.sellerDiscount = reader.readLong(offsets[2]);
  return object;
}

P _pricingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PricingQueryFilter
    on QueryBuilder<Pricing, Pricing, QFilterCondition> {
  QueryBuilder<Pricing, Pricing, QAfterFilterCondition> customerPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pricing, Pricing, QAfterFilterCondition>
      customerPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pricing, Pricing, QAfterFilterCondition> customerPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pricing, Pricing, QAfterFilterCondition> customerPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pricing, Pricing, QAfterFilterCondition>
      regularCustomerDiscountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regularCustomerDiscount',
        value: value,
      ));
    });
  }

  QueryBuilder<Pricing, Pricing, QAfterFilterCondition>
      regularCustomerDiscountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'regularCustomerDiscount',
        value: value,
      ));
    });
  }

  QueryBuilder<Pricing, Pricing, QAfterFilterCondition>
      regularCustomerDiscountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'regularCustomerDiscount',
        value: value,
      ));
    });
  }

  QueryBuilder<Pricing, Pricing, QAfterFilterCondition>
      regularCustomerDiscountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'regularCustomerDiscount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pricing, Pricing, QAfterFilterCondition> sellerDiscountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellerDiscount',
        value: value,
      ));
    });
  }

  QueryBuilder<Pricing, Pricing, QAfterFilterCondition>
      sellerDiscountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellerDiscount',
        value: value,
      ));
    });
  }

  QueryBuilder<Pricing, Pricing, QAfterFilterCondition> sellerDiscountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellerDiscount',
        value: value,
      ));
    });
  }

  QueryBuilder<Pricing, Pricing, QAfterFilterCondition> sellerDiscountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellerDiscount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PricingQueryObject
    on QueryBuilder<Pricing, Pricing, QFilterCondition> {}
