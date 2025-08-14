// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReviewModelCollection on Isar {
  IsarCollection<ReviewModel> get reviewModels => this.collection();
}

const ReviewModelSchema = CollectionSchema(
  name: r'ReviewModel',
  id: -8905752312129106319,
  properties: {
    r'isCorrect': PropertySchema(
      id: 0,
      name: r'isCorrect',
      type: IsarType.bool,
    ),
    r'responseTime': PropertySchema(
      id: 1,
      name: r'responseTime',
      type: IsarType.dateTime,
    ),
    r'reviewDate': PropertySchema(
      id: 2,
      name: r'reviewDate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _reviewModelEstimateSize,
  serialize: _reviewModelSerialize,
  deserialize: _reviewModelDeserialize,
  deserializeProp: _reviewModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'reviewDate': IndexSchema(
      id: -4677418855940269689,
      name: r'reviewDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'reviewDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'isCorrect': IndexSchema(
      id: -5002395475889752354,
      name: r'isCorrect',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isCorrect',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'responseTime': IndexSchema(
      id: 1982183934571212972,
      name: r'responseTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'responseTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'flashcard': LinkSchema(
      id: 6256841161669352396,
      name: r'flashcard',
      target: r'FlashcardModel',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _reviewModelGetId,
  getLinks: _reviewModelGetLinks,
  attach: _reviewModelAttach,
  version: '3.1.0+1',
);

int _reviewModelEstimateSize(
  ReviewModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _reviewModelSerialize(
  ReviewModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isCorrect);
  writer.writeDateTime(offsets[1], object.responseTime);
  writer.writeDateTime(offsets[2], object.reviewDate);
}

ReviewModel _reviewModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReviewModel(
    id: id,
    isCorrect: reader.readBoolOrNull(offsets[0]),
    responseTime: reader.readDateTimeOrNull(offsets[1]),
    reviewDate: reader.readDateTimeOrNull(offsets[2]),
  );
  return object;
}

P _reviewModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reviewModelGetId(ReviewModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _reviewModelGetLinks(ReviewModel object) {
  return [object.flashcard];
}

void _reviewModelAttach(
    IsarCollection<dynamic> col, Id id, ReviewModel object) {
  object.id = id;
  object.flashcard
      .attach(col, col.isar.collection<FlashcardModel>(), r'flashcard', id);
}

extension ReviewModelQueryWhereSort
    on QueryBuilder<ReviewModel, ReviewModel, QWhere> {
  QueryBuilder<ReviewModel, ReviewModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhere> anyReviewDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'reviewDate'),
      );
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhere> anyIsCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isCorrect'),
      );
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhere> anyResponseTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'responseTime'),
      );
    });
  }
}

