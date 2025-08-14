// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStatisticsModelCollection on Isar {
  IsarCollection<StatisticsModel> get statisticsModels => this.collection();
}

const StatisticsModelSchema = CollectionSchema(
  name: r'StatisticsModel',
  id: 8693150945338181073,
  properties: {
    r'lastSessionAt': PropertySchema(
      id: 0,
      name: r'lastSessionAt',
      type: IsarType.string,
    ),
    r'statId': PropertySchema(
      id: 1,
      name: r'statId',
      type: IsarType.long,
    ),
    r'totalBreakTimeMinutes': PropertySchema(
      id: 2,
      name: r'totalBreakTimeMinutes',
      type: IsarType.dateTime,
    ),
    r'totalFocusTimeMinutes': PropertySchema(
      id: 3,
      name: r'totalFocusTimeMinutes',
      type: IsarType.dateTime,
    ),
    r'totalPomodorosCompleted': PropertySchema(
      id: 4,
      name: r'totalPomodorosCompleted',
      type: IsarType.string,
    )
  },
  estimateSize: _statisticsModelEstimateSize,
  serialize: _statisticsModelSerialize,
  deserialize: _statisticsModelDeserialize,
  deserializeProp: _statisticsModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'totalPomodorosCompleted': IndexSchema(
      id: -8078212841588927391,
      name: r'totalPomodorosCompleted',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'totalPomodorosCompleted',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'totalFocusTimeMinutes': IndexSchema(
      id: 3233941474360964320,
      name: r'totalFocusTimeMinutes',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'totalFocusTimeMinutes',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'totalBreakTimeMinutes': IndexSchema(
      id: -7485944934540774578,
      name: r'totalBreakTimeMinutes',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'totalBreakTimeMinutes',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'lastSessionAt': IndexSchema(
      id: 6947258183129846969,
      name: r'lastSessionAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastSessionAt',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _statisticsModelGetId,
  getLinks: _statisticsModelGetLinks,
  attach: _statisticsModelAttach,
  version: '3.1.0+1',
);

int _statisticsModelEstimateSize(
  StatisticsModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.lastSessionAt.length * 3;
  bytesCount += 3 + object.totalPomodorosCompleted.length * 3;
  return bytesCount;
}

void _statisticsModelSerialize(
  StatisticsModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.lastSessionAt);
  writer.writeLong(offsets[1], object.statId);
  writer.writeDateTime(offsets[2], object.totalBreakTimeMinutes);
  writer.writeDateTime(offsets[3], object.totalFocusTimeMinutes);
  writer.writeString(offsets[4], object.totalPomodorosCompleted);
}

StatisticsModel _statisticsModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StatisticsModel(
    id: id,
    lastSessionAt: reader.readString(offsets[0]),
    statId: reader.readLong(offsets[1]),
    totalBreakTimeMinutes: reader.readDateTimeOrNull(offsets[2]),
    totalFocusTimeMinutes: reader.readDateTimeOrNull(offsets[3]),
    totalPomodorosCompleted: reader.readString(offsets[4]),
  );
  return object;
}

P _statisticsModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _statisticsModelGetId(StatisticsModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _statisticsModelGetLinks(StatisticsModel object) {
  return [];
}

void _statisticsModelAttach(
    IsarCollection<dynamic> col, Id id, StatisticsModel object) {
  object.id = id;
}

extension StatisticsModelQueryWhereSort
    on QueryBuilder<StatisticsModel, StatisticsModel, QWhere> {
  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhere>
      anyTotalPomodorosCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'totalPomodorosCompleted'),
      );
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhere>
      anyTotalFocusTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'totalFocusTimeMinutes'),
      );
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhere>
      anyTotalBreakTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'totalBreakTimeMinutes'),
      );
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhere>
      anyLastSessionAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastSessionAt'),
      );
    });
  }
}

