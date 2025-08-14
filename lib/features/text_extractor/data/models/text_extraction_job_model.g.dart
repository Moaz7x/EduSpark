// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_extraction_job_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTextExtractionJobModelCollection on Isar {
  IsarCollection<TextExtractionJobModel> get textExtractionJobModels =>
      this.collection();
}

const TextExtractionJobModelSchema = CollectionSchema(
  name: r'TextExtractionJobModel',
  id: -2121747277484988444,
  properties: {
    r'completedAt': PropertySchema(
      id: 0,
      name: r'completedAt',
      type: IsarType.string,
    ),
    r'errorMessage': PropertySchema(
      id: 1,
      name: r'errorMessage',
      type: IsarType.string,
    ),
    r'jobId': PropertySchema(
      id: 2,
      name: r'jobId',
      type: IsarType.long,
    ),
    r'jobStatus': PropertySchema(
      id: 3,
      name: r'jobStatus',
      type: IsarType.string,
    ),
    r'jobType': PropertySchema(
      id: 4,
      name: r'jobType',
      type: IsarType.string,
    ),
    r'requestedAt': PropertySchema(
      id: 5,
      name: r'requestedAt',
      type: IsarType.string,
    )
  },
  estimateSize: _textExtractionJobModelEstimateSize,
  serialize: _textExtractionJobModelSerialize,
  deserialize: _textExtractionJobModelDeserialize,
  deserializeProp: _textExtractionJobModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'jobType': IndexSchema(
      id: -5460536146469517222,
      name: r'jobType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'jobType',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'jobStatus': IndexSchema(
      id: 7486646470085954131,
      name: r'jobStatus',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'jobStatus',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'requestedAt': IndexSchema(
      id: 2054771113861617119,
      name: r'requestedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'requestedAt',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'completedAt': IndexSchema(
      id: -3156591011457686752,
      name: r'completedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'completedAt',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'errorMessage': IndexSchema(
      id: 3915385398363382667,
      name: r'errorMessage',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'errorMessage',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'mediaSource': LinkSchema(
      id: -6140372764594224206,
      name: r'mediaSource',
      target: r'MediaSourceModel',
      single: true,
    ),
    r'extractedtexts': LinkSchema(
      id: 76045823427648195,
      name: r'extractedtexts',
      target: r'ExtractedTextModel',
      single: false,
      linkName: r'textExtractionJob',
    )
  },
  embeddedSchemas: {},
  getId: _textExtractionJobModelGetId,
  getLinks: _textExtractionJobModelGetLinks,
  attach: _textExtractionJobModelAttach,
  version: '3.1.0+1',
);

int _textExtractionJobModelEstimateSize(
  TextExtractionJobModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.completedAt.length * 3;
  bytesCount += 3 + object.errorMessage.length * 3;
  bytesCount += 3 + object.jobStatus.length * 3;
  bytesCount += 3 + object.jobType.length * 3;
  bytesCount += 3 + object.requestedAt.length * 3;
  return bytesCount;
}

void _textExtractionJobModelSerialize(
  TextExtractionJobModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.completedAt);
  writer.writeString(offsets[1], object.errorMessage);
  writer.writeLong(offsets[2], object.jobId);
  writer.writeString(offsets[3], object.jobStatus);
  writer.writeString(offsets[4], object.jobType);
  writer.writeString(offsets[5], object.requestedAt);
}

TextExtractionJobModel _textExtractionJobModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TextExtractionJobModel(
    completedAt: reader.readString(offsets[0]),
    errorMessage: reader.readString(offsets[1]),
    id: id,
    jobId: reader.readLong(offsets[2]),
    jobStatus: reader.readString(offsets[3]),
    jobType: reader.readString(offsets[4]),
    requestedAt: reader.readString(offsets[5]),
  );
  return object;
}

P _textExtractionJobModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _textExtractionJobModelGetId(TextExtractionJobModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _textExtractionJobModelGetLinks(
    TextExtractionJobModel object) {
  return [object.mediaSource, object.extractedtexts];
}

void _textExtractionJobModelAttach(
    IsarCollection<dynamic> col, Id id, TextExtractionJobModel object) {
  object.id = id;
  object.mediaSource
      .attach(col, col.isar.collection<MediaSourceModel>(), r'mediaSource', id);
  object.extractedtexts.attach(
      col, col.isar.collection<ExtractedTextModel>(), r'extractedtexts', id);
}

extension TextExtractionJobModelQueryWhereSort
    on QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QWhere> {
  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterWhere>
      anyRequestedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'requestedAt'),
      );
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterWhere>
      anyCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'completedAt'),
      );
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterWhere>
      anyErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'errorMessage'),
      );
    });
  }
}

