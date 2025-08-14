// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_log_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHabitLogModelCollection on Isar {
  IsarCollection<HabitLogModel> get habitLogModels => this.collection();
}

const HabitLogModelSchema = CollectionSchema(
  name: r'HabitLogModel',
  id: 1569200676919562030,
  properties: {
    r'habitId': PropertySchema(
      id: 0,
      name: r'habitId',
      type: IsarType.long,
    ),
    r'isCompleted': PropertySchema(
      id: 1,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'logDate': PropertySchema(
      id: 2,
      name: r'logDate',
      type: IsarType.dateTime,
    ),
    r'logId': PropertySchema(
      id: 3,
      name: r'logId',
      type: IsarType.long,
    ),
    r'notes': PropertySchema(
      id: 4,
      name: r'notes',
      type: IsarType.string,
    )
  },
  estimateSize: _habitLogModelEstimateSize,
  serialize: _habitLogModelSerialize,
  deserialize: _habitLogModelDeserialize,
  deserializeProp: _habitLogModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'logDate': IndexSchema(
      id: 8404824101822155242,
      name: r'logDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'logDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'isCompleted': IndexSchema(
      id: -7936144632215868537,
      name: r'isCompleted',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isCompleted',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'notes': IndexSchema(
      id: 8092016287011465773,
      name: r'notes',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'notes',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _habitLogModelGetId,
  getLinks: _habitLogModelGetLinks,
  attach: _habitLogModelAttach,
  version: '3.1.0+1',
);

int _habitLogModelEstimateSize(
  HabitLogModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.notes.length * 3;
  return bytesCount;
}

void _habitLogModelSerialize(
  HabitLogModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.habitId);
  writer.writeBool(offsets[1], object.isCompleted);
  writer.writeDateTime(offsets[2], object.logDate);
  writer.writeLong(offsets[3], object.logId);
  writer.writeString(offsets[4], object.notes);
}

HabitLogModel _habitLogModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HabitLogModel(
    habitId: reader.readLong(offsets[0]),
    id: id,
    isCompleted: reader.readBoolOrNull(offsets[1]),
    logDate: reader.readDateTimeOrNull(offsets[2]),
    logId: reader.readLong(offsets[3]),
    notes: reader.readString(offsets[4]),
  );
  return object;
}

P _habitLogModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _habitLogModelGetId(HabitLogModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _habitLogModelGetLinks(HabitLogModel object) {
  return [];
}

void _habitLogModelAttach(
    IsarCollection<dynamic> col, Id id, HabitLogModel object) {
  object.id = id;
}

extension HabitLogModelQueryWhereSort
    on QueryBuilder<HabitLogModel, HabitLogModel, QWhere> {
  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhere> anyLogDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'logDate'),
      );
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhere> anyIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isCompleted'),
      );
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhere> anyNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'notes'),
      );
    });
  }
}

