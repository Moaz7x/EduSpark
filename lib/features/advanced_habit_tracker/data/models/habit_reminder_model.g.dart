// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_reminder_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHabitReminderModelCollection on Isar {
  IsarCollection<HabitReminderModel> get habitReminderModels =>
      this.collection();
}

const HabitReminderModelSchema = CollectionSchema(
  name: r'HabitReminderModel',
  id: -2751986350447209048,
  properties: {
    r'habitId': PropertySchema(
      id: 0,
      name: r'habitId',
      type: IsarType.long,
    ),
    r'isRecurring': PropertySchema(
      id: 1,
      name: r'isRecurring',
      type: IsarType.bool,
    ),
    r'message': PropertySchema(
      id: 2,
      name: r'message',
      type: IsarType.string,
    ),
    r'recurrencePattern': PropertySchema(
      id: 3,
      name: r'recurrencePattern',
      type: IsarType.string,
    ),
    r'reminderId': PropertySchema(
      id: 4,
      name: r'reminderId',
      type: IsarType.long,
    ),
    r'reminderTime': PropertySchema(
      id: 5,
      name: r'reminderTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _habitReminderModelEstimateSize,
  serialize: _habitReminderModelSerialize,
  deserialize: _habitReminderModelDeserialize,
  deserializeProp: _habitReminderModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'message': IndexSchema(
      id: 800701444045231354,
      name: r'message',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'message',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'reminderTime': IndexSchema(
      id: 7830209449991906019,
      name: r'reminderTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'reminderTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'isRecurring': IndexSchema(
      id: 1211429805563284888,
      name: r'isRecurring',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isRecurring',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'recurrencePattern': IndexSchema(
      id: -813296416877878423,
      name: r'recurrencePattern',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'recurrencePattern',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _habitReminderModelGetId,
  getLinks: _habitReminderModelGetLinks,
  attach: _habitReminderModelAttach,
  version: '3.1.0+1',
);

int _habitReminderModelEstimateSize(
  HabitReminderModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.message.length * 3;
  bytesCount += 3 + object.recurrencePattern.length * 3;
  return bytesCount;
}

void _habitReminderModelSerialize(
  HabitReminderModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.habitId);
  writer.writeBool(offsets[1], object.isRecurring);
  writer.writeString(offsets[2], object.message);
  writer.writeString(offsets[3], object.recurrencePattern);
  writer.writeLong(offsets[4], object.reminderId);
  writer.writeDateTime(offsets[5], object.reminderTime);
}

HabitReminderModel _habitReminderModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HabitReminderModel(
    habitId: reader.readLong(offsets[0]),
    id: id,
    isRecurring: reader.readBoolOrNull(offsets[1]),
    message: reader.readString(offsets[2]),
    recurrencePattern: reader.readString(offsets[3]),
    reminderId: reader.readLong(offsets[4]),
    reminderTime: reader.readDateTimeOrNull(offsets[5]),
  );
  return object;
}

P _habitReminderModelDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _habitReminderModelGetId(HabitReminderModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _habitReminderModelGetLinks(
    HabitReminderModel object) {
  return [];
}

void _habitReminderModelAttach(
    IsarCollection<dynamic> col, Id id, HabitReminderModel object) {
  object.id = id;
}

extension HabitReminderModelQueryWhereSort
    on QueryBuilder<HabitReminderModel, HabitReminderModel, QWhere> {
  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhere>
      anyMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'message'),
      );
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhere>
      anyReminderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'reminderTime'),
      );
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhere>
      anyIsRecurring() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isRecurring'),
      );
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhere>
      anyRecurrencePattern() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'recurrencePattern'),
      );
    });
  }
}

