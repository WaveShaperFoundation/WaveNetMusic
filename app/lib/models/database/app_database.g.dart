// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ConnectionInstancesTable extends ConnectionInstances
    with TableInfo<$ConnectionInstancesTable, ConnectionInstance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConnectionInstancesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _hostMeta = const VerificationMeta('host');
  @override
  late final GeneratedColumn<String> host = GeneratedColumn<String>(
      'host', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _serverPortMeta =
      const VerificationMeta('serverPort');
  @override
  late final GeneratedColumn<int> serverPort = GeneratedColumn<int>(
      'server_port', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _authTokenMeta =
      const VerificationMeta('authToken');
  @override
  late final GeneratedColumn<String> authToken = GeneratedColumn<String>(
      'auth_token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, host, serverPort, authToken];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'connection_instances';
  @override
  VerificationContext validateIntegrity(Insertable<ConnectionInstance> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('host')) {
      context.handle(
          _hostMeta, host.isAcceptableOrUnknown(data['host']!, _hostMeta));
    } else if (isInserting) {
      context.missing(_hostMeta);
    }
    if (data.containsKey('server_port')) {
      context.handle(
          _serverPortMeta,
          serverPort.isAcceptableOrUnknown(
              data['server_port']!, _serverPortMeta));
    } else if (isInserting) {
      context.missing(_serverPortMeta);
    }
    if (data.containsKey('auth_token')) {
      context.handle(_authTokenMeta,
          authToken.isAcceptableOrUnknown(data['auth_token']!, _authTokenMeta));
    } else if (isInserting) {
      context.missing(_authTokenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConnectionInstance map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConnectionInstance(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      host: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}host'])!,
      serverPort: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}server_port'])!,
      authToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}auth_token'])!,
    );
  }

  @override
  $ConnectionInstancesTable createAlias(String alias) {
    return $ConnectionInstancesTable(attachedDatabase, alias);
  }
}

class ConnectionInstance extends DataClass
    implements Insertable<ConnectionInstance> {
  final int id;
  final String name;
  final String host;
  final int serverPort;
  final String authToken;
  const ConnectionInstance(
      {required this.id,
      required this.name,
      required this.host,
      required this.serverPort,
      required this.authToken});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['host'] = Variable<String>(host);
    map['server_port'] = Variable<int>(serverPort);
    map['auth_token'] = Variable<String>(authToken);
    return map;
  }

  ConnectionInstancesCompanion toCompanion(bool nullToAbsent) {
    return ConnectionInstancesCompanion(
      id: Value(id),
      name: Value(name),
      host: Value(host),
      serverPort: Value(serverPort),
      authToken: Value(authToken),
    );
  }

  factory ConnectionInstance.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConnectionInstance(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      host: serializer.fromJson<String>(json['host']),
      serverPort: serializer.fromJson<int>(json['serverPort']),
      authToken: serializer.fromJson<String>(json['authToken']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'host': serializer.toJson<String>(host),
      'serverPort': serializer.toJson<int>(serverPort),
      'authToken': serializer.toJson<String>(authToken),
    };
  }

  ConnectionInstance copyWith(
          {int? id,
          String? name,
          String? host,
          int? serverPort,
          String? authToken}) =>
      ConnectionInstance(
        id: id ?? this.id,
        name: name ?? this.name,
        host: host ?? this.host,
        serverPort: serverPort ?? this.serverPort,
        authToken: authToken ?? this.authToken,
      );
  ConnectionInstance copyWithCompanion(ConnectionInstancesCompanion data) {
    return ConnectionInstance(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      host: data.host.present ? data.host.value : this.host,
      serverPort:
          data.serverPort.present ? data.serverPort.value : this.serverPort,
      authToken: data.authToken.present ? data.authToken.value : this.authToken,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConnectionInstance(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('host: $host, ')
          ..write('serverPort: $serverPort, ')
          ..write('authToken: $authToken')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, host, serverPort, authToken);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConnectionInstance &&
          other.id == this.id &&
          other.name == this.name &&
          other.host == this.host &&
          other.serverPort == this.serverPort &&
          other.authToken == this.authToken);
}

