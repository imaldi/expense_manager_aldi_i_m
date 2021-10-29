// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ExpenseOrIncome extends DataClass implements Insertable<ExpenseOrIncome> {
  final int id;
  final String description;
  final String? categoryName;
  final int amount;
  final DateTime? date_commit;
  final bool isIncome;
  ExpenseOrIncome(
      {required this.id,
      required this.description,
      this.categoryName,
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
      categoryName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category_name']),
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
    if (!nullToAbsent || categoryName != null) {
      map['category_name'] = Variable<String?>(categoryName);
    }
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
      categoryName: categoryName == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryName),
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
      categoryName: serializer.fromJson<String?>(json['categoryName']),
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
      'categoryName': serializer.toJson<String?>(categoryName),
      'amount': serializer.toJson<int>(amount),
      'date_commit': serializer.toJson<DateTime?>(date_commit),
      'isIncome': serializer.toJson<bool>(isIncome),
    };
  }

  ExpenseOrIncome copyWith(
          {int? id,
          String? description,
          String? categoryName,
          int? amount,
          DateTime? date_commit,
          bool? isIncome}) =>
      ExpenseOrIncome(
        id: id ?? this.id,
        description: description ?? this.description,
        categoryName: categoryName ?? this.categoryName,
        amount: amount ?? this.amount,
        date_commit: date_commit ?? this.date_commit,
        isIncome: isIncome ?? this.isIncome,
      );
  @override
  String toString() {
    return (StringBuffer('ExpenseOrIncome(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('categoryName: $categoryName, ')
          ..write('amount: $amount, ')
          ..write('date_commit: $date_commit, ')
          ..write('isIncome: $isIncome')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, description, categoryName, amount, date_commit, isIncome);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseOrIncome &&
          other.id == this.id &&
          other.description == this.description &&
          other.categoryName == this.categoryName &&
          other.amount == this.amount &&
          other.date_commit == this.date_commit &&
          other.isIncome == this.isIncome);
}

class ExpenseOrIncomesCompanion extends UpdateCompanion<ExpenseOrIncome> {
  final Value<int> id;
  final Value<String> description;
  final Value<String?> categoryName;
  final Value<int> amount;
  final Value<DateTime?> date_commit;
  final Value<bool> isIncome;
  const ExpenseOrIncomesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.amount = const Value.absent(),
    this.date_commit = const Value.absent(),
    this.isIncome = const Value.absent(),
  });
  ExpenseOrIncomesCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    this.categoryName = const Value.absent(),
    required int amount,
    this.date_commit = const Value.absent(),
    this.isIncome = const Value.absent(),
  })  : description = Value(description),
        amount = Value(amount);
  static Insertable<ExpenseOrIncome> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<String?>? categoryName,
    Expression<int>? amount,
    Expression<DateTime?>? date_commit,
    Expression<bool>? isIncome,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (categoryName != null) 'category_name': categoryName,
      if (amount != null) 'amount': amount,
      if (date_commit != null) 'date_commit': date_commit,
      if (isIncome != null) 'is_income': isIncome,
    });
  }

  ExpenseOrIncomesCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<String?>? categoryName,
      Value<int>? amount,
      Value<DateTime?>? date_commit,
      Value<bool>? isIncome}) {
    return ExpenseOrIncomesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      categoryName: categoryName ?? this.categoryName,
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
    if (categoryName.present) {
      map['category_name'] = Variable<String?>(categoryName.value);
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
          ..write('categoryName: $categoryName, ')
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
  final VerificationMeta _categoryNameMeta =
      const VerificationMeta('categoryName');
  late final GeneratedColumn<String?> categoryName = GeneratedColumn<String?>(
      'category_name', aliasedName, true,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES categorys(name)');
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
      [id, description, categoryName, amount, date_commit, isIncome];
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
    if (data.containsKey('category_name')) {
      context.handle(
          _categoryNameMeta,
          categoryName.isAcceptableOrUnknown(
              data['category_name']!, _categoryNameMeta));
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

class Category extends DataClass implements Insertable<Category> {
  final String name;
  Category({required this.name});
  factory Category.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Category(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    return map;
  }

  CategorysCompanion toCompanion(bool nullToAbsent) {
    return CategorysCompanion(
      name: Value(name),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Category(
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
    };
  }

  Category copyWith({String? name}) => Category(
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => name.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Category && other.name == this.name);
}

class CategorysCompanion extends UpdateCompanion<Category> {
  final Value<String> name;
  const CategorysCompanion({
    this.name = const Value.absent(),
  });
  CategorysCompanion.insert({
    required String name,
  }) : name = Value(name);
  static Insertable<Category> custom({
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
    });
  }

  CategorysCompanion copyWith({Value<String>? name}) {
    return CategorysCompanion(
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategorysCompanion(')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $CategorysTable extends Categorys
    with TableInfo<$CategorysTable, Category> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CategorysTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [name];
  @override
  String get aliasedName => _alias ?? 'categorys';
  @override
  String get actualTableName => 'categorys';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Category.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategorysTable createAlias(String alias) {
    return $CategorysTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ExpenseOrIncomesTable expenseOrIncomes =
      $ExpenseOrIncomesTable(this);
  late final $CategorysTable categorys = $CategorysTable(this);
  late final ExpenseOrIncomeDao expenseOrIncomeDao =
      ExpenseOrIncomeDao(this as AppDatabase);
  late final CategoryDao categoryDao = CategoryDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [expenseOrIncomes, categorys];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ExpenseOrIncomeDaoMixin on DatabaseAccessor<AppDatabase> {
  $ExpenseOrIncomesTable get expenseOrIncomes =>
      attachedDatabase.expenseOrIncomes;
}
mixin _$CategoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $CategorysTable get categorys => attachedDatabase.categorys;
}
