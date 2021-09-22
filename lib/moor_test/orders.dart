import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'orders.g.dart';
class Orders extends Table {

  TextColumn get device_id => text()();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get device_name => text().nullable()();
  @override
  Set<Column> get primaryKey => {device_id,id};
}
LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    dbFolder.create(recursive:true);
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}
@UseMoor(tables: [Orders])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  Future<List<Order>> getAllOrder() => select(orders).get();
  Stream<List<Order>> watchAllOrder() => select(orders).watch();
  Future<void> insertNewOrder(Order order) => into(orders).insert(order);
  Future<void> deleteOrder(Order order) => delete(orders).delete(order);
}
