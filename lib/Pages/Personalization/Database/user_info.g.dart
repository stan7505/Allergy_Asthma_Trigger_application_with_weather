// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDatabaseCollection on Isar {
  IsarCollection<Database> get databases => this.collection();
}

const DatabaseSchema = CollectionSchema(
  name: r'Database',
  id: 8138181099257705150,
  properties: {
    r'allergens': PropertySchema(
      id: 0,
      name: r'allergens',
      type: IsarType.stringList,
    )
  },
  estimateSize: _databaseEstimateSize,
  serialize: _databaseSerialize,
  deserialize: _databaseDeserialize,
  deserializeProp: _databaseDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _databaseGetId,
  getLinks: _databaseGetLinks,
  attach: _databaseAttach,
  version: '3.1.0+1',
);

int _databaseEstimateSize(
  Database object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.allergens.length * 3;
  {
    for (var i = 0; i < object.allergens.length; i++) {
      final value = object.allergens[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _databaseSerialize(
  Database object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.allergens);
}

Database _databaseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Database();
  object.allergens = reader.readStringList(offsets[0]) ?? [];
  object.id = id;
  return object;
}

P _databaseDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _databaseGetId(Database object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _databaseGetLinks(Database object) {
  return [];
}

void _databaseAttach(IsarCollection<dynamic> col, Id id, Database object) {
  object.id = id;
}

extension DatabaseQueryWhereSort on QueryBuilder<Database, Database, QWhere> {
  QueryBuilder<Database, Database, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DatabaseQueryWhere on QueryBuilder<Database, Database, QWhereClause> {
  QueryBuilder<Database, Database, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Database, Database, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Database, Database, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Database, Database, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Database, Database, QAfterWhereClause> idBetween(
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

extension DatabaseQueryFilter
    on QueryBuilder<Database, Database, QFilterCondition> {
  QueryBuilder<Database, Database, QAfterFilterCondition>
      allergensElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allergens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition>
      allergensElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allergens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition>
      allergensElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allergens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition>
      allergensElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allergens',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition>
      allergensElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'allergens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition>
      allergensElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'allergens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition>
      allergensElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'allergens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition>
      allergensElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'allergens',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition>
      allergensElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allergens',
        value: '',
      ));
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition>
      allergensElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'allergens',
        value: '',
      ));
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition>
      allergensLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allergens',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition> allergensIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allergens',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition>
      allergensIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allergens',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition>
      allergensLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allergens',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition>
      allergensLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allergens',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition>
      allergensLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allergens',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Database, Database, QAfterFilterCondition> idGreaterThan(
    Id value, {
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

  QueryBuilder<Database, Database, QAfterFilterCondition> idLessThan(
    Id value, {
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

  QueryBuilder<Database, Database, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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
}

extension DatabaseQueryObject
    on QueryBuilder<Database, Database, QFilterCondition> {}

extension DatabaseQueryLinks
    on QueryBuilder<Database, Database, QFilterCondition> {}

extension DatabaseQuerySortBy on QueryBuilder<Database, Database, QSortBy> {}

extension DatabaseQuerySortThenBy
    on QueryBuilder<Database, Database, QSortThenBy> {
  QueryBuilder<Database, Database, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Database, Database, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension DatabaseQueryWhereDistinct
    on QueryBuilder<Database, Database, QDistinct> {
  QueryBuilder<Database, Database, QDistinct> distinctByAllergens() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allergens');
    });
  }
}

extension DatabaseQueryProperty
    on QueryBuilder<Database, Database, QQueryProperty> {
  QueryBuilder<Database, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Database, List<String>, QQueryOperations> allergensProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allergens');
    });
  }
}
