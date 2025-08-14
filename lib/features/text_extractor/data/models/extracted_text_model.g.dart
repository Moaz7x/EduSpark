// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extracted_text_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetExtractedTextModelCollection on Isar {
  IsarCollection<ExtractedTextModel> get extractedTextModels =>
      this.collection();
}

const ExtractedTextModelSchema = CollectionSchema(
  name: r'ExtractedTextModel',
  id: 737373226885559187,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'isApproved': PropertySchema(
      id: 1,
      name: r'isApproved',
      type: IsarType.bool,
    ),
    r'isReviewed': PropertySchema(
      id: 2,
      name: r'isReviewed',
      type: IsarType.bool,
    ),
    r'language': PropertySchema(
      id: 3,
      name: r'language',
      type: IsarType.string,
    ),
    r'textContent': PropertySchema(
      id: 4,
      name: r'textContent',
      type: IsarType.string,
    ),
    r'textId': PropertySchema(
      id: 5,
      name: r'textId',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _extractedTextModelEstimateSize,
  serialize: _extractedTextModelSerialize,
  deserialize: _extractedTextModelDeserialize,
  deserializeProp: _extractedTextModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'textContent': IndexSchema(
      id: 1990746073331052909,
      name: r'textContent',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'textContent',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'language': IndexSchema(
      id: -1161120539689460177,
      name: r'language',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'language',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'isReviewed': IndexSchema(
      id: 463194079450348758,
      name: r'isReviewed',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isReviewed',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'isApproved': IndexSchema(
      id: -2896987885495413198,
      name: r'isApproved',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isApproved',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'updatedAt': IndexSchema(
      id: -6238191080293565125,
      name: r'updatedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'updatedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'textExtractionJob': LinkSchema(
      id: -4115981460545209143,
      name: r'textExtractionJob',
      target: r'TextExtractionJobModel',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _extractedTextModelGetId,
  getLinks: _extractedTextModelGetLinks,
  attach: _extractedTextModelAttach,
  version: '3.1.0+1',
);

int _extractedTextModelEstimateSize(
  ExtractedTextModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.language.length * 3;
  bytesCount += 3 + object.textContent.length * 3;
  return bytesCount;
}

void _extractedTextModelSerialize(
  ExtractedTextModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeBool(offsets[1], object.isApproved);
  writer.writeBool(offsets[2], object.isReviewed);
  writer.writeString(offsets[3], object.language);
  writer.writeString(offsets[4], object.textContent);
  writer.writeLong(offsets[5], object.textId);
  writer.writeDateTime(offsets[6], object.updatedAt);
}

ExtractedTextModel _extractedTextModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExtractedTextModel(
    createdAt: reader.readDateTime(offsets[0]),
    id: id,
    isApproved: reader.readBoolOrNull(offsets[1]),
    isReviewed: reader.readBoolOrNull(offsets[2]),
    language: reader.readString(offsets[3]),
    textContent: reader.readString(offsets[4]),
    textId: reader.readLong(offsets[5]),
    updatedAt: reader.readDateTimeOrNull(offsets[6]),
  );
  return object;
}

P _extractedTextModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _extractedTextModelGetId(ExtractedTextModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _extractedTextModelGetLinks(
    ExtractedTextModel object) {
  return [object.textExtractionJob];
}

void _extractedTextModelAttach(
    IsarCollection<dynamic> col, Id id, ExtractedTextModel object) {
  object.id = id;
  object.textExtractionJob.attach(col,
      col.isar.collection<TextExtractionJobModel>(), r'textExtractionJob', id);
}

extension ExtractedTextModelQueryWhereSort
    on QueryBuilder<ExtractedTextModel, ExtractedTextModel, QWhere> {
  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhere>
      anyTextContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'textContent'),
      );
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhere>
      anyLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'language'),
      );
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhere>
      anyIsReviewed() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isReviewed'),
      );
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhere>
      anyIsApproved() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isApproved'),
      );
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhere>
      anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhere>
      anyUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'updatedAt'),
      );
    });
  }
}