class ConnectionInstancesCompanion extends UpdateCompanion<ConnectionInstance> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> host;
  final Value<int> serverPort;
  final Value<String> authToken;
  const ConnectionInstancesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.host = const Value.absent(),
    this.serverPort = const Value.absent(),
    this.authToken = const Value.absent(),
  });
  ConnectionInstancesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String host,
    required int serverPort,
    required String authToken,
  })  : name = Value(name),
        host = Value(host),
        serverPort = Value(serverPort),
        authToken = Value(authToken);
  static Insertable<ConnectionInstance> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? host,
    Expression<int>? serverPort,
    Expression<String>? authToken,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (host != null) 'host': host,
      if (serverPort != null) 'server_port': serverPort,
      if (authToken != null) 'auth_token': authToken,
    });
  }

  ConnectionInstancesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? host,
      Value<int>? serverPort,
      Value<String>? authToken}) {
    return ConnectionInstancesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      host: host ?? this.host,
      serverPort: serverPort ?? this.serverPort,
      authToken: authToken ?? this.authToken,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (host.present) {
      map['host'] = Variable<String>(host.value);
    }
    if (serverPort.present) {
      map['server_port'] = Variable<int>(serverPort.value);
    }
    if (authToken.present) {
      map['auth_token'] = Variable<String>(authToken.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConnectionInstancesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('host: $host, ')
          ..write('serverPort: $serverPort, ')
          ..write('authToken: $authToken')
          ..write(')'))
        .toString();
  }
}

