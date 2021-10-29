// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ExpenseOrIncome extends DataClass implements Insertable<ExpenseOrIncome> {
  final int id;
  final String description;
  final int amount;
  final DateTime? date_commit;
  final bool isIncome;
  ExpenseOrIncome(
      {required this.id,
      required this.description,
      required this.amount,
      this.date_commit,
      required this.isIncome});
  factory ExpenseOrIncome.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ExpenseOrIncome(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      amount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      date_commit: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_commit']),
      isIncome: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_income'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['amount'] = Variable<int>(amount);
    if (!nullToAbsent || date_commit != null) {
      map['date_commit'] = Variable<DateTime?>(date_commit);
    }
    map['is_income'] = Variable<bool>(isIncome);
    return map;
  }

  ExpenseOrIncomesCompanion toCompanion(bool nullToAbsent) {
    return ExpenseOrIncomesCompanion(
      id: Value(id),
      description: Value(description),
      amount: Value(amount),
      date_commit: date_commit == null && nullToAbsent
          ? const Value.absent()
          : Value(date_commit),
      isIncome: Value(isIncome),
    );
  }

  factory ExpenseOrIncome.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ExpenseOrIncome(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      amount: serializer.fromJson<int>(json['amount']),
      date_commit: serializer.fromJson<DateTime?>(json['date_commit']),
      isIncome: serializer.fromJson<bool>(json['isIncome']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'amount': serializer.toJson<int>(amount),
      'date_commit': serializer.toJson<DateTime?>(date_commit),
      'isIncome': serializer.toJson<bool>(isIncome),
    };
  }

  ExpenseOrIncome copyWith(
          {int? id,
          String? description,
          int? amount,
          DateTime? date_commit,
          bool? isIncome}) =>
      ExpenseOrIncome(
        id: id ?? this.id,
        description: description ?? this.description,
        amount: amount ?? this.amount,
        date_commit: date_commit ?? this.date_commit,
        isIncome: isIncome ?? this.isIncome,
      );
  @override
  String toString() {
    return (StringBuffer('ExpenseOrIncome(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('date_commit: $date_commit, ')
          ..write('isIncome: $isIncome')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, description, amount, date_commit, isIncome);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseOrIncome &&
          other.id == this.id &&
          other.description == this.description &&
          other.amount == this.amount &&
          other.date_commit == this.date_commit &&
          other.isIncome == this.isIncome);
}

class ExpenseOrIncomesCompanion extends UpdateCompanion<ExpenseOrIncome> {
  final Value<int> id;
  final Value<String> description;
  final Value<int> amount;
  final Value<DateTime?> date_commit;
  final Value<bool> isIncome;
  const ExpenseOrIncomesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.amount = const Value.absent(),
    this.date_commit = const Value.absent(),
    this.isIncome = const Value.absent(),
  });
  ExpenseOrIncomesCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required int amount,
    this.date_commit = const Value.absent(),
    this.isIncome = const Value.absent(),
  })  : description = Value(description),
        amount = Value(amount);
  static Insertable<ExpenseOrIncome> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<int>? amount,
    Expression<DateTime?>? date_commit,
    Expression<bool>? isIncome,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (amount != null) 'amount': amount,
      if (date_commit != null) 'date_commit': date_commit,
      if (isIncome != null) 'is_income': isIncome,
    });
  }

  ExpenseOrIncomesCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<int>? amount,
      Value<DateTime?>? date_commit,
      Value<bool>? isIncome}) {
    return ExpenseOrIncomesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      date_commit: date_commit ?? this.date_commit,
      isIncome: isIncome ?? this.isIncome,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (date_commit.present) {
      map['date_commit'] = Variable<DateTime?>(date_commit.value);
    }
    if (isIncome.present) {
      map['is_income'] = Variable<bool>(isIncome.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseOrIncomesCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('date_commit: $date_commit, ')
          ..write('isIncome: $isIncome')
          ..write(')'))
        .toString();
  }
}

class $ExpenseOrIncomesTable extends ExpenseOrIncomes
    with TableInfo<$ExpenseOrIncomesTable, ExpenseOrIncome> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ExpenseOrIncomesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 50),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  late final GeneratedColumn<int?> amount = GeneratedColumn<int?>(
      'amount', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _date_commitMeta =
      const VerificationMeta('date_commit');
  late final GeneratedColumn<DateTime?> date_commit =
      GeneratedColumn<DateTime?>('date_commit', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _isIncomeMeta = const VerificationMeta('isIncome');
  late final GeneratedColumn<bool?> isIncome = GeneratedColumn<bool?>(
      'is_income', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_income IN (0, 1))',
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, description, amount, date_commit, isIncome];
  @override
  String get aliasedName => _alias ?? 'expense_or_incomes';
  @override
  String get actualTableName => 'expense_or_incomes';
  @override
  VerificationContext validateIntegrity(Insertable<ExpenseOrIncome> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date_commit')) {
      context.handle(
          _date_commitMeta,
          date_commit.isAcceptableOrUnknown(
              data['date_commit']!, _date_commitMeta));
    }
    if (data.containsKey('is_income')) {
      context.handle(_isIncomeMeta,
          isIncome.isAcceptableOrUnknown(data['is_income']!, _isIncomeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpenseOrIncome map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ExpenseOrIncome.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ExpenseOrIncomesTable createAlias(String alias) {
    return $ExpenseOrIncomesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ExpenseOrIncomesTable expenseOrIncomes =
      $ExpenseOrIncomesTable(this);
  late final ExpenseOrIncomeDao expenseOrIncomeDao =
      ExpenseOrIncomeDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [expenseOrIncomes];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ExpenseOrIncomeDaoMixin on DatabaseAccessor<AppDatabase> {
  $ExpenseOrIncomesTable get expenseOrIncomes =>
      attachedDatabase.expenseOrIncomes;
}
