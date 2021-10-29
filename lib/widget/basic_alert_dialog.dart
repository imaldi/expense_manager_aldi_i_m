import 'package:flutter/material.dart';

Future basicAlertDialogFunction(
{
    required BuildContext context,
    required AlertDialog alertDialog}
    ) async {
  return await showDialog(
      context: context,
      builder: (context) => alertDialog,);}