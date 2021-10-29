import 'package:expense_manager_aldi_i_m/screen/form_add_expense.dart';
import 'package:expense_manager_aldi_i_m/widget/custom_tab_bar.dart';
import 'package:flutter/material.dart';

class AddExpenseOrIncomeScreen extends StatefulWidget {
  const AddExpenseOrIncomeScreen({Key? key}) : super(key: key);

  @override
  _AddExpenseOrIncomeScreenState createState() => _AddExpenseOrIncomeScreenState();
}

class _AddExpenseOrIncomeScreenState extends State<AddExpenseOrIncomeScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // bottom: ,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          // color: Colors.white,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                // color: Colors.white,
                child: CustomAppbar(tabs: [
                  Tab(child: Text("EXPENSE"),),
                  Tab(child: Text("INCOME")),
                  // Tab(icon: Icon(Icons.directions_bike)),
                ]),

              ),
              SizedBox(height: 16.0,),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(child: FormAddExpense(isIncome: false,)),
                    Container(child: FormAddExpense(isIncome: true,)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
