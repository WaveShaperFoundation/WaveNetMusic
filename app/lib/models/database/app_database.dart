import "package:drift/drift.dart";
import "package:drift_flutter/drift_flutter.dart";

part 'app_database.g.dart';

class ConnectionInstances extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();

  TextColumn get host => text().withLength(min: 1, max: 50)();

  IntColumn get serverPort => integer()();

  TextColumn get authToken => text()();
}

enum SearchHistory {
  ARTIST,
  ALBUM,
  TRACK,
}

class SearchHistoryEntry extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get query => text().withLength(min: 1, max: 50)();
  IntColumn get entryId => integer()();
  IntColumn get type => intEnum<SearchHistory>()();
  DateTimeColumn get timestamp => dateTime()();
}

@DriftDatabase(tables: [ConnectionInstances, SearchHistoryEntry])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    // `driftDatabase` from `package:drift_flutter` stores the database in
    // `getApplicationDocumentsDirectory()`.
    return driftDatabase(name: 'wavenet');
  }
}
