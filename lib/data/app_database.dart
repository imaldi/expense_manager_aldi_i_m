import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

// Moor works by source gen. This file will all the generated code.
part 'app_database.g.dart';


class ExpenseOrIncomes extends Table {
  IntColumn get id => integer().autoIncrement()();
  // If the length constraint is not fulfilled, the ExpenseOrIncome will not
  // be inserted into the database and an exception will be thrown.
  TextColumn get description => text().withLength(min: 2, max: 50)();
  TextColumn get categoryName => text().nullable().customConstraint('NULL REFERENCES categorys(name)')();
  IntColumn get amount => integer()();
  // DateTime is not natively supported by SQLite
  // Moor converts it to & from UNIX seconds
  DateTimeColumn get date_commit => dateTime().nullable()();
  // Booleans are not supported as well, Moor converts them to integers
  // Simple default values are specified as Constants
  BoolColumn get isIncome => boolean().withDefault(Constant(false))();

}

class Categorys extends Table {
  TextColumn get name => text().withLength(min: 1, max: 10)();

  // Making name as the primary key of a Category requires names to be unique
  @override
  Set<Column> get primaryKey => {name};
}

class ExpenseOrIncomeWithCategory {
  final ExpenseOrIncome expenseOrIncome;
  final Category category;
  ExpenseOrIncomeWithCategory(
      this.expenseOrIncome,
      this.category
      );
}

@UseMoor(tables: [ExpenseOrIncomes, Categorys], daos: [ExpenseOrIncomeDao, CategoryDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
  // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite',
    // Good for debugging - prints SQL in the console
    logStatements: true,
  )));

  // Bump this when changing tables and columns.
  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    // Runs if the database has already been opened on the device with a lower version
    onUpgrade: (migrator, from, to) async {
      if (from == 1) {
        await migrator.addColumn(expenseOrIncomes, expenseOrIncomes.categoryName);
        await migrator.createTable(categorys);
      }
    },

    // Runs after all the migrations but BEFORE any queries have a chance to execute // deprecated
    // beforeOpen: (db, details) async {
    //   await db.customStatement('PRAGMA foreign_keys = ON');
    // },
    // updated
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}

@UseDao(
  tables: [ExpenseOrIncomes],
)
class ExpenseOrIncomeDao extends DatabaseAccessor<AppDatabase> with _$ExpenseOrIncomeDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  ExpenseOrIncomeDao(this.db) : super(db);

  // Stream<List<ExpenseOrIncome>> watchAllExpenseOrIncomes() {
  //   // Wrap the whole select statement in parenthesis
  //   return (select(expenseOrIncomes)
  //   // Statements like orderBy and where return void => the need to use a cascading ".." operator
  //     ..orderBy(
  //       ([
  //         // Primary sorting by due date
  //             (t) =>
  //             OrderingTerm(expression: t.date_commit, mode: OrderingMode.desc),
  //         // Secondary alphabetical sorting
  //             (t) => OrderingTerm(expression: t.description),
  //       ]),
  //     ))
  //   // watch the whole select statement
  //       .watch();
  // }
  Stream<List<ExpenseOrIncomeWithCategory>> watchAllExpenseOrIncomes() {
    // Wrap the whole select statement in parenthesis
    return (select(expenseOrIncomes)
    // Statements like orderBy and where return void => the need to use a cascading ".." operator
      ..orderBy(
        ([
          // Primary sorting by due date
              (t) =>
              OrderingTerm(expression: t.date_commit, mode: OrderingMode.desc),
          // Secondary alphabetical sorting
              (t) => OrderingTerm(expression: t.description),
        ]),
      ))
        .join(
      [
        // Join all the tasks with their tags.
        // It's important that we use equalsExp and not just equals.
        // This way, we can join using all tag names in the tasks table, not just a specific one.
        leftOuterJoin(categorys, categorys.name.equalsExp(expenseOrIncomes.categoryName)),
      ],
    )
    // watch the whole select statement
        .watch().map(
            (rows) => rows.map(
              (row) {
            return ExpenseOrIncomeWithCategory(
              row.readTable(expenseOrIncomes),
              row.readTable(categorys),
            );
          },
        ).toList(),);
  }


  
  Future insertExpenseOrIncome(Insertable<ExpenseOrIncome> expenseOrIncome) => into(expenseOrIncomes).insert(expenseOrIncome);

  // Updates a ExpenseOrIncome with a matching primary key
  Future updateExpenseOrIncome(Insertable<ExpenseOrIncome> expenseOrIncome) => update(expenseOrIncomes).replace(expenseOrIncome);

  Future deleteExpenseOrIncome(Insertable<ExpenseOrIncome> expenseOrIncome) => delete(expenseOrIncomes).delete(expenseOrIncome);

}

@UseDao(
  tables: [Categorys],
)
class CategoryDao extends DatabaseAccessor<AppDatabase> with _$CategoryDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  CategoryDao(this.db) : super(db);

  // // All tables have getters in the generated class - we can select the ExpenseOrIncomes table
  Stream<List<Category>> watchAllCategorys() => select(categorys).watch();




  Future insertCategory(Insertable<Category> category) => into(categorys).insert(category);

  // Updates a ExpenseOrIncome with a matching primary key
  Future updateCategory(Insertable<Category> category) => update(categorys).replace(category);

  Future deleteCategory(Insertable<Category> category) => delete(categorys).delete(category);

}



