// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserSettingsModelCollection on Isar {
  IsarCollection<UserSettingsModel> get userSettingsModels => this.collection();
}

const UserSettingsModelSchema = CollectionSchema(
  name: r'UserSettingsModel',
  id: 1840420974923084997,
  properties: {
    r'autoSave': PropertySchema(
      id: 0,
      name: r'autoSave',
      type: IsarType.string,
    ),
    r'notificationEnabled': PropertySchema(
      id: 1,
      name: r'notificationEnabled',
      type: IsarType.string,
    ),
    r'preferredLanguage': PropertySchema(
      id: 2,
      name: r'preferredLanguage',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 3,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _userSettingsModelEstimateSize,
  serialize: _userSettingsModelSerialize,
  deserialize: _userSettingsModelDeserialize,
  deserializeProp: _userSettingsModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'preferredLanguage': IndexSchema(
      id: 7855713254558734818,
      name: r'preferredLanguage',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'preferredLanguage',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'autoSave': IndexSchema(
      id: -789365965563353280,
      name: r'autoSave',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'autoSave',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'notificationEnabled': IndexSchema(
      id: 4295355793399034860,
      name: r'notificationEnabled',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'notificationEnabled',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _userSettingsModelGetId,
  getLinks: _userSettingsModelGetLinks,
  attach: _userSettingsModelAttach,
  version: '3.1.0+1',
);

int _userSettingsModelEstimateSize(
  UserSettingsModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.autoSave.length * 3;
  bytesCount += 3 + object.notificationEnabled.length * 3;
  bytesCount += 3 + object.preferredLanguage.length * 3;
  return bytesCount;
}

void _userSettingsModelSerialize(
  UserSettingsModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.autoSave);
  writer.writeString(offsets[1], object.notificationEnabled);
  writer.writeString(offsets[2], object.preferredLanguage);
  writer.writeLong(offsets[3], object.userId);
}

UserSettingsModel _userSettingsModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserSettingsModel(
    autoSave: reader.readString(offsets[0]),
    id: id,
    notificationEnabled: reader.readString(offsets[1]),
    preferredLanguage: reader.readString(offsets[2]),
    userId: reader.readLong(offsets[3]),
  );
  return object;
}

P _userSettingsModelDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userSettingsModelGetId(UserSettingsModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _userSettingsModelGetLinks(
    UserSettingsModel object) {
  return [];
}

void _userSettingsModelAttach(
    IsarCollection<dynamic> col, Id id, UserSettingsModel object) {
  object.id = id;
}

extension UserSettingsModelQueryWhereSort
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QWhere> {
  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhere>
      anyPreferredLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'preferredLanguage'),
      );
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhere>
      anyAutoSave() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'autoSave'),
      );
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhere>
      anyNotificationEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'notificationEnabled'),
      );
    });
  }
}