extension ExtractedTextModelQueryWhere
    on QueryBuilder<ExtractedTextModel, ExtractedTextModel, QWhereClause> {
  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
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

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
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

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      textContentEqualTo(String textContent) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'textContent',
        value: [textContent],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      textContentNotEqualTo(String textContent) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textContent',
              lower: [],
              upper: [textContent],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textContent',
              lower: [textContent],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textContent',
              lower: [textContent],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textContent',
              lower: [],
              upper: [textContent],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      textContentGreaterThan(
    String textContent, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textContent',
        lower: [textContent],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      textContentLessThan(
    String textContent, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textContent',
        lower: [],
        upper: [textContent],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      textContentBetween(
    String lowerTextContent,
    String upperTextContent, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textContent',
        lower: [lowerTextContent],
        includeLower: includeLower,
        upper: [upperTextContent],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      textContentStartsWith(String TextContentPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textContent',
        lower: [TextContentPrefix],
        upper: ['$TextContentPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      textContentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'textContent',
        value: [''],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      textContentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'textContent',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'textContent',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'textContent',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'textContent',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      languageEqualTo(String language) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'language',
        value: [language],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      languageNotEqualTo(String language) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'language',
              lower: [],
              upper: [language],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'language',
              lower: [language],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'language',
              lower: [language],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'language',
              lower: [],
              upper: [language],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      languageGreaterThan(
    String language, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'language',
        lower: [language],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      languageLessThan(
    String language, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'language',
        lower: [],
        upper: [language],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      languageBetween(
    String lowerLanguage,
    String upperLanguage, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'language',
        lower: [lowerLanguage],
        includeLower: includeLower,
        upper: [upperLanguage],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      languageStartsWith(String LanguagePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'language',
        lower: [LanguagePrefix],
        upper: ['$LanguagePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      languageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'language',
        value: [''],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      languageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'language',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'language',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'language',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'language',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      isReviewedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isReviewed',
        value: [null],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      isReviewedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'isReviewed',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      isReviewedEqualTo(bool? isReviewed) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isReviewed',
        value: [isReviewed],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      isReviewedNotEqualTo(bool? isReviewed) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isReviewed',
              lower: [],
              upper: [isReviewed],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isReviewed',
              lower: [isReviewed],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isReviewed',
              lower: [isReviewed],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isReviewed',
              lower: [],
              upper: [isReviewed],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      isApprovedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isApproved',
        value: [null],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      isApprovedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'isApproved',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      isApprovedEqualTo(bool? isApproved) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isApproved',
        value: [isApproved],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      isApprovedNotEqualTo(bool? isApproved) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isApproved',
              lower: [],
              upper: [isApproved],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isApproved',
              lower: [isApproved],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isApproved',
              lower: [isApproved],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isApproved',
              lower: [],
              upper: [isApproved],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      createdAtNotEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      createdAtGreaterThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      createdAtLessThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updatedAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      updatedAtEqualTo(DateTime? updatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updatedAt',
        value: [updatedAt],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      updatedAtNotEqualTo(DateTime? updatedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [],
              upper: [updatedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [updatedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [updatedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [],
              upper: [updatedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      updatedAtGreaterThan(
    DateTime? updatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [updatedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      updatedAtLessThan(
    DateTime? updatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [],
        upper: [updatedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterWhereClause>
      updatedAtBetween(
    DateTime? lowerUpdatedAt,
    DateTime? upperUpdatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [lowerUpdatedAt],
        includeLower: includeLower,
        upper: [upperUpdatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ExtractedTextModelQueryFilter
    on QueryBuilder<ExtractedTextModel, ExtractedTextModel, QFilterCondition> {
  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
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

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
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

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
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

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      isApprovedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isApproved',
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      isApprovedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isApproved',
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      isApprovedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isApproved',
        value: value,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      isReviewedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isReviewed',
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      isReviewedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isReviewed',
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      isReviewedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReviewed',
        value: value,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      languageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      languageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      languageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      languageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      languageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      languageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      languageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      languageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'language',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      languageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      languageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      textContentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      textContentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'textContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      textContentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'textContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      textContentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'textContent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      textContentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'textContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      textContentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'textContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      textContentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'textContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      textContentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'textContent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      textContentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textContent',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      textContentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'textContent',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      textIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textId',
        value: value,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      textIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'textId',
        value: value,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      textIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'textId',
        value: value,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      textIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'textId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ExtractedTextModelQueryObject
    on QueryBuilder<ExtractedTextModel, ExtractedTextModel, QFilterCondition> {}

extension ExtractedTextModelQueryLinks
    on QueryBuilder<ExtractedTextModel, ExtractedTextModel, QFilterCondition> {
  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      textExtractionJob(FilterQuery<TextExtractionJobModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'textExtractionJob');
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterFilterCondition>
      textExtractionJobIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'textExtractionJob', 0, true, 0, true);
    });
  }
}

extension ExtractedTextModelQuerySortBy
    on QueryBuilder<ExtractedTextModel, ExtractedTextModel, QSortBy> {
  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      sortByIsApproved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isApproved', Sort.asc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      sortByIsApprovedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isApproved', Sort.desc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      sortByIsReviewed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReviewed', Sort.asc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      sortByIsReviewedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReviewed', Sort.desc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      sortByTextContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textContent', Sort.asc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      sortByTextContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textContent', Sort.desc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      sortByTextId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textId', Sort.asc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      sortByTextIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textId', Sort.desc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ExtractedTextModelQuerySortThenBy
    on QueryBuilder<ExtractedTextModel, ExtractedTextModel, QSortThenBy> {
  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      thenByIsApproved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isApproved', Sort.asc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      thenByIsApprovedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isApproved', Sort.desc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      thenByIsReviewed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReviewed', Sort.asc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      thenByIsReviewedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReviewed', Sort.desc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      thenByTextContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textContent', Sort.asc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      thenByTextContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textContent', Sort.desc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      thenByTextId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textId', Sort.asc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      thenByTextIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textId', Sort.desc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ExtractedTextModelQueryWhereDistinct
    on QueryBuilder<ExtractedTextModel, ExtractedTextModel, QDistinct> {
  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QDistinct>
      distinctByIsApproved() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isApproved');
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QDistinct>
      distinctByIsReviewed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isReviewed');
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QDistinct>
      distinctByLanguage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QDistinct>
      distinctByTextContent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'textContent', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QDistinct>
      distinctByTextId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'textId');
    });
  }

  QueryBuilder<ExtractedTextModel, ExtractedTextModel, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension ExtractedTextModelQueryProperty
    on QueryBuilder<ExtractedTextModel, ExtractedTextModel, QQueryProperty> {
  QueryBuilder<ExtractedTextModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ExtractedTextModel, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ExtractedTextModel, bool?, QQueryOperations>
      isApprovedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isApproved');
    });
  }

  QueryBuilder<ExtractedTextModel, bool?, QQueryOperations>
      isReviewedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isReviewed');
    });
  }

  QueryBuilder<ExtractedTextModel, String, QQueryOperations>
      languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<ExtractedTextModel, String, QQueryOperations>
      textContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textContent');
    });
  }

  QueryBuilder<ExtractedTextModel, int, QQueryOperations> textIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textId');
    });
  }

  QueryBuilder<ExtractedTextModel, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