extension ReviewModelQueryWhere
    on QueryBuilder<ReviewModel, ReviewModel, QWhereClause> {
  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause> reviewDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reviewDate',
        value: [null],
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause>
      reviewDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reviewDate',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause> reviewDateEqualTo(
      DateTime? reviewDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reviewDate',
        value: [reviewDate],
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause>
      reviewDateNotEqualTo(DateTime? reviewDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reviewDate',
              lower: [],
              upper: [reviewDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reviewDate',
              lower: [reviewDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reviewDate',
              lower: [reviewDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reviewDate',
              lower: [],
              upper: [reviewDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause>
      reviewDateGreaterThan(
    DateTime? reviewDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reviewDate',
        lower: [reviewDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause> reviewDateLessThan(
    DateTime? reviewDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reviewDate',
        lower: [],
        upper: [reviewDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause> reviewDateBetween(
    DateTime? lowerReviewDate,
    DateTime? upperReviewDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reviewDate',
        lower: [lowerReviewDate],
        includeLower: includeLower,
        upper: [upperReviewDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause> isCorrectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isCorrect',
        value: [null],
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause>
      isCorrectIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'isCorrect',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause> isCorrectEqualTo(
      bool? isCorrect) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isCorrect',
        value: [isCorrect],
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause> isCorrectNotEqualTo(
      bool? isCorrect) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isCorrect',
              lower: [],
              upper: [isCorrect],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isCorrect',
              lower: [isCorrect],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isCorrect',
              lower: [isCorrect],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isCorrect',
              lower: [],
              upper: [isCorrect],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause>
      responseTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'responseTime',
        value: [null],
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause>
      responseTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'responseTime',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause> responseTimeEqualTo(
      DateTime? responseTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'responseTime',
        value: [responseTime],
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause>
      responseTimeNotEqualTo(DateTime? responseTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'responseTime',
              lower: [],
              upper: [responseTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'responseTime',
              lower: [responseTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'responseTime',
              lower: [responseTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'responseTime',
              lower: [],
              upper: [responseTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause>
      responseTimeGreaterThan(
    DateTime? responseTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'responseTime',
        lower: [responseTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause>
      responseTimeLessThan(
    DateTime? responseTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'responseTime',
        lower: [],
        upper: [responseTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterWhereClause> responseTimeBetween(
    DateTime? lowerResponseTime,
    DateTime? upperResponseTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'responseTime',
        lower: [lowerResponseTime],
        includeLower: includeLower,
        upper: [upperResponseTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ReviewModelQueryFilter
    on QueryBuilder<ReviewModel, ReviewModel, QFilterCondition> {
  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition>
      isCorrectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isCorrect',
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition>
      isCorrectIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isCorrect',
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition>
      isCorrectEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCorrect',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition>
      responseTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'responseTime',
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition>
      responseTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'responseTime',
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition>
      responseTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'responseTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition>
      responseTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'responseTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition>
      responseTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'responseTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition>
      responseTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'responseTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition>
      reviewDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reviewDate',
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition>
      reviewDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reviewDate',
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition>
      reviewDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reviewDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition>
      reviewDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reviewDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition>
      reviewDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reviewDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition>
      reviewDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reviewDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ReviewModelQueryObject
    on QueryBuilder<ReviewModel, ReviewModel, QFilterCondition> {}

extension ReviewModelQueryLinks
    on QueryBuilder<ReviewModel, ReviewModel, QFilterCondition> {
  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition> flashcard(
      FilterQuery<FlashcardModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'flashcard');
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterFilterCondition>
      flashcardIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'flashcard', 0, true, 0, true);
    });
  }
}

extension ReviewModelQuerySortBy
    on QueryBuilder<ReviewModel, ReviewModel, QSortBy> {
  QueryBuilder<ReviewModel, ReviewModel, QAfterSortBy> sortByIsCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCorrect', Sort.asc);
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterSortBy> sortByIsCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCorrect', Sort.desc);
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterSortBy> sortByResponseTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseTime', Sort.asc);
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterSortBy>
      sortByResponseTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseTime', Sort.desc);
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterSortBy> sortByReviewDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewDate', Sort.asc);
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterSortBy> sortByReviewDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewDate', Sort.desc);
    });
  }
}

extension ReviewModelQuerySortThenBy
    on QueryBuilder<ReviewModel, ReviewModel, QSortThenBy> {
  QueryBuilder<ReviewModel, ReviewModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterSortBy> thenByIsCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCorrect', Sort.asc);
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterSortBy> thenByIsCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCorrect', Sort.desc);
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterSortBy> thenByResponseTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseTime', Sort.asc);
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterSortBy>
      thenByResponseTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseTime', Sort.desc);
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterSortBy> thenByReviewDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewDate', Sort.asc);
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QAfterSortBy> thenByReviewDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewDate', Sort.desc);
    });
  }
}

extension ReviewModelQueryWhereDistinct
    on QueryBuilder<ReviewModel, ReviewModel, QDistinct> {
  QueryBuilder<ReviewModel, ReviewModel, QDistinct> distinctByIsCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCorrect');
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QDistinct> distinctByResponseTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'responseTime');
    });
  }

  QueryBuilder<ReviewModel, ReviewModel, QDistinct> distinctByReviewDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reviewDate');
    });
  }
}

extension ReviewModelQueryProperty
    on QueryBuilder<ReviewModel, ReviewModel, QQueryProperty> {
  QueryBuilder<ReviewModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReviewModel, bool?, QQueryOperations> isCorrectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCorrect');
    });
  }

  QueryBuilder<ReviewModel, DateTime?, QQueryOperations>
      responseTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'responseTime');
    });
  }

  QueryBuilder<ReviewModel, DateTime?, QQueryOperations> reviewDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reviewDate');
    });
  }
}