extension StatisticsModelQueryWhere
    on QueryBuilder<StatisticsModel, StatisticsModel, QWhereClause> {
  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
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

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalPomodorosCompletedEqualTo(String totalPomodorosCompleted) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'totalPomodorosCompleted',
        value: [totalPomodorosCompleted],
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalPomodorosCompletedNotEqualTo(String totalPomodorosCompleted) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'totalPomodorosCompleted',
              lower: [],
              upper: [totalPomodorosCompleted],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'totalPomodorosCompleted',
              lower: [totalPomodorosCompleted],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'totalPomodorosCompleted',
              lower: [totalPomodorosCompleted],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'totalPomodorosCompleted',
              lower: [],
              upper: [totalPomodorosCompleted],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalPomodorosCompletedGreaterThan(
    String totalPomodorosCompleted, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'totalPomodorosCompleted',
        lower: [totalPomodorosCompleted],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalPomodorosCompletedLessThan(
    String totalPomodorosCompleted, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'totalPomodorosCompleted',
        lower: [],
        upper: [totalPomodorosCompleted],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalPomodorosCompletedBetween(
    String lowerTotalPomodorosCompleted,
    String upperTotalPomodorosCompleted, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'totalPomodorosCompleted',
        lower: [lowerTotalPomodorosCompleted],
        includeLower: includeLower,
        upper: [upperTotalPomodorosCompleted],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalPomodorosCompletedStartsWith(String TotalPomodorosCompletedPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'totalPomodorosCompleted',
        lower: [TotalPomodorosCompletedPrefix],
        upper: ['$TotalPomodorosCompletedPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalPomodorosCompletedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'totalPomodorosCompleted',
        value: [''],
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalPomodorosCompletedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'totalPomodorosCompleted',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'totalPomodorosCompleted',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'totalPomodorosCompleted',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'totalPomodorosCompleted',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalFocusTimeMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'totalFocusTimeMinutes',
        value: [null],
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalFocusTimeMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'totalFocusTimeMinutes',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalFocusTimeMinutesEqualTo(DateTime? totalFocusTimeMinutes) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'totalFocusTimeMinutes',
        value: [totalFocusTimeMinutes],
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalFocusTimeMinutesNotEqualTo(DateTime? totalFocusTimeMinutes) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'totalFocusTimeMinutes',
              lower: [],
              upper: [totalFocusTimeMinutes],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'totalFocusTimeMinutes',
              lower: [totalFocusTimeMinutes],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'totalFocusTimeMinutes',
              lower: [totalFocusTimeMinutes],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'totalFocusTimeMinutes',
              lower: [],
              upper: [totalFocusTimeMinutes],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalFocusTimeMinutesGreaterThan(
    DateTime? totalFocusTimeMinutes, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'totalFocusTimeMinutes',
        lower: [totalFocusTimeMinutes],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalFocusTimeMinutesLessThan(
    DateTime? totalFocusTimeMinutes, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'totalFocusTimeMinutes',
        lower: [],
        upper: [totalFocusTimeMinutes],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalFocusTimeMinutesBetween(
    DateTime? lowerTotalFocusTimeMinutes,
    DateTime? upperTotalFocusTimeMinutes, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'totalFocusTimeMinutes',
        lower: [lowerTotalFocusTimeMinutes],
        includeLower: includeLower,
        upper: [upperTotalFocusTimeMinutes],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalBreakTimeMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'totalBreakTimeMinutes',
        value: [null],
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalBreakTimeMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'totalBreakTimeMinutes',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalBreakTimeMinutesEqualTo(DateTime? totalBreakTimeMinutes) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'totalBreakTimeMinutes',
        value: [totalBreakTimeMinutes],
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalBreakTimeMinutesNotEqualTo(DateTime? totalBreakTimeMinutes) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'totalBreakTimeMinutes',
              lower: [],
              upper: [totalBreakTimeMinutes],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'totalBreakTimeMinutes',
              lower: [totalBreakTimeMinutes],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'totalBreakTimeMinutes',
              lower: [totalBreakTimeMinutes],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'totalBreakTimeMinutes',
              lower: [],
              upper: [totalBreakTimeMinutes],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalBreakTimeMinutesGreaterThan(
    DateTime? totalBreakTimeMinutes, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'totalBreakTimeMinutes',
        lower: [totalBreakTimeMinutes],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalBreakTimeMinutesLessThan(
    DateTime? totalBreakTimeMinutes, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'totalBreakTimeMinutes',
        lower: [],
        upper: [totalBreakTimeMinutes],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      totalBreakTimeMinutesBetween(
    DateTime? lowerTotalBreakTimeMinutes,
    DateTime? upperTotalBreakTimeMinutes, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'totalBreakTimeMinutes',
        lower: [lowerTotalBreakTimeMinutes],
        includeLower: includeLower,
        upper: [upperTotalBreakTimeMinutes],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      lastSessionAtEqualTo(String lastSessionAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastSessionAt',
        value: [lastSessionAt],
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      lastSessionAtNotEqualTo(String lastSessionAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSessionAt',
              lower: [],
              upper: [lastSessionAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSessionAt',
              lower: [lastSessionAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSessionAt',
              lower: [lastSessionAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSessionAt',
              lower: [],
              upper: [lastSessionAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      lastSessionAtGreaterThan(
    String lastSessionAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSessionAt',
        lower: [lastSessionAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      lastSessionAtLessThan(
    String lastSessionAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSessionAt',
        lower: [],
        upper: [lastSessionAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      lastSessionAtBetween(
    String lowerLastSessionAt,
    String upperLastSessionAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSessionAt',
        lower: [lowerLastSessionAt],
        includeLower: includeLower,
        upper: [upperLastSessionAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      lastSessionAtStartsWith(String LastSessionAtPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSessionAt',
        lower: [LastSessionAtPrefix],
        upper: ['$LastSessionAtPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      lastSessionAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastSessionAt',
        value: [''],
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterWhereClause>
      lastSessionAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'lastSessionAt',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'lastSessionAt',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'lastSessionAt',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'lastSessionAt',
              upper: [''],
            ));
      }
    });
  }
}

extension StatisticsModelQueryFilter
    on QueryBuilder<StatisticsModel, StatisticsModel, QFilterCondition> {
  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
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

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
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

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
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

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      lastSessionAtEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSessionAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      lastSessionAtGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSessionAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      lastSessionAtLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSessionAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      lastSessionAtBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSessionAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      lastSessionAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastSessionAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      lastSessionAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastSessionAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      lastSessionAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastSessionAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      lastSessionAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastSessionAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      lastSessionAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSessionAt',
        value: '',
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      lastSessionAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastSessionAt',
        value: '',
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      statIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statId',
        value: value,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      statIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statId',
        value: value,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      statIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statId',
        value: value,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      statIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalBreakTimeMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalBreakTimeMinutes',
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalBreakTimeMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalBreakTimeMinutes',
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalBreakTimeMinutesEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalBreakTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalBreakTimeMinutesGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalBreakTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalBreakTimeMinutesLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalBreakTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalBreakTimeMinutesBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalBreakTimeMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalFocusTimeMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalFocusTimeMinutes',
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalFocusTimeMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalFocusTimeMinutes',
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalFocusTimeMinutesEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalFocusTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalFocusTimeMinutesGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalFocusTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalFocusTimeMinutesLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalFocusTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalFocusTimeMinutesBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalFocusTimeMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalPomodorosCompletedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPomodorosCompleted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalPomodorosCompletedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPomodorosCompleted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalPomodorosCompletedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPomodorosCompleted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalPomodorosCompletedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPomodorosCompleted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalPomodorosCompletedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'totalPomodorosCompleted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalPomodorosCompletedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'totalPomodorosCompleted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalPomodorosCompletedContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'totalPomodorosCompleted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalPomodorosCompletedMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'totalPomodorosCompleted',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalPomodorosCompletedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPomodorosCompleted',
        value: '',
      ));
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterFilterCondition>
      totalPomodorosCompletedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'totalPomodorosCompleted',
        value: '',
      ));
    });
  }
}

extension StatisticsModelQueryObject
    on QueryBuilder<StatisticsModel, StatisticsModel, QFilterCondition> {}

extension StatisticsModelQueryLinks
    on QueryBuilder<StatisticsModel, StatisticsModel, QFilterCondition> {}

extension StatisticsModelQuerySortBy
    on QueryBuilder<StatisticsModel, StatisticsModel, QSortBy> {
  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      sortByLastSessionAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSessionAt', Sort.asc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      sortByLastSessionAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSessionAt', Sort.desc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy> sortByStatId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statId', Sort.asc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      sortByStatIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statId', Sort.desc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      sortByTotalBreakTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBreakTimeMinutes', Sort.asc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      sortByTotalBreakTimeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBreakTimeMinutes', Sort.desc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      sortByTotalFocusTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFocusTimeMinutes', Sort.asc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      sortByTotalFocusTimeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFocusTimeMinutes', Sort.desc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      sortByTotalPomodorosCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPomodorosCompleted', Sort.asc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      sortByTotalPomodorosCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPomodorosCompleted', Sort.desc);
    });
  }
}

extension StatisticsModelQuerySortThenBy
    on QueryBuilder<StatisticsModel, StatisticsModel, QSortThenBy> {
  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      thenByLastSessionAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSessionAt', Sort.asc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      thenByLastSessionAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSessionAt', Sort.desc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy> thenByStatId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statId', Sort.asc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      thenByStatIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statId', Sort.desc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      thenByTotalBreakTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBreakTimeMinutes', Sort.asc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      thenByTotalBreakTimeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBreakTimeMinutes', Sort.desc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      thenByTotalFocusTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFocusTimeMinutes', Sort.asc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      thenByTotalFocusTimeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFocusTimeMinutes', Sort.desc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      thenByTotalPomodorosCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPomodorosCompleted', Sort.asc);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QAfterSortBy>
      thenByTotalPomodorosCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPomodorosCompleted', Sort.desc);
    });
  }
}

extension StatisticsModelQueryWhereDistinct
    on QueryBuilder<StatisticsModel, StatisticsModel, QDistinct> {
  QueryBuilder<StatisticsModel, StatisticsModel, QDistinct>
      distinctByLastSessionAt({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSessionAt',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QDistinct> distinctByStatId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statId');
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QDistinct>
      distinctByTotalBreakTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalBreakTimeMinutes');
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QDistinct>
      distinctByTotalFocusTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalFocusTimeMinutes');
    });
  }

  QueryBuilder<StatisticsModel, StatisticsModel, QDistinct>
      distinctByTotalPomodorosCompleted({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPomodorosCompleted',
          caseSensitive: caseSensitive);
    });
  }
}

extension StatisticsModelQueryProperty
    on QueryBuilder<StatisticsModel, StatisticsModel, QQueryProperty> {
  QueryBuilder<StatisticsModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StatisticsModel, String, QQueryOperations>
      lastSessionAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSessionAt');
    });
  }

  QueryBuilder<StatisticsModel, int, QQueryOperations> statIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statId');
    });
  }

  QueryBuilder<StatisticsModel, DateTime?, QQueryOperations>
      totalBreakTimeMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalBreakTimeMinutes');
    });
  }

  QueryBuilder<StatisticsModel, DateTime?, QQueryOperations>
      totalFocusTimeMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalFocusTimeMinutes');
    });
  }

  QueryBuilder<StatisticsModel, String, QQueryOperations>
      totalPomodorosCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPomodorosCompleted');
    });
  }
}
