import 'package:expense_manager_aldi_i_m/const/const.dart';
import 'package:expense_manager_aldi_i_m/widget/add_category_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectCategoryScreen extends StatefulWidget {
  const SelectCategoryScreen({Key? key}) : super(key: key);

  @override
  _SelectCategoryScreenState createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen> {
  var formatter = NumberFormat('###,###');
  var balance = 0;


  var categoryArray = ["Food & Beverages", "Bonus","Transportation"];
  TextEditingController categoryNameController = TextEditingController();
  var globalKeyCategoryName = GlobalKey<FormState>();



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
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: categoryArray.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  child: ListTile(
                    title: Text("${categoryArray[index]}"),
                    trailing: Icon(Icons.delete),
                  ),
                ),
              );
            },
          )
        ]),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(16.0),
        child: FloatingActionButton(
          onPressed: () {
            addCategoryDialog(context: context, textEditingController: categoryNameController, formKey: globalKeyCategoryName);
            // navigateTo(context, AddExpenseOrIncomeScreen());
          },
          child: Icon(Icons.add,color: Colors.white,),),
      ),
    );
  }
}