class $SearchHistoryEntryTable extends SearchHistoryEntry
    with TableInfo<$SearchHistoryEntryTable, SearchHistoryEntryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchHistoryEntryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _queryMeta = const VerificationMeta('query');
  @override
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
      'query', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _entryIdMeta =
      const VerificationMeta('entryId');
  @override
  late final GeneratedColumn<int> entryId = GeneratedColumn<int>(
      'entry_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<SearchHistory, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<SearchHistory>(
              $SearchHistoryEntryTable.$convertertype);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, query, entryId, type, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_history_entry';
  @override
  VerificationContext validateIntegrity(
      Insertable<SearchHistoryEntryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('query')) {
      context.handle(
          _queryMeta, query.isAcceptableOrUnknown(data['query']!, _queryMeta));
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    if (data.containsKey('entry_id')) {
      context.handle(_entryIdMeta,
          entryId.isAcceptableOrUnknown(data['entry_id']!, _entryIdMeta));
    } else if (isInserting) {
      context.missing(_entryIdMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SearchHistoryEntryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchHistoryEntryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      query: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}query'])!,
      entryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}entry_id'])!,
      type: $SearchHistoryEntryTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $SearchHistoryEntryTable createAlias(String alias) {
    return $SearchHistoryEntryTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SearchHistory, int, int> $convertertype =
      const EnumIndexConverter<SearchHistory>(SearchHistory.values);
}

class SearchHistoryEntryData extends DataClass
    implements Insertable<SearchHistoryEntryData> {
  final int id;
  final String query;
  final int entryId;
  final SearchHistory type;
  final DateTime timestamp;
  const SearchHistoryEntryData(
      {required this.id,
      required this.query,
      required this.entryId,
      required this.type,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['query'] = Variable<String>(query);
    map['entry_id'] = Variable<int>(entryId);
    {
      map['type'] =
          Variable<int>($SearchHistoryEntryTable.$convertertype.toSql(type));
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  SearchHistoryEntryCompanion toCompanion(bool nullToAbsent) {
    return SearchHistoryEntryCompanion(
      id: Value(id),
      query: Value(query),
      entryId: Value(entryId),
      type: Value(type),
      timestamp: Value(timestamp),
    );
  }

  factory SearchHistoryEntryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchHistoryEntryData(
      id: serializer.fromJson<int>(json['id']),
      query: serializer.fromJson<String>(json['query']),
      entryId: serializer.fromJson<int>(json['entryId']),
      type: $SearchHistoryEntryTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'query': serializer.toJson<String>(query),
      'entryId': serializer.toJson<int>(entryId),
      'type': serializer
          .toJson<int>($SearchHistoryEntryTable.$convertertype.toJson(type)),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  SearchHistoryEntryData copyWith(
          {int? id,
          String? query,
          int? entryId,
          SearchHistory? type,
          DateTime? timestamp}) =>
      SearchHistoryEntryData(
        id: id ?? this.id,
        query: query ?? this.query,
        entryId: entryId ?? this.entryId,
        type: type ?? this.type,
        timestamp: timestamp ?? this.timestamp,
      );
  SearchHistoryEntryData copyWithCompanion(SearchHistoryEntryCompanion data) {
    return SearchHistoryEntryData(
      id: data.id.present ? data.id.value : this.id,
      query: data.query.present ? data.query.value : this.query,
      entryId: data.entryId.present ? data.entryId.value : this.entryId,
      type: data.type.present ? data.type.value : this.type,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoryEntryData(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('entryId: $entryId, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, query, entryId, type, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchHistoryEntryData &&
          other.id == this.id &&
          other.query == this.query &&
          other.entryId == this.entryId &&
          other.type == this.type &&
          other.timestamp == this.timestamp);
}

class SearchHistoryEntryCompanion
    extends UpdateCompanion<SearchHistoryEntryData> {
  final Value<int> id;
  final Value<String> query;
  final Value<int> entryId;
  final Value<SearchHistory> type;
  final Value<DateTime> timestamp;
  const SearchHistoryEntryCompanion({
    this.id = const Value.absent(),
    this.query = const Value.absent(),
    this.entryId = const Value.absent(),
    this.type = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  SearchHistoryEntryCompanion.insert({
    this.id = const Value.absent(),
    required String query,
    required int entryId,
    required SearchHistory type,
    required DateTime timestamp,
  })  : query = Value(query),
        entryId = Value(entryId),
        type = Value(type),
        timestamp = Value(timestamp);
  static Insertable<SearchHistoryEntryData> custom({
    Expression<int>? id,
    Expression<String>? query,
    Expression<int>? entryId,
    Expression<int>? type,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (query != null) 'query': query,
      if (entryId != null) 'entry_id': entryId,
      if (type != null) 'type': type,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  SearchHistoryEntryCompanion copyWith(
      {Value<int>? id,
      Value<String>? query,
      Value<int>? entryId,
      Value<SearchHistory>? type,
      Value<DateTime>? timestamp}) {
    return SearchHistoryEntryCompanion(
      id: id ?? this.id,
      query: query ?? this.query,
      entryId: entryId ?? this.entryId,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (entryId.present) {
      map['entry_id'] = Variable<int>(entryId.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
          $SearchHistoryEntryTable.$convertertype.toSql(type.value));
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoryEntryCompanion(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('entryId: $entryId, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ConnectionInstancesTable connectionInstances =
      $ConnectionInstancesTable(this);
  late final $SearchHistoryEntryTable searchHistoryEntry =
      $SearchHistoryEntryTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [connectionInstances, searchHistoryEntry];
}

typedef $$ConnectionInstancesTableCreateCompanionBuilder
    = ConnectionInstancesCompanion Function({
  Value<int> id,
  required String name,
  required String host,
  required int serverPort,
  required String authToken,
});
typedef $$ConnectionInstancesTableUpdateCompanionBuilder
    = ConnectionInstancesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> host,
  Value<int> serverPort,
  Value<String> authToken,
});

class $$ConnectionInstancesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ConnectionInstancesTable,
    ConnectionInstance,
    $$ConnectionInstancesTableFilterComposer,
    $$ConnectionInstancesTableOrderingComposer,
    $$ConnectionInstancesTableCreateCompanionBuilder,
    $$ConnectionInstancesTableUpdateCompanionBuilder> {
  $$ConnectionInstancesTableTableManager(
      _$AppDatabase db, $ConnectionInstancesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$ConnectionInstancesTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$ConnectionInstancesTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> host = const Value.absent(),
            Value<int> serverPort = const Value.absent(),
            Value<String> authToken = const Value.absent(),
          }) =>
              ConnectionInstancesCompanion(
            id: id,
            name: name,
            host: host,
            serverPort: serverPort,
            authToken: authToken,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String host,
            required int serverPort,
            required String authToken,
          }) =>
              ConnectionInstancesCompanion.insert(
            id: id,
            name: name,
            host: host,
            serverPort: serverPort,
            authToken: authToken,
          ),
        ));
}

class $$ConnectionInstancesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ConnectionInstancesTable> {
  $$ConnectionInstancesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get host => $state.composableBuilder(
      column: $state.table.host,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get serverPort => $state.composableBuilder(
      column: $state.table.serverPort,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get authToken => $state.composableBuilder(
      column: $state.table.authToken,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ConnectionInstancesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ConnectionInstancesTable> {
  $$ConnectionInstancesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get host => $state.composableBuilder(
      column: $state.table.host,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get serverPort => $state.composableBuilder(
      column: $state.table.serverPort,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get authToken => $state.composableBuilder(
      column: $state.table.authToken,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SearchHistoryEntryTableCreateCompanionBuilder
    = SearchHistoryEntryCompanion Function({
  Value<int> id,
  required String query,
  required int entryId,
  required SearchHistory type,
  required DateTime timestamp,
});
typedef $$SearchHistoryEntryTableUpdateCompanionBuilder
    = SearchHistoryEntryCompanion Function({
  Value<int> id,
  Value<String> query,
  Value<int> entryId,
  Value<SearchHistory> type,
  Value<DateTime> timestamp,
});

class $$SearchHistoryEntryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SearchHistoryEntryTable,
    SearchHistoryEntryData,
    $$SearchHistoryEntryTableFilterComposer,
    $$SearchHistoryEntryTableOrderingComposer,
    $$SearchHistoryEntryTableCreateCompanionBuilder,
    $$SearchHistoryEntryTableUpdateCompanionBuilder> {
  $$SearchHistoryEntryTableTableManager(
      _$AppDatabase db, $SearchHistoryEntryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SearchHistoryEntryTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$SearchHistoryEntryTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> query = const Value.absent(),
            Value<int> entryId = const Value.absent(),
            Value<SearchHistory> type = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              SearchHistoryEntryCompanion(
            id: id,
            query: query,
            entryId: entryId,
            type: type,
            timestamp: timestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String query,
            required int entryId,
            required SearchHistory type,
            required DateTime timestamp,
          }) =>
              SearchHistoryEntryCompanion.insert(
            id: id,
            query: query,
            entryId: entryId,
            type: type,
            timestamp: timestamp,
          ),
        ));
}

class $$SearchHistoryEntryTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SearchHistoryEntryTable> {
  $$SearchHistoryEntryTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get query => $state.composableBuilder(
      column: $state.table.query,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get entryId => $state.composableBuilder(
      column: $state.table.entryId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<SearchHistory, SearchHistory, int> get type =>
      $state.composableBuilder(
          column: $state.table.type,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SearchHistoryEntryTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SearchHistoryEntryTable> {
  $$SearchHistoryEntryTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get query => $state.composableBuilder(
      column: $state.table.query,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get entryId => $state.composableBuilder(
      column: $state.table.entryId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ConnectionInstancesTableTableManager get connectionInstances =>
      $$ConnectionInstancesTableTableManager(_db, _db.connectionInstances);
  $$SearchHistoryEntryTableTableManager get searchHistoryEntry =>
      $$SearchHistoryEntryTableTableManager(_db, _db.searchHistoryEntry);
}
