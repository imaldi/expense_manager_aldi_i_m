import 'package:expense_manager_aldi_i_m/const/const.dart';
import 'package:expense_manager_aldi_i_m/helper/navigator_helper.dart';
import 'package:flutter/material.dart';

import 'basic_alert_dialog.dart';
import 'custom_text_field.dart';

addCategoryDialog({
    required BuildContext context, required TextEditingController textEditingController, required GlobalKey<FormState> formKey}) {
  basicAlertDialogFunction(context: context, alertDialog: AlertDialog(
    title: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Create Category")
      ],
    ),
    content: Container(
      padding: EdgeInsets.all(size_medium),
      child: CustomTextField(
        key: formKey,
        controller: textEditingController,
        decoration: InputDecoration(labelText: "Category name", labelStyle: TextStyle(color: Colors.grey)),
        validator: (val){
          if((val ?? "").isEmpty){
            return "Category name cannot be blank";
          } else {
            return null;
          }
        },
      ),
    ),
    actions: [
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
                  child: Text("Cancel"),
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
                  child: Text("Save"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(size_normal)),
                    primary: primaryColor,
                    side: BorderSide(color: primaryColor),
                  ),
                  onPressed: () {
                    //do something later
                    Navigator.of(context).pop();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ],
  ));
}