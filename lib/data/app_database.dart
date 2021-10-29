import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

// Moor works by source gen. This file will all the generated code.
part 'app_database.g.dart';


class ExpenseOrIncomes extends Table {
  IntColumn get id => integer().autoIncrement()();
  // If the length constraint is not fulfilled, the ExpenseOrIncome will not
  // be inserted into the database and an exception will be thrown.
  TextColumn get description => text().withLength(min: 2, max: 50)();
  IntColumn get amount => integer()();
  // DateTime is not natively supported by SQLite
  // Moor converts it to & from UNIX seconds
  DateTimeColumn get date_commit => dateTime().nullable()();
  // Booleans are not supported as well, Moor converts them to integers
  // Simple default values are specified as Constants
  BoolColumn get isIncome => boolean().withDefault(Constant(false))();
}

@UseMoor(tables: [ExpenseOrIncomes], daos: [ExpenseOrIncomeDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
  // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite',
    // Good for debugging - prints SQL in the console
    logStatements: true,
  )));

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 1;


}

@UseDao(
  tables: [ExpenseOrIncomes],
)
class ExpenseOrIncomeDao extends DatabaseAccessor<AppDatabase> with _$ExpenseOrIncomeDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  ExpenseOrIncomeDao(this.db) : super(db);

  // // All tables have getters in the generated class - we can select the ExpenseOrIncomes table
  // Future<List<ExpenseOrIncome>> getAllExpenseOrIncomes() => select(ExpenseOrIncomes).get();
  //
  // // Moor supports Streams which emit elements when the watched data changes
  // Stream<List<ExpenseOrIncome>> watchAllExpenseOrIncomes() => select(ExpenseOrIncomes).watch();

  // Updated to use the orderBy statement
  Stream<List<ExpenseOrIncome>> watchAllExpenseOrIncomes() {
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
    // watch the whole select statement
        .watch();
  }


  
  Future insertExpenseOrIncome(Insertable<ExpenseOrIncome> expenseOrIncome) => into(expenseOrIncomes).insert(expenseOrIncome);

  // Updates a ExpenseOrIncome with a matching primary key
  Future updateExpenseOrIncome(Insertable<ExpenseOrIncome> expenseOrIncome) => update(expenseOrIncomes).replace(expenseOrIncome);

  Future deleteExpenseOrIncome(Insertable<ExpenseOrIncome> expenseOrIncome) => delete(expenseOrIncomes).delete(expenseOrIncome);

}



