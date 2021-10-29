import 'package:expense_manager_aldi_i_m/helper/navigator_helper.dart';
import 'package:expense_manager_aldi_i_m/screen/add_expense_or_income_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'const/const.dart';
import 'data/app_database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) { return AppDatabase().expenseOrIncomeDao; },
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var formatter = NumberFormat('###,###');
  var balance = 0;

  var balanceArray = [15000,25000,35000];
  var dateArray = ["4/4/2021","5/4/2021","6/4/2021"];
  var categoryArray = ["Food & Beverages", "Bonus","Transportation"];
  var descriptionArray = ["Makan Siang", "Bonus dari bos","Taxi pulang ke rumah"];
  var isInOrOut = [false,true,false];

  @override
  void initState() {
    super.initState();
    setState(() {
      balance = INITIAL_BALANCE - 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expense Manager"),
        ),
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Center(
                      child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Balance: Rp ${formatter.format(balance).replaceAll(",", ".")}",
                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            _buildItemList(context)
          ]),
        ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(16.0),
        child: FloatingActionButton(
          onPressed: () {
            navigateTo(context, Provider.value(value: Provider.of<ExpenseOrIncomeDao>(context, listen: false),
            child: AddExpenseOrIncomeScreen()));
          },
        child: Icon(Icons.add,color: Colors.white,),),
      ),
    );


  }
  _buildItemList(BuildContext context){
    final dao = Provider.of<ExpenseOrIncomeDao>(context, listen: false);

    return StreamBuilder(
        stream: dao.watchAllExpenseOrIncomes(),
        builder:(context, AsyncSnapshot<List<ExpenseOrIncome>> snapshot) {
          final item = snapshot.data ?? [];

          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: item.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: item[index].isIncome ?  Icon(Icons.arrow_downward_outlined,color: Colors.green,) : Icon(Icons.arrow_upward_outlined, color: Colors.red,) ,
                    title: Text("Rp. ${item[index].amount}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("category placeholder",softWrap: true,),
                        Text("${item[index].description}",softWrap: true,),
                      ],
                    ),
                    trailing: Text("${dateArray[index]}"),
                  ),
                ),
              );
            },
          );
        }
    );
  }
}
