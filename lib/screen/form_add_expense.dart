import 'package:expense_manager_aldi_i_m/const/const.dart';
import 'package:expense_manager_aldi_i_m/data/app_database.dart';
import 'package:expense_manager_aldi_i_m/helper/intl_tools.dart';
import 'package:expense_manager_aldi_i_m/helper/navigator_helper.dart';
import 'package:expense_manager_aldi_i_m/screen/select_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moor_flutter/moor_flutter.dart' as moor_flutter;
import 'package:provider/provider.dart';

class FormAddExpense extends StatefulWidget {
  const FormAddExpense({Key? key, required this.isIncome}) : super(key: key);
  final bool? isIncome;

  @override
  _FormAddExpenseState createState() => _FormAddExpenseState();
}

class _FormAddExpenseState extends State<FormAddExpense> {
  var isEditing = false;
  DateTime? date;
  TextEditingController dateController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        children: [
          Text("Hey"),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () async {
                          var res = await showDatePicker(
                              context: context, initialDate: DateTime.now(), firstDate: firstDate, lastDate: lastDate);
                          if (res != null) {
                            setState(() {
                              date = res;
                              dateController.text = formatDate(date!);
                            });
                            print("formatDate(res) ${formatDate(res)}");
                          }
                        },
                  child: Container(
                    // padding: EdgeInsets.all(size_medium),
                    child: TextField(
                      controller: dateController,
                      enabled: false,
                      decoration: InputDecoration(labelText: "Transaction Date"),
                    ),
                  ),
                ),

              ),

            ],
          ),
          Container(
            // padding: EdgeInsets.all(size_medium),
            child: InkWell(
              onTap: (){
                navigateTo(context, SelectCategoryScreen());
                categoryController.text = "test";
              },
              child: TextFormField(
                controller: categoryController,
                enabled: false,
                decoration: InputDecoration(labelText: "Select Category", labelStyle: TextStyle(color: Colors.grey)),
                validator: (val){
                  if((val ?? "").isEmpty){
                    return "Category cannot be blank";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Container(
            // padding: EdgeInsets.all(size_medium),
            child: TextFormField(
              controller: amountController,
              decoration: InputDecoration(labelText: "Amount", labelStyle: TextStyle(color: Colors.grey)),
              keyboardType: TextInputType.number,
              validator: (val){
                if((val ?? "").isEmpty){
                  return "Amount cannot be blank";
                } else {
                  return null;
                }
              },
            ),
          ),
          Container(
            // padding: EdgeInsets.all(size_medium),
            child: TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Description", labelStyle: TextStyle(color: Colors.grey)),
              validator: (val){
                if((val ?? "").isEmpty){
                  return "Description cannot be blank";
                } else {
                  return null;
                }
              },
            ),
          ),

          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(size_medium),

                child: ElevatedButton(onPressed: (){
                  final dao = Provider.of<ExpenseOrIncomeDao>(context, listen: false);
                  final expenseOrIncome = ExpenseOrIncomesCompanion(
                    description: moor_flutter.Value(descriptionController.text),
                    date_commit: moor_flutter.Value(date),
                    isIncome: moor_flutter.Value(widget.isIncome ?? false),
                    amount: moor_flutter.Value(int.parse(amountController.text))
                    // dueDate: Value(newTaskDate),
                  );
                  dao.insertExpenseOrIncome(expenseOrIncome);
                  navigatorPop(context);
                }, child: Text("Save"))),
              ),
            ],
          )
        ],
      ),
    ),
    );
  }
}