extension HabitLogModelQueryWhere
    on QueryBuilder<HabitLogModel, HabitLogModel, QWhereClause> {
  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause>
      logDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'logDate',
        value: [null],
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause>
      logDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'logDate',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause> logDateEqualTo(
      DateTime? logDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'logDate',
        value: [logDate],
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause>
      logDateNotEqualTo(DateTime? logDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'logDate',
              lower: [],
              upper: [logDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'logDate',
              lower: [logDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'logDate',
              lower: [logDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'logDate',
              lower: [],
              upper: [logDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause>
      logDateGreaterThan(
    DateTime? logDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'logDate',
        lower: [logDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause> logDateLessThan(
    DateTime? logDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'logDate',
        lower: [],
        upper: [logDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause> logDateBetween(
    DateTime? lowerLogDate,
    DateTime? upperLogDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'logDate',
        lower: [lowerLogDate],
        includeLower: includeLower,
        upper: [upperLogDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause>
      isCompletedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isCompleted',
        value: [null],
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause>
      isCompletedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'isCompleted',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause>
      isCompletedEqualTo(bool? isCompleted) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isCompleted',
        value: [isCompleted],
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause>
      isCompletedNotEqualTo(bool? isCompleted) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isCompleted',
              lower: [],
              upper: [isCompleted],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isCompleted',
              lower: [isCompleted],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isCompleted',
              lower: [isCompleted],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isCompleted',
              lower: [],
              upper: [isCompleted],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause> notesEqualTo(
      String notes) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'notes',
        value: [notes],
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause> notesNotEqualTo(
      String notes) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'notes',
              lower: [],
              upper: [notes],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'notes',
              lower: [notes],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'notes',
              lower: [notes],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'notes',
              lower: [],
              upper: [notes],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause>
      notesGreaterThan(
    String notes, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'notes',
        lower: [notes],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause> notesLessThan(
    String notes, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'notes',
        lower: [],
        upper: [notes],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause> notesBetween(
    String lowerNotes,
    String upperNotes, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'notes',
        lower: [lowerNotes],
        includeLower: includeLower,
        upper: [upperNotes],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause> notesStartsWith(
      String NotesPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'notes',
        lower: [NotesPrefix],
        upper: ['$NotesPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'notes',
        value: [''],
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterWhereClause>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'notes',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'notes',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'notes',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'notes',
              upper: [''],
            ));
      }
    });
  }
}

extension HabitLogModelQueryFilter
    on QueryBuilder<HabitLogModel, HabitLogModel, QFilterCondition> {
  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      habitIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'habitId',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      habitIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'habitId',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      habitIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'habitId',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      habitIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'habitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
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

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      isCompletedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isCompleted',
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      isCompletedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isCompleted',
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      isCompletedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      logDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logDate',
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      logDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logDate',
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      logDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logDate',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      logDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logDate',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      logDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logDate',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      logDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      logIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logId',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      logIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logId',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      logIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logId',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      logIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      notesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      notesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      notesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      notesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }
}

extension HabitLogModelQueryObject
    on QueryBuilder<HabitLogModel, HabitLogModel, QFilterCondition> {}

extension HabitLogModelQueryLinks
    on QueryBuilder<HabitLogModel, HabitLogModel, QFilterCondition> {}

extension HabitLogModelQuerySortBy
    on QueryBuilder<HabitLogModel, HabitLogModel, QSortBy> {
  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> sortByHabitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'habitId', Sort.asc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> sortByHabitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'habitId', Sort.desc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> sortByLogDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logDate', Sort.asc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> sortByLogDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logDate', Sort.desc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> sortByLogId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logId', Sort.asc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> sortByLogIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logId', Sort.desc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }
}

extension HabitLogModelQuerySortThenBy
    on QueryBuilder<HabitLogModel, HabitLogModel, QSortThenBy> {
  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> thenByHabitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'habitId', Sort.asc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> thenByHabitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'habitId', Sort.desc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> thenByLogDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logDate', Sort.asc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> thenByLogDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logDate', Sort.desc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> thenByLogId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logId', Sort.asc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> thenByLogIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logId', Sort.desc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }
}

extension HabitLogModelQueryWhereDistinct
    on QueryBuilder<HabitLogModel, HabitLogModel, QDistinct> {
  QueryBuilder<HabitLogModel, HabitLogModel, QDistinct> distinctByHabitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'habitId');
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QDistinct> distinctByLogDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logDate');
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QDistinct> distinctByLogId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logId');
    });
  }

  QueryBuilder<HabitLogModel, HabitLogModel, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }
}

extension HabitLogModelQueryProperty
    on QueryBuilder<HabitLogModel, HabitLogModel, QQueryProperty> {
  QueryBuilder<HabitLogModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HabitLogModel, int, QQueryOperations> habitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'habitId');
    });
  }

  QueryBuilder<HabitLogModel, bool?, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<HabitLogModel, DateTime?, QQueryOperations> logDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logDate');
    });
  }

  QueryBuilder<HabitLogModel, int, QQueryOperations> logIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logId');
    });
  }

  QueryBuilder<HabitLogModel, String, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }
}