extension HabitReminderModelQueryWhere
    on QueryBuilder<HabitReminderModel, HabitReminderModel, QWhereClause> {
  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
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

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
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

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      messageEqualTo(String message) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'message',
        value: [message],
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      messageNotEqualTo(String message) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'message',
              lower: [],
              upper: [message],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'message',
              lower: [message],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'message',
              lower: [message],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'message',
              lower: [],
              upper: [message],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      messageGreaterThan(
    String message, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'message',
        lower: [message],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      messageLessThan(
    String message, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'message',
        lower: [],
        upper: [message],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      messageBetween(
    String lowerMessage,
    String upperMessage, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'message',
        lower: [lowerMessage],
        includeLower: includeLower,
        upper: [upperMessage],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      messageStartsWith(String MessagePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'message',
        lower: [MessagePrefix],
        upper: ['$MessagePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      messageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'message',
        value: [''],
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      messageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'message',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'message',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'message',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'message',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      reminderTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reminderTime',
        value: [null],
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      reminderTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reminderTime',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      reminderTimeEqualTo(DateTime? reminderTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reminderTime',
        value: [reminderTime],
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      reminderTimeNotEqualTo(DateTime? reminderTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reminderTime',
              lower: [],
              upper: [reminderTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reminderTime',
              lower: [reminderTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reminderTime',
              lower: [reminderTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reminderTime',
              lower: [],
              upper: [reminderTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      reminderTimeGreaterThan(
    DateTime? reminderTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reminderTime',
        lower: [reminderTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      reminderTimeLessThan(
    DateTime? reminderTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reminderTime',
        lower: [],
        upper: [reminderTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      reminderTimeBetween(
    DateTime? lowerReminderTime,
    DateTime? upperReminderTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reminderTime',
        lower: [lowerReminderTime],
        includeLower: includeLower,
        upper: [upperReminderTime],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      isRecurringIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isRecurring',
        value: [null],
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      isRecurringIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'isRecurring',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      isRecurringEqualTo(bool? isRecurring) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isRecurring',
        value: [isRecurring],
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      isRecurringNotEqualTo(bool? isRecurring) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isRecurring',
              lower: [],
              upper: [isRecurring],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isRecurring',
              lower: [isRecurring],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isRecurring',
              lower: [isRecurring],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isRecurring',
              lower: [],
              upper: [isRecurring],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      recurrencePatternEqualTo(String recurrencePattern) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'recurrencePattern',
        value: [recurrencePattern],
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      recurrencePatternNotEqualTo(String recurrencePattern) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recurrencePattern',
              lower: [],
              upper: [recurrencePattern],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recurrencePattern',
              lower: [recurrencePattern],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recurrencePattern',
              lower: [recurrencePattern],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recurrencePattern',
              lower: [],
              upper: [recurrencePattern],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      recurrencePatternGreaterThan(
    String recurrencePattern, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'recurrencePattern',
        lower: [recurrencePattern],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      recurrencePatternLessThan(
    String recurrencePattern, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'recurrencePattern',
        lower: [],
        upper: [recurrencePattern],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      recurrencePatternBetween(
    String lowerRecurrencePattern,
    String upperRecurrencePattern, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'recurrencePattern',
        lower: [lowerRecurrencePattern],
        includeLower: includeLower,
        upper: [upperRecurrencePattern],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      recurrencePatternStartsWith(String RecurrencePatternPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'recurrencePattern',
        lower: [RecurrencePatternPrefix],
        upper: ['$RecurrencePatternPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      recurrencePatternIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'recurrencePattern',
        value: [''],
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterWhereClause>
      recurrencePatternIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'recurrencePattern',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'recurrencePattern',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'recurrencePattern',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'recurrencePattern',
              upper: [''],
            ));
      }
    });
  }
}

extension HabitReminderModelQueryFilter
    on QueryBuilder<HabitReminderModel, HabitReminderModel, QFilterCondition> {
  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      habitIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'habitId',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
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

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
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

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
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

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
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

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
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

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
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

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      isRecurringIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isRecurring',
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      isRecurringIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isRecurring',
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      isRecurringEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRecurring',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      messageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      messageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      messageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      messageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'message',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      messageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      messageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      messageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      messageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'message',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      messageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      messageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      recurrencePatternEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      recurrencePatternGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      recurrencePatternLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      recurrencePatternBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurrencePattern',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      recurrencePatternStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      recurrencePatternEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      recurrencePatternContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      recurrencePatternMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recurrencePattern',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      recurrencePatternIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrencePattern',
        value: '',
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      recurrencePatternIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recurrencePattern',
        value: '',
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      reminderIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reminderId',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      reminderIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reminderId',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      reminderIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reminderId',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      reminderIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reminderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      reminderTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reminderTime',
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      reminderTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reminderTime',
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      reminderTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reminderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      reminderTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reminderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      reminderTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reminderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterFilterCondition>
      reminderTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reminderTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HabitReminderModelQueryObject
    on QueryBuilder<HabitReminderModel, HabitReminderModel, QFilterCondition> {}

extension HabitReminderModelQueryLinks
    on QueryBuilder<HabitReminderModel, HabitReminderModel, QFilterCondition> {}

extension HabitReminderModelQuerySortBy
    on QueryBuilder<HabitReminderModel, HabitReminderModel, QSortBy> {
  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      sortByHabitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'habitId', Sort.asc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      sortByHabitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'habitId', Sort.desc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      sortByIsRecurring() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurring', Sort.asc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      sortByIsRecurringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurring', Sort.desc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      sortByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      sortByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      sortByRecurrencePattern() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrencePattern', Sort.asc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      sortByRecurrencePatternDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrencePattern', Sort.desc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      sortByReminderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderId', Sort.asc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      sortByReminderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderId', Sort.desc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      sortByReminderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderTime', Sort.asc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      sortByReminderTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderTime', Sort.desc);
    });
  }
}

extension HabitReminderModelQuerySortThenBy
    on QueryBuilder<HabitReminderModel, HabitReminderModel, QSortThenBy> {
  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      thenByHabitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'habitId', Sort.asc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      thenByHabitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'habitId', Sort.desc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      thenByIsRecurring() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurring', Sort.asc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      thenByIsRecurringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurring', Sort.desc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      thenByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      thenByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      thenByRecurrencePattern() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrencePattern', Sort.asc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      thenByRecurrencePatternDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrencePattern', Sort.desc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      thenByReminderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderId', Sort.asc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      thenByReminderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderId', Sort.desc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      thenByReminderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderTime', Sort.asc);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QAfterSortBy>
      thenByReminderTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderTime', Sort.desc);
    });
  }
}

extension HabitReminderModelQueryWhereDistinct
    on QueryBuilder<HabitReminderModel, HabitReminderModel, QDistinct> {
  QueryBuilder<HabitReminderModel, HabitReminderModel, QDistinct>
      distinctByHabitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'habitId');
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QDistinct>
      distinctByIsRecurring() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRecurring');
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QDistinct>
      distinctByMessage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'message', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QDistinct>
      distinctByRecurrencePattern({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurrencePattern',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QDistinct>
      distinctByReminderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reminderId');
    });
  }

  QueryBuilder<HabitReminderModel, HabitReminderModel, QDistinct>
      distinctByReminderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reminderTime');
    });
  }
}

extension HabitReminderModelQueryProperty
    on QueryBuilder<HabitReminderModel, HabitReminderModel, QQueryProperty> {
  QueryBuilder<HabitReminderModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HabitReminderModel, int, QQueryOperations> habitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'habitId');
    });
  }

  QueryBuilder<HabitReminderModel, bool?, QQueryOperations>
      isRecurringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRecurring');
    });
  }

  QueryBuilder<HabitReminderModel, String, QQueryOperations> messageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'message');
    });
  }

  QueryBuilder<HabitReminderModel, String, QQueryOperations>
      recurrencePatternProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurrencePattern');
    });
  }

  QueryBuilder<HabitReminderModel, int, QQueryOperations> reminderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reminderId');
    });
  }

  QueryBuilder<HabitReminderModel, DateTime?, QQueryOperations>
      reminderTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reminderTime');
    });
  }
}
