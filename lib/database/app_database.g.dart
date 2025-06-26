// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PostcodeItemsTable extends PostcodeItems
    with TableInfo<$PostcodeItemsTable, PostcodeItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PostcodeItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<int> code = GeneratedColumn<int>(
      'postcode', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _areaNameMeta =
      const VerificationMeta('areaName');
  @override
  late final GeneratedColumn<String> areaName = GeneratedColumn<String>(
      'area_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _postOfficeMeta =
      const VerificationMeta('postOffice');
  @override
  late final GeneratedColumn<String> postOffice = GeneratedColumn<String>(
      'post_office', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stateCodeMeta =
      const VerificationMeta('stateCode');
  @override
  late final GeneratedColumn<String> stateCode = GeneratedColumn<String>(
      'state_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [code, areaName, postOffice, stateCode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'postcodes';
  @override
  VerificationContext validateIntegrity(Insertable<PostcodeItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('postcode')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['postcode']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('area_name')) {
      context.handle(_areaNameMeta,
          areaName.isAcceptableOrUnknown(data['area_name']!, _areaNameMeta));
    } else if (isInserting) {
      context.missing(_areaNameMeta);
    }
    if (data.containsKey('post_office')) {
      context.handle(
          _postOfficeMeta,
          postOffice.isAcceptableOrUnknown(
              data['post_office']!, _postOfficeMeta));
    } else if (isInserting) {
      context.missing(_postOfficeMeta);
    }
    if (data.containsKey('state_code')) {
      context.handle(_stateCodeMeta,
          stateCode.isAcceptableOrUnknown(data['state_code']!, _stateCodeMeta));
    } else if (isInserting) {
      context.missing(_stateCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PostcodeItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PostcodeItem(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}postcode'])!,
      areaName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}area_name'])!,
      postOffice: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}post_office'])!,
      stateCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state_code'])!,
    );
  }

  @override
  $PostcodeItemsTable createAlias(String alias) {
    return $PostcodeItemsTable(attachedDatabase, alias);
  }
}

class PostcodeItem extends DataClass implements Insertable<PostcodeItem> {
  final int code;
  final String areaName;
  final String postOffice;
  final String stateCode;
  const PostcodeItem(
      {required this.code,
      required this.areaName,
      required this.postOffice,
      required this.stateCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['postcode'] = Variable<int>(code);
    map['area_name'] = Variable<String>(areaName);
    map['post_office'] = Variable<String>(postOffice);
    map['state_code'] = Variable<String>(stateCode);
    return map;
  }

  PostcodeItemsCompanion toCompanion(bool nullToAbsent) {
    return PostcodeItemsCompanion(
      code: Value(code),
      areaName: Value(areaName),
      postOffice: Value(postOffice),
      stateCode: Value(stateCode),
    );
  }

  factory PostcodeItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PostcodeItem(
      code: serializer.fromJson<int>(json['code']),
      areaName: serializer.fromJson<String>(json['areaName']),
      postOffice: serializer.fromJson<String>(json['postOffice']),
      stateCode: serializer.fromJson<String>(json['stateCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<int>(code),
      'areaName': serializer.toJson<String>(areaName),
      'postOffice': serializer.toJson<String>(postOffice),
      'stateCode': serializer.toJson<String>(stateCode),
    };
  }

  PostcodeItem copyWith(
          {int? code,
          String? areaName,
          String? postOffice,
          String? stateCode}) =>
      PostcodeItem(
        code: code ?? this.code,
        areaName: areaName ?? this.areaName,
        postOffice: postOffice ?? this.postOffice,
        stateCode: stateCode ?? this.stateCode,
      );
  PostcodeItem copyWithCompanion(PostcodeItemsCompanion data) {
    return PostcodeItem(
      code: data.code.present ? data.code.value : this.code,
      areaName: data.areaName.present ? data.areaName.value : this.areaName,
      postOffice:
          data.postOffice.present ? data.postOffice.value : this.postOffice,
      stateCode: data.stateCode.present ? data.stateCode.value : this.stateCode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PostcodeItem(')
          ..write('code: $code, ')
          ..write('areaName: $areaName, ')
          ..write('postOffice: $postOffice, ')
          ..write('stateCode: $stateCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(code, areaName, postOffice, stateCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostcodeItem &&
          other.code == this.code &&
          other.areaName == this.areaName &&
          other.postOffice == this.postOffice &&
          other.stateCode == this.stateCode);
}

class PostcodeItemsCompanion extends UpdateCompanion<PostcodeItem> {
  final Value<int> code;
  final Value<String> areaName;
  final Value<String> postOffice;
  final Value<String> stateCode;
  final Value<int> rowid;
  const PostcodeItemsCompanion({
    this.code = const Value.absent(),
    this.areaName = const Value.absent(),
    this.postOffice = const Value.absent(),
    this.stateCode = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PostcodeItemsCompanion.insert({
    required int code,
    required String areaName,
    required String postOffice,
    required String stateCode,
    this.rowid = const Value.absent(),
  })  : code = Value(code),
        areaName = Value(areaName),
        postOffice = Value(postOffice),
        stateCode = Value(stateCode);
  static Insertable<PostcodeItem> custom({
    Expression<int>? code,
    Expression<String>? areaName,
    Expression<String>? postOffice,
    Expression<String>? stateCode,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (code != null) 'postcode': code,
      if (areaName != null) 'area_name': areaName,
      if (postOffice != null) 'post_office': postOffice,
      if (stateCode != null) 'state_code': stateCode,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PostcodeItemsCompanion copyWith(
      {Value<int>? code,
      Value<String>? areaName,
      Value<String>? postOffice,
      Value<String>? stateCode,
      Value<int>? rowid}) {
    return PostcodeItemsCompanion(
      code: code ?? this.code,
      areaName: areaName ?? this.areaName,
      postOffice: postOffice ?? this.postOffice,
      stateCode: stateCode ?? this.stateCode,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['postcode'] = Variable<int>(code.value);
    }
    if (areaName.present) {
      map['area_name'] = Variable<String>(areaName.value);
    }
    if (postOffice.present) {
      map['post_office'] = Variable<String>(postOffice.value);
    }
    if (stateCode.present) {
      map['state_code'] = Variable<String>(stateCode.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostcodeItemsCompanion(')
          ..write('code: $code, ')
          ..write('areaName: $areaName, ')
          ..write('postOffice: $postOffice, ')
          ..write('stateCode: $stateCode, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StateItemsTable extends StateItems
    with TableInfo<$StateItemsTable, StateItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StateItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'state_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'state_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [code, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'states';
  @override
  VerificationContext validateIntegrity(Insertable<StateItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('state_code')) {
      context.handle(_codeMeta,
          code.isAcceptableOrUnknown(data['state_code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('state_name')) {
      context.handle(_nameMeta,
          name.isAcceptableOrUnknown(data['state_name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  StateItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StateItem(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state_code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state_name'])!,
    );
  }

  @override
  $StateItemsTable createAlias(String alias) {
    return $StateItemsTable(attachedDatabase, alias);
  }
}

class StateItem extends DataClass implements Insertable<StateItem> {
  final String code;
  final String name;
  const StateItem({required this.code, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['state_code'] = Variable<String>(code);
    map['state_name'] = Variable<String>(name);
    return map;
  }

  StateItemsCompanion toCompanion(bool nullToAbsent) {
    return StateItemsCompanion(
      code: Value(code),
      name: Value(name),
    );
  }

  factory StateItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StateItem(
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
    };
  }

  StateItem copyWith({String? code, String? name}) => StateItem(
        code: code ?? this.code,
        name: name ?? this.name,
      );
  StateItem copyWithCompanion(StateItemsCompanion data) {
    return StateItem(
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StateItem(')
          ..write('code: $code, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(code, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StateItem &&
          other.code == this.code &&
          other.name == this.name);
}

class StateItemsCompanion extends UpdateCompanion<StateItem> {
  final Value<String> code;
  final Value<String> name;
  final Value<int> rowid;
  const StateItemsCompanion({
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StateItemsCompanion.insert({
    required String code,
    required String name,
    this.rowid = const Value.absent(),
  })  : code = Value(code),
        name = Value(name);
  static Insertable<StateItem> custom({
    Expression<String>? code,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (code != null) 'state_code': code,
      if (name != null) 'state_name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StateItemsCompanion copyWith(
      {Value<String>? code, Value<String>? name, Value<int>? rowid}) {
    return StateItemsCompanion(
      code: code ?? this.code,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['state_code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['state_name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StateItemsCompanion(')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PostcodeItemsTable postcodeItems = $PostcodeItemsTable(this);
  late final $StateItemsTable stateItems = $StateItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [postcodeItems, stateItems];
}

typedef $$PostcodeItemsTableCreateCompanionBuilder = PostcodeItemsCompanion
    Function({
  required int code,
  required String areaName,
  required String postOffice,
  required String stateCode,
  Value<int> rowid,
});
typedef $$PostcodeItemsTableUpdateCompanionBuilder = PostcodeItemsCompanion
    Function({
  Value<int> code,
  Value<String> areaName,
  Value<String> postOffice,
  Value<String> stateCode,
  Value<int> rowid,
});

class $$PostcodeItemsTableFilterComposer
    extends Composer<_$AppDatabase, $PostcodeItemsTable> {
  $$PostcodeItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get areaName => $composableBuilder(
      column: $table.areaName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get postOffice => $composableBuilder(
      column: $table.postOffice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get stateCode => $composableBuilder(
      column: $table.stateCode, builder: (column) => ColumnFilters(column));
}

class $$PostcodeItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $PostcodeItemsTable> {
  $$PostcodeItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get areaName => $composableBuilder(
      column: $table.areaName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get postOffice => $composableBuilder(
      column: $table.postOffice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get stateCode => $composableBuilder(
      column: $table.stateCode, builder: (column) => ColumnOrderings(column));
}

class $$PostcodeItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PostcodeItemsTable> {
  $$PostcodeItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get areaName =>
      $composableBuilder(column: $table.areaName, builder: (column) => column);

  GeneratedColumn<String> get postOffice => $composableBuilder(
      column: $table.postOffice, builder: (column) => column);

  GeneratedColumn<String> get stateCode =>
      $composableBuilder(column: $table.stateCode, builder: (column) => column);
}

class $$PostcodeItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PostcodeItemsTable,
    PostcodeItem,
    $$PostcodeItemsTableFilterComposer,
    $$PostcodeItemsTableOrderingComposer,
    $$PostcodeItemsTableAnnotationComposer,
    $$PostcodeItemsTableCreateCompanionBuilder,
    $$PostcodeItemsTableUpdateCompanionBuilder,
    (
      PostcodeItem,
      BaseReferences<_$AppDatabase, $PostcodeItemsTable, PostcodeItem>
    ),
    PostcodeItem,
    PrefetchHooks Function()> {
  $$PostcodeItemsTableTableManager(_$AppDatabase db, $PostcodeItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PostcodeItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PostcodeItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PostcodeItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> code = const Value.absent(),
            Value<String> areaName = const Value.absent(),
            Value<String> postOffice = const Value.absent(),
            Value<String> stateCode = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PostcodeItemsCompanion(
            code: code,
            areaName: areaName,
            postOffice: postOffice,
            stateCode: stateCode,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int code,
            required String areaName,
            required String postOffice,
            required String stateCode,
            Value<int> rowid = const Value.absent(),
          }) =>
              PostcodeItemsCompanion.insert(
            code: code,
            areaName: areaName,
            postOffice: postOffice,
            stateCode: stateCode,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PostcodeItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PostcodeItemsTable,
    PostcodeItem,
    $$PostcodeItemsTableFilterComposer,
    $$PostcodeItemsTableOrderingComposer,
    $$PostcodeItemsTableAnnotationComposer,
    $$PostcodeItemsTableCreateCompanionBuilder,
    $$PostcodeItemsTableUpdateCompanionBuilder,
    (
      PostcodeItem,
      BaseReferences<_$AppDatabase, $PostcodeItemsTable, PostcodeItem>
    ),
    PostcodeItem,
    PrefetchHooks Function()>;
typedef $$StateItemsTableCreateCompanionBuilder = StateItemsCompanion Function({
  required String code,
  required String name,
  Value<int> rowid,
});
typedef $$StateItemsTableUpdateCompanionBuilder = StateItemsCompanion Function({
  Value<String> code,
  Value<String> name,
  Value<int> rowid,
});

class $$StateItemsTableFilterComposer
    extends Composer<_$AppDatabase, $StateItemsTable> {
  $$StateItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));
}

class $$StateItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $StateItemsTable> {
  $$StateItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$StateItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StateItemsTable> {
  $$StateItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$StateItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StateItemsTable,
    StateItem,
    $$StateItemsTableFilterComposer,
    $$StateItemsTableOrderingComposer,
    $$StateItemsTableAnnotationComposer,
    $$StateItemsTableCreateCompanionBuilder,
    $$StateItemsTableUpdateCompanionBuilder,
    (StateItem, BaseReferences<_$AppDatabase, $StateItemsTable, StateItem>),
    StateItem,
    PrefetchHooks Function()> {
  $$StateItemsTableTableManager(_$AppDatabase db, $StateItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StateItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StateItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StateItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> code = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StateItemsCompanion(
            code: code,
            name: name,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String code,
            required String name,
            Value<int> rowid = const Value.absent(),
          }) =>
              StateItemsCompanion.insert(
            code: code,
            name: name,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StateItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StateItemsTable,
    StateItem,
    $$StateItemsTableFilterComposer,
    $$StateItemsTableOrderingComposer,
    $$StateItemsTableAnnotationComposer,
    $$StateItemsTableCreateCompanionBuilder,
    $$StateItemsTableUpdateCompanionBuilder,
    (StateItem, BaseReferences<_$AppDatabase, $StateItemsTable, StateItem>),
    StateItem,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PostcodeItemsTableTableManager get postcodeItems =>
      $$PostcodeItemsTableTableManager(_db, _db.postcodeItems);
  $$StateItemsTableTableManager get stateItems =>
      $$StateItemsTableTableManager(_db, _db.stateItems);
}
