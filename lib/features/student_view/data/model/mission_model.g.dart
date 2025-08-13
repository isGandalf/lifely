// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMissionModelCollection on Isar {
  IsarCollection<MissionModel> get missionModels => this.collection();
}

const MissionModelSchema = CollectionSchema(
  name: r'MissionModel',
  id: 3976238352109843434,
  properties: {
    r'completedSteps': PropertySchema(
      id: 0,
      name: r'completedSteps',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'isSynced': PropertySchema(
      id: 2,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'missionDescription': PropertySchema(
      id: 3,
      name: r'missionDescription',
      type: IsarType.string,
    ),
    r'missionId': PropertySchema(
      id: 4,
      name: r'missionId',
      type: IsarType.string,
    ),
    r'missionTitle': PropertySchema(
      id: 5,
      name: r'missionTitle',
      type: IsarType.string,
    ),
    r'remoteId': PropertySchema(
      id: 6,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'totalSteps': PropertySchema(
      id: 7,
      name: r'totalSteps',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _missionModelEstimateSize,
  serialize: _missionModelSerialize,
  deserialize: _missionModelDeserialize,
  deserializeProp: _missionModelDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _missionModelGetId,
  getLinks: _missionModelGetLinks,
  attach: _missionModelAttach,
  version: '3.1.8',
);

int _missionModelEstimateSize(
  MissionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.missionDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.missionId.length * 3;
  bytesCount += 3 + object.missionTitle.length * 3;
  {
    final value = object.remoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _missionModelSerialize(
  MissionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.completedSteps);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeBool(offsets[2], object.isSynced);
  writer.writeString(offsets[3], object.missionDescription);
  writer.writeString(offsets[4], object.missionId);
  writer.writeString(offsets[5], object.missionTitle);
  writer.writeString(offsets[6], object.remoteId);
  writer.writeLong(offsets[7], object.totalSteps);
  writer.writeDateTime(offsets[8], object.updatedAt);
}

MissionModel _missionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MissionModel();
  object.completedSteps = reader.readLong(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.isSynced = reader.readBool(offsets[2]);
  object.isarId = id;
  object.missionDescription = reader.readStringOrNull(offsets[3]);
  object.missionId = reader.readString(offsets[4]);
  object.missionTitle = reader.readString(offsets[5]);
  object.remoteId = reader.readStringOrNull(offsets[6]);
  object.totalSteps = reader.readLong(offsets[7]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[8]);
  return object;
}

P _missionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _missionModelGetId(MissionModel object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _missionModelGetLinks(MissionModel object) {
  return [];
}

void _missionModelAttach(
    IsarCollection<dynamic> col, Id id, MissionModel object) {
  object.isarId = id;
}

extension MissionModelQueryWhereSort
    on QueryBuilder<MissionModel, MissionModel, QWhere> {
  QueryBuilder<MissionModel, MissionModel, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MissionModelQueryWhere
    on QueryBuilder<MissionModel, MissionModel, QWhereClause> {
  QueryBuilder<MissionModel, MissionModel, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MissionModelQueryFilter
    on QueryBuilder<MissionModel, MissionModel, QFilterCondition> {
  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      completedStepsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedSteps',
        value: value,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      completedStepsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedSteps',
        value: value,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      completedStepsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedSteps',
        value: value,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      completedStepsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedSteps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
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

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
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

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
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

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'missionDescription',
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'missionDescription',
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'missionDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'missionDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'missionDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'missionDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'missionDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'missionDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'missionDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'missionDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'missionDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'missionDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'missionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'missionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'missionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'missionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'missionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'missionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'missionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'missionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'missionId',
        value: '',
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'missionId',
        value: '',
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionTitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'missionTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'missionTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'missionTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'missionTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'missionTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'missionTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'missionTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'missionTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'missionTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      missionTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'missionTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      remoteIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      remoteIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      remoteIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      remoteIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      remoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      remoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      remoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      totalStepsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalSteps',
        value: value,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      totalStepsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalSteps',
        value: value,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      totalStepsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalSteps',
        value: value,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      totalStepsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalSteps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
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

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
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

  QueryBuilder<MissionModel, MissionModel, QAfterFilterCondition>
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

extension MissionModelQueryObject
    on QueryBuilder<MissionModel, MissionModel, QFilterCondition> {}

extension MissionModelQueryLinks
    on QueryBuilder<MissionModel, MissionModel, QFilterCondition> {}

extension MissionModelQuerySortBy
    on QueryBuilder<MissionModel, MissionModel, QSortBy> {
  QueryBuilder<MissionModel, MissionModel, QAfterSortBy>
      sortByCompletedSteps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedSteps', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy>
      sortByCompletedStepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedSteps', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy>
      sortByMissionDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missionDescription', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy>
      sortByMissionDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missionDescription', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> sortByMissionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missionId', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> sortByMissionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missionId', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> sortByMissionTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missionTitle', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy>
      sortByMissionTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missionTitle', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> sortByTotalSteps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSteps', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy>
      sortByTotalStepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSteps', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension MissionModelQuerySortThenBy
    on QueryBuilder<MissionModel, MissionModel, QSortThenBy> {
  QueryBuilder<MissionModel, MissionModel, QAfterSortBy>
      thenByCompletedSteps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedSteps', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy>
      thenByCompletedStepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedSteps', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy>
      thenByMissionDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missionDescription', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy>
      thenByMissionDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missionDescription', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> thenByMissionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missionId', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> thenByMissionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missionId', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> thenByMissionTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missionTitle', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy>
      thenByMissionTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missionTitle', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> thenByTotalSteps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSteps', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy>
      thenByTotalStepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSteps', Sort.desc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension MissionModelQueryWhereDistinct
    on QueryBuilder<MissionModel, MissionModel, QDistinct> {
  QueryBuilder<MissionModel, MissionModel, QDistinct>
      distinctByCompletedSteps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedSteps');
    });
  }

  QueryBuilder<MissionModel, MissionModel, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MissionModel, MissionModel, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<MissionModel, MissionModel, QDistinct>
      distinctByMissionDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'missionDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QDistinct> distinctByMissionId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'missionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QDistinct> distinctByMissionTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'missionTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MissionModel, MissionModel, QDistinct> distinctByTotalSteps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalSteps');
    });
  }

  QueryBuilder<MissionModel, MissionModel, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension MissionModelQueryProperty
    on QueryBuilder<MissionModel, MissionModel, QQueryProperty> {
  QueryBuilder<MissionModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<MissionModel, int, QQueryOperations> completedStepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedSteps');
    });
  }

  QueryBuilder<MissionModel, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MissionModel, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<MissionModel, String?, QQueryOperations>
      missionDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'missionDescription');
    });
  }

  QueryBuilder<MissionModel, String, QQueryOperations> missionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'missionId');
    });
  }

  QueryBuilder<MissionModel, String, QQueryOperations> missionTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'missionTitle');
    });
  }

  QueryBuilder<MissionModel, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<MissionModel, int, QQueryOperations> totalStepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalSteps');
    });
  }

  QueryBuilder<MissionModel, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
