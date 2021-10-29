import 'package:expense_manager_aldi_i_m/const/const.dart';
import 'package:expense_manager_aldi_i_m/data/app_database.dart';
import 'package:expense_manager_aldi_i_m/helper/navigator_helper.dart';
import 'package:expense_manager_aldi_i_m/widget/add_category_dialog.dart';
import 'package:expense_manager_aldi_i_m/widget/basic_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moor_flutter/moor_flutter.dart' as moor;
import 'package:provider/provider.dart';

class SelectCategoryScreen extends StatefulWidget {
  const SelectCategoryScreen({Key? key, required this.onChosen}) : super(key: key);

  final Function(String) onChosen;

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
        title: Text("Select Category"),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          _buildCategoryList(context)
        ]),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(16.0),
        child: FloatingActionButton(
          onPressed: () {
            addCategoryDialog(
                context: context,
                textEditingController: categoryNameController,
                formKey: globalKeyCategoryName,
                onSubmitted: (val){
                  final dao = Provider.of<CategoryDao>(context, listen: false);
                  final category = CategorysCompanion(
                    name: moor.Value(val),
                    // dueDate: Value(newTaskDate),
                  );
                  dao.insertCategory(category);
                }
            );
            // navigateTo(context, AddExpenseOrIncomeScreen());
          },
          child: Icon(Icons.add,color: Colors.white,),),
      ),
    );
  }

  _buildCategoryList(BuildContext context){
    final dao = Provider.of<CategoryDao>(context, listen: false);

    return StreamBuilder(
        stream: dao.watchAllCategorys(),
        builder:(context, AsyncSnapshot<List<Category>> snapshot) {
          final item = snapshot.data ?? [];

          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: item.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  child: ListTile(
                    onTap: (){
                      widget.onChosen(item[index].name);
                      navigatorPop(context);
                    },
                    title: Text("${item[index].name}"),
                    trailing: InkWell(
                        onTap:(){
                          basicAlertDialogFunction(context: context, alertDialog: AlertDialog(
                            title: Text("Warning"),
                            content: Text("Are you sure want to delete this item?"),actions: [

                            Container(
                              margin: EdgeInsets.all(size_normal),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Container(
                                      height: 45,
                                      width: widthScreen(context),
                                      child: ElevatedButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          navigatorPop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(size_normal)),
                                          primary: primaryColor,
                                          side: BorderSide(color: primaryColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size_medium),
                                  Flexible(
                                    child: Container(
                                      height: 45,
                                      width: widthScreen(context),
                                      child: ElevatedButton(
                                        child: Text("Yes"),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(size_normal)),
                                          primary: primaryColor,
                                          side: BorderSide(color: primaryColor),
                                        ),
                                        onPressed: () {
                                          dao.deleteCategory(item[index]);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],));

                        },
                        child: Icon(Icons.delete)),
                  ),
                ),
              );
            },
          );
        }
    );
  }

}