extension TextExtractionJobModelQueryWhere on QueryBuilder<
    TextExtractionJobModel, TextExtractionJobModel, QWhereClause> {
  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> idBetween(
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

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> jobTypeEqualTo(String jobType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'jobType',
        value: [jobType],
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> jobTypeNotEqualTo(String jobType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'jobType',
              lower: [],
              upper: [jobType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'jobType',
              lower: [jobType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'jobType',
              lower: [jobType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'jobType',
              lower: [],
              upper: [jobType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> jobStatusEqualTo(String jobStatus) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'jobStatus',
        value: [jobStatus],
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> jobStatusNotEqualTo(String jobStatus) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'jobStatus',
              lower: [],
              upper: [jobStatus],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'jobStatus',
              lower: [jobStatus],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'jobStatus',
              lower: [jobStatus],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'jobStatus',
              lower: [],
              upper: [jobStatus],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> requestedAtEqualTo(String requestedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'requestedAt',
        value: [requestedAt],
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> requestedAtNotEqualTo(String requestedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'requestedAt',
              lower: [],
              upper: [requestedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'requestedAt',
              lower: [requestedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'requestedAt',
              lower: [requestedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'requestedAt',
              lower: [],
              upper: [requestedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> requestedAtGreaterThan(
    String requestedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'requestedAt',
        lower: [requestedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> requestedAtLessThan(
    String requestedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'requestedAt',
        lower: [],
        upper: [requestedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> requestedAtBetween(
    String lowerRequestedAt,
    String upperRequestedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'requestedAt',
        lower: [lowerRequestedAt],
        includeLower: includeLower,
        upper: [upperRequestedAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> requestedAtStartsWith(String RequestedAtPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'requestedAt',
        lower: [RequestedAtPrefix],
        upper: ['$RequestedAtPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> requestedAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'requestedAt',
        value: [''],
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> requestedAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'requestedAt',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'requestedAt',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'requestedAt',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'requestedAt',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> completedAtEqualTo(String completedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'completedAt',
        value: [completedAt],
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> completedAtNotEqualTo(String completedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completedAt',
              lower: [],
              upper: [completedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completedAt',
              lower: [completedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completedAt',
              lower: [completedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completedAt',
              lower: [],
              upper: [completedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> completedAtGreaterThan(
    String completedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'completedAt',
        lower: [completedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> completedAtLessThan(
    String completedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'completedAt',
        lower: [],
        upper: [completedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> completedAtBetween(
    String lowerCompletedAt,
    String upperCompletedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'completedAt',
        lower: [lowerCompletedAt],
        includeLower: includeLower,
        upper: [upperCompletedAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> completedAtStartsWith(String CompletedAtPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'completedAt',
        lower: [CompletedAtPrefix],
        upper: ['$CompletedAtPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> completedAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'completedAt',
        value: [''],
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> completedAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'completedAt',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'completedAt',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'completedAt',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'completedAt',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> errorMessageEqualTo(String errorMessage) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'errorMessage',
        value: [errorMessage],
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> errorMessageNotEqualTo(String errorMessage) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'errorMessage',
              lower: [],
              upper: [errorMessage],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'errorMessage',
              lower: [errorMessage],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'errorMessage',
              lower: [errorMessage],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'errorMessage',
              lower: [],
              upper: [errorMessage],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> errorMessageGreaterThan(
    String errorMessage, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'errorMessage',
        lower: [errorMessage],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> errorMessageLessThan(
    String errorMessage, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'errorMessage',
        lower: [],
        upper: [errorMessage],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> errorMessageBetween(
    String lowerErrorMessage,
    String upperErrorMessage, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'errorMessage',
        lower: [lowerErrorMessage],
        includeLower: includeLower,
        upper: [upperErrorMessage],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> errorMessageStartsWith(String ErrorMessagePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'errorMessage',
        lower: [ErrorMessagePrefix],
        upper: ['$ErrorMessagePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> errorMessageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'errorMessage',
        value: [''],
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterWhereClause> errorMessageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'errorMessage',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'errorMessage',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'errorMessage',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'errorMessage',
              upper: [''],
            ));
      }
    });
  }
}

extension TextExtractionJobModelQueryFilter on QueryBuilder<
    TextExtractionJobModel, TextExtractionJobModel, QFilterCondition> {
  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> completedAtEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> completedAtGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> completedAtLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> completedAtBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> completedAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'completedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> completedAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'completedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
          QAfterFilterCondition>
      completedAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'completedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
          QAfterFilterCondition>
      completedAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'completedAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> completedAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: '',
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> completedAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'completedAt',
        value: '',
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> errorMessageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> errorMessageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> errorMessageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> errorMessageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'errorMessage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> errorMessageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> errorMessageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
          QAfterFilterCondition>
      errorMessageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
          QAfterFilterCondition>
      errorMessageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'errorMessage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> errorMessageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> errorMessageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobId',
        value: value,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobId',
        value: value,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobId',
        value: value,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobStatusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobStatusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobStatusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobStatusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
          QAfterFilterCondition>
      jobStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
          QAfterFilterCondition>
      jobStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
          QAfterFilterCondition>
      jobTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
          QAfterFilterCondition>
      jobTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobType',
        value: '',
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> jobTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobType',
        value: '',
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> requestedAtEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requestedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> requestedAtGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'requestedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> requestedAtLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'requestedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> requestedAtBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'requestedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> requestedAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'requestedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> requestedAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'requestedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
          QAfterFilterCondition>
      requestedAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'requestedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
          QAfterFilterCondition>
      requestedAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'requestedAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> requestedAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requestedAt',
        value: '',
      ));
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> requestedAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'requestedAt',
        value: '',
      ));
    });
  }
}

extension TextExtractionJobModelQueryObject on QueryBuilder<
    TextExtractionJobModel, TextExtractionJobModel, QFilterCondition> {}

extension TextExtractionJobModelQueryLinks on QueryBuilder<
    TextExtractionJobModel, TextExtractionJobModel, QFilterCondition> {
  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> mediaSource(FilterQuery<MediaSourceModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'mediaSource');
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> mediaSourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mediaSource', 0, true, 0, true);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> extractedtexts(FilterQuery<ExtractedTextModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'extractedtexts');
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> extractedtextsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'extractedtexts', length, true, length, true);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> extractedtextsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'extractedtexts', 0, true, 0, true);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> extractedtextsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'extractedtexts', 0, false, 999999, true);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> extractedtextsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'extractedtexts', 0, true, length, include);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> extractedtextsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'extractedtexts', length, include, 999999, true);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel,
      QAfterFilterCondition> extractedtextsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'extractedtexts', lower, includeLower, upper, includeUpper);
    });
  }
}

extension TextExtractionJobModelQuerySortBy
    on QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QSortBy> {
  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      sortByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      sortByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      sortByJobId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobId', Sort.asc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      sortByJobIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobId', Sort.desc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      sortByJobStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobStatus', Sort.asc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      sortByJobStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobStatus', Sort.desc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      sortByJobType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobType', Sort.asc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      sortByJobTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobType', Sort.desc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      sortByRequestedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedAt', Sort.asc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      sortByRequestedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedAt', Sort.desc);
    });
  }
}

extension TextExtractionJobModelQuerySortThenBy on QueryBuilder<
    TextExtractionJobModel, TextExtractionJobModel, QSortThenBy> {
  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      thenByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      thenByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      thenByJobId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobId', Sort.asc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      thenByJobIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobId', Sort.desc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      thenByJobStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobStatus', Sort.asc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      thenByJobStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobStatus', Sort.desc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      thenByJobType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobType', Sort.asc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      thenByJobTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobType', Sort.desc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      thenByRequestedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedAt', Sort.asc);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QAfterSortBy>
      thenByRequestedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedAt', Sort.desc);
    });
  }
}

extension TextExtractionJobModelQueryWhereDistinct
    on QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QDistinct> {
  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QDistinct>
      distinctByCompletedAt({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QDistinct>
      distinctByErrorMessage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorMessage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QDistinct>
      distinctByJobId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobId');
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QDistinct>
      distinctByJobStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QDistinct>
      distinctByJobType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TextExtractionJobModel, TextExtractionJobModel, QDistinct>
      distinctByRequestedAt({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requestedAt', caseSensitive: caseSensitive);
    });
  }
}

extension TextExtractionJobModelQueryProperty on QueryBuilder<
    TextExtractionJobModel, TextExtractionJobModel, QQueryProperty> {
  QueryBuilder<TextExtractionJobModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TextExtractionJobModel, String, QQueryOperations>
      completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<TextExtractionJobModel, String, QQueryOperations>
      errorMessageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorMessage');
    });
  }

  QueryBuilder<TextExtractionJobModel, int, QQueryOperations> jobIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobId');
    });
  }

  QueryBuilder<TextExtractionJobModel, String, QQueryOperations>
      jobStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobStatus');
    });
  }

  QueryBuilder<TextExtractionJobModel, String, QQueryOperations>
      jobTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobType');
    });
  }

  QueryBuilder<TextExtractionJobModel, String, QQueryOperations>
      requestedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requestedAt');
    });
  }
}
