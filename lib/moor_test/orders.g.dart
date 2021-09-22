// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Order extends DataClass implements Insertable<Order> {
  final String device_id;
  final int id;
  final String? device_name;
  Order({required this.device_id, required this.id, this.device_name});
  factory Order.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Order(
      device_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}device_id'])!,
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      device_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}device_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['device_id'] = Variable<String>(device_id);
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || device_name != null) {
      map['device_name'] = Variable<String?>(device_name);
    }
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      device_id: Value(device_id),
      id: Value(id),
      device_name: device_name == null && nullToAbsent
          ? const Value.absent()
          : Value(device_name),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Order(
      device_id: serializer.fromJson<String>(json['device_id']),
      id: serializer.fromJson<int>(json['id']),
      device_name: serializer.fromJson<String?>(json['device_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'device_id': serializer.toJson<String>(device_id),
      'id': serializer.toJson<int>(id),
      'device_name': serializer.toJson<String?>(device_name),
    };
  }

  Order copyWith({String? device_id, int? id, String? device_name}) => Order(
        device_id: device_id ?? this.device_id,
        id: id ?? this.id,
        device_name: device_name ?? this.device_name,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('device_id: $device_id, ')
          ..write('id: $id, ')
          ..write('device_name: $device_name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(device_id.hashCode, $mrjc(id.hashCode, device_name.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          other.device_id == this.device_id &&
          other.id == this.id &&
          other.device_name == this.device_name);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<String> device_id;
  final Value<int> id;
  final Value<String?> device_name;
  const OrdersCompanion({
    this.device_id = const Value.absent(),
    this.id = const Value.absent(),
    this.device_name = const Value.absent(),
  });
  OrdersCompanion.insert({
    required String device_id,
    required int id,
    this.device_name = const Value.absent(),
  })  : device_id = Value(device_id),
        id = Value(id);
  static Insertable<Order> custom({
    Expression<String>? device_id,
    Expression<int>? id,
    Expression<String?>? device_name,
  }) {
    return RawValuesInsertable({
      if (device_id != null) 'device_id': device_id,
      if (id != null) 'id': id,
      if (device_name != null) 'device_name': device_name,
    });
  }

  OrdersCompanion copyWith(
      {Value<String>? device_id, Value<int>? id, Value<String?>? device_name}) {
    return OrdersCompanion(
      device_id: device_id ?? this.device_id,
      id: id ?? this.id,
      device_name: device_name ?? this.device_name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (device_id.present) {
      map['device_id'] = Variable<String>(device_id.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (device_name.present) {
      map['device_name'] = Variable<String?>(device_name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('device_id: $device_id, ')
          ..write('id: $id, ')
          ..write('device_name: $device_name')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  final GeneratedDatabase _db;
  final String? _alias;
  $OrdersTable(this._db, [this._alias]);
  final VerificationMeta _device_idMeta = const VerificationMeta('device_id');
  late final GeneratedColumn<String?> device_id = GeneratedColumn<String?>(
      'device_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _device_nameMeta =
      const VerificationMeta('device_name');
  late final GeneratedColumn<String?> device_name = GeneratedColumn<String?>(
      'device_name', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [device_id, id, device_name];
  @override
  String get aliasedName => _alias ?? 'orders';
  @override
  String get actualTableName => 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('device_id')) {
      context.handle(_device_idMeta,
          device_id.isAcceptableOrUnknown(data['device_id']!, _device_idMeta));
    } else if (isInserting) {
      context.missing(_device_idMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('device_name')) {
      context.handle(
          _device_nameMeta,
          device_name.isAcceptableOrUnknown(
              data['device_name']!, _device_nameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {device_id, id};
  @override
  Order map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Order.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $OrdersTable orders = $OrdersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [orders];
}
