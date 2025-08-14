// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_tag_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFlashcardTagModelCollection on Isar {
  IsarCollection<FlashcardTagModel> get flashcardTagModels => this.collection();
}

const FlashcardTagModelSchema = CollectionSchema(
  name: r'FlashcardTagModel',
  id: 6076869110523411204,
  properties: {
    r'tagName': PropertySchema(
      id: 0,
      name: r'tagName',
      type: IsarType.string,
    )
  },
  estimateSize: _flashcardTagModelEstimateSize,
  serialize: _flashcardTagModelSerialize,
  deserialize: _flashcardTagModelDeserialize,
  deserializeProp: _flashcardTagModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'flashcard': LinkSchema(
      id: 1899902854796350116,
      name: r'flashcard',
      target: r'FlashcardModel',
      single: true,
    ),
    r'tag': LinkSchema(
      id: 7176509320173779210,
      name: r'tag',
      target: r'TagModel',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _flashcardTagModelGetId,
  getLinks: _flashcardTagModelGetLinks,
  attach: _flashcardTagModelAttach,
  version: '3.1.0+1',
);

int _flashcardTagModelEstimateSize(
  FlashcardTagModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.tagName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _flashcardTagModelSerialize(
  FlashcardTagModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.tagName);
}

FlashcardTagModel _flashcardTagModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FlashcardTagModel(
    id: id,
    tagName: reader.readStringOrNull(offsets[0]),
  );
  return object;
}

P _flashcardTagModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _flashcardTagModelGetId(FlashcardTagModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _flashcardTagModelGetLinks(
    FlashcardTagModel object) {
  return [object.flashcard, object.tag];
}

void _flashcardTagModelAttach(
    IsarCollection<dynamic> col, Id id, FlashcardTagModel object) {
  object.id = id;
  object.flashcard
      .attach(col, col.isar.collection<FlashcardModel>(), r'flashcard', id);
  object.tag.attach(col, col.isar.collection<TagModel>(), r'tag', id);
}

extension FlashcardTagModelQueryWhereSort
    on QueryBuilder<FlashcardTagModel, FlashcardTagModel, QWhere> {
  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FlashcardTagModelQueryWhere
    on QueryBuilder<FlashcardTagModel, FlashcardTagModel, QWhereClause> {
  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterWhereClause>
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

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterWhereClause>
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

extension FlashcardTagModelQueryFilter
    on QueryBuilder<FlashcardTagModel, FlashcardTagModel, QFilterCondition> {
  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
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

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
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

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
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

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      tagNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tagName',
      ));
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      tagNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tagName',
      ));
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      tagNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      tagNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tagName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      tagNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tagName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      tagNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tagName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      tagNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tagName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      tagNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tagName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      tagNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tagName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      tagNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tagName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      tagNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagName',
        value: '',
      ));
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      tagNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tagName',
        value: '',
      ));
    });
  }
}

extension FlashcardTagModelQueryObject
    on QueryBuilder<FlashcardTagModel, FlashcardTagModel, QFilterCondition> {}

extension FlashcardTagModelQueryLinks
    on QueryBuilder<FlashcardTagModel, FlashcardTagModel, QFilterCondition> {
  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      flashcard(FilterQuery<FlashcardModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'flashcard');
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      flashcardIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'flashcard', 0, true, 0, true);
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition> tag(
      FilterQuery<TagModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tag');
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterFilterCondition>
      tagIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tag', 0, true, 0, true);
    });
  }
}

extension FlashcardTagModelQuerySortBy
    on QueryBuilder<FlashcardTagModel, FlashcardTagModel, QSortBy> {
  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterSortBy>
      sortByTagName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagName', Sort.asc);
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterSortBy>
      sortByTagNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagName', Sort.desc);
    });
  }
}

extension FlashcardTagModelQuerySortThenBy
    on QueryBuilder<FlashcardTagModel, FlashcardTagModel, QSortThenBy> {
  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterSortBy>
      thenByTagName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagName', Sort.asc);
    });
  }

  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QAfterSortBy>
      thenByTagNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagName', Sort.desc);
    });
  }
}

extension FlashcardTagModelQueryWhereDistinct
    on QueryBuilder<FlashcardTagModel, FlashcardTagModel, QDistinct> {
  QueryBuilder<FlashcardTagModel, FlashcardTagModel, QDistinct>
      distinctByTagName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tagName', caseSensitive: caseSensitive);
    });
  }
}

extension FlashcardTagModelQueryProperty
    on QueryBuilder<FlashcardTagModel, FlashcardTagModel, QQueryProperty> {
  QueryBuilder<FlashcardTagModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FlashcardTagModel, String?, QQueryOperations> tagNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tagName');
    });
  }
}