extension UserSettingsModelQueryWhere
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QWhereClause> {
  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
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

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
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

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      preferredLanguageEqualTo(String preferredLanguage) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'preferredLanguage',
        value: [preferredLanguage],
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      preferredLanguageNotEqualTo(String preferredLanguage) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'preferredLanguage',
              lower: [],
              upper: [preferredLanguage],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'preferredLanguage',
              lower: [preferredLanguage],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'preferredLanguage',
              lower: [preferredLanguage],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'preferredLanguage',
              lower: [],
              upper: [preferredLanguage],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      preferredLanguageGreaterThan(
    String preferredLanguage, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'preferredLanguage',
        lower: [preferredLanguage],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      preferredLanguageLessThan(
    String preferredLanguage, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'preferredLanguage',
        lower: [],
        upper: [preferredLanguage],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      preferredLanguageBetween(
    String lowerPreferredLanguage,
    String upperPreferredLanguage, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'preferredLanguage',
        lower: [lowerPreferredLanguage],
        includeLower: includeLower,
        upper: [upperPreferredLanguage],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      preferredLanguageStartsWith(String PreferredLanguagePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'preferredLanguage',
        lower: [PreferredLanguagePrefix],
        upper: ['$PreferredLanguagePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      preferredLanguageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'preferredLanguage',
        value: [''],
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      preferredLanguageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'preferredLanguage',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'preferredLanguage',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'preferredLanguage',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'preferredLanguage',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      autoSaveEqualTo(String autoSave) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'autoSave',
        value: [autoSave],
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      autoSaveNotEqualTo(String autoSave) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'autoSave',
              lower: [],
              upper: [autoSave],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'autoSave',
              lower: [autoSave],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'autoSave',
              lower: [autoSave],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'autoSave',
              lower: [],
              upper: [autoSave],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      autoSaveGreaterThan(
    String autoSave, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'autoSave',
        lower: [autoSave],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      autoSaveLessThan(
    String autoSave, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'autoSave',
        lower: [],
        upper: [autoSave],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      autoSaveBetween(
    String lowerAutoSave,
    String upperAutoSave, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'autoSave',
        lower: [lowerAutoSave],
        includeLower: includeLower,
        upper: [upperAutoSave],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      autoSaveStartsWith(String AutoSavePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'autoSave',
        lower: [AutoSavePrefix],
        upper: ['$AutoSavePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      autoSaveIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'autoSave',
        value: [''],
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      autoSaveIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'autoSave',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'autoSave',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'autoSave',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'autoSave',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      notificationEnabledEqualTo(String notificationEnabled) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'notificationEnabled',
        value: [notificationEnabled],
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      notificationEnabledNotEqualTo(String notificationEnabled) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'notificationEnabled',
              lower: [],
              upper: [notificationEnabled],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'notificationEnabled',
              lower: [notificationEnabled],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'notificationEnabled',
              lower: [notificationEnabled],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'notificationEnabled',
              lower: [],
              upper: [notificationEnabled],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      notificationEnabledGreaterThan(
    String notificationEnabled, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'notificationEnabled',
        lower: [notificationEnabled],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      notificationEnabledLessThan(
    String notificationEnabled, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'notificationEnabled',
        lower: [],
        upper: [notificationEnabled],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      notificationEnabledBetween(
    String lowerNotificationEnabled,
    String upperNotificationEnabled, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'notificationEnabled',
        lower: [lowerNotificationEnabled],
        includeLower: includeLower,
        upper: [upperNotificationEnabled],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      notificationEnabledStartsWith(String NotificationEnabledPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'notificationEnabled',
        lower: [NotificationEnabledPrefix],
        upper: ['$NotificationEnabledPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      notificationEnabledIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'notificationEnabled',
        value: [''],
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause>
      notificationEnabledIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'notificationEnabled',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'notificationEnabled',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'notificationEnabled',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'notificationEnabled',
              upper: [''],
            ));
      }
    });
  }
}

extension UserSettingsModelQueryFilter
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QFilterCondition> {
  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      autoSaveEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autoSave',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      autoSaveGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'autoSave',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      autoSaveLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'autoSave',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      autoSaveBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'autoSave',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      autoSaveStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'autoSave',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      autoSaveEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'autoSave',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      autoSaveContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'autoSave',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      autoSaveMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'autoSave',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      autoSaveIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autoSave',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      autoSaveIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'autoSave',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
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

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
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

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
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

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      notificationEnabledEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationEnabled',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      notificationEnabledGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notificationEnabled',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      notificationEnabledLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notificationEnabled',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      notificationEnabledBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notificationEnabled',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      notificationEnabledStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notificationEnabled',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      notificationEnabledEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notificationEnabled',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      notificationEnabledContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notificationEnabled',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      notificationEnabledMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notificationEnabled',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      notificationEnabledIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationEnabled',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      notificationEnabledIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notificationEnabled',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredLanguageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredLanguageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preferredLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredLanguageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preferredLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredLanguageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preferredLanguage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredLanguageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preferredLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredLanguageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preferredLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredLanguageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preferredLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredLanguageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preferredLanguage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredLanguageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredLanguage',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredLanguageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preferredLanguage',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserSettingsModelQueryObject
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QFilterCondition> {}

extension UserSettingsModelQueryLinks
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QFilterCondition> {}

extension UserSettingsModelQuerySortBy
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QSortBy> {
  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      sortByAutoSave() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSave', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      sortByAutoSaveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSave', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      sortByNotificationEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      sortByNotificationEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      sortByPreferredLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredLanguage', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      sortByPreferredLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredLanguage', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserSettingsModelQuerySortThenBy
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QSortThenBy> {
  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      thenByAutoSave() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSave', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      thenByAutoSaveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSave', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      thenByNotificationEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      thenByNotificationEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      thenByPreferredLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredLanguage', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      thenByPreferredLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredLanguage', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserSettingsModelQueryWhereDistinct
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct> {
  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct>
      distinctByAutoSave({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoSave', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct>
      distinctByNotificationEnabled({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationEnabled',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct>
      distinctByPreferredLanguage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preferredLanguage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct>
      distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension UserSettingsModelQueryProperty
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QQueryProperty> {
  QueryBuilder<UserSettingsModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserSettingsModel, String, QQueryOperations> autoSaveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoSave');
    });
  }

  QueryBuilder<UserSettingsModel, String, QQueryOperations>
      notificationEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationEnabled');
    });
  }

  QueryBuilder<UserSettingsModel, String, QQueryOperations>
      preferredLanguageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferredLanguage');
    });
  }

  QueryBuilder<UserSettingsModel, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
