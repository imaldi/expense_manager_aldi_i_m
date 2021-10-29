import 'package:flutter/material.dart';

_defaultOnEditingComplete() {}
// _defaultOnChanged(String){}

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key,
        this.enabled = true,
        required this.controller,
        this.style,
        this.decoration,
        this.onEditingComplete = _defaultOnEditingComplete,
        this.onChanged,
        this.inputType,
        this.validator,
        this.formKey
        // = _defaultOnChanged
      })
      : super(key: key);
  bool enabled;
  TextEditingController controller;
  void Function()? onEditingComplete;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  TextStyle? style;
  InputDecoration? decoration;
  TextInputType? inputType;
  Key? formKey;

  // // static _defaultOnEditingComplete(controller){}
  // static
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: widget.style,
        enabled: widget.enabled,
        controller: widget.controller,
        decoration: widget.decoration
        ,
        keyboardType: widget.inputType,
        validator: widget.validator,
        onEditingComplete: () {
          // setState(() {
          if (widget.onEditingComplete != null) {
            widget.onEditingComplete!();
          }
          FocusScope.of(context).unfocus();
          // widget.onEditingComplete!(widget.controller);
          // });
        },
        onChanged: widget.onChanged == null
            ? null
            : (currentText) {
          widget.onChanged!(currentText);
          // FocusScope.of(context).unfocus(); // cek nanti kalo kenapa napa
        },
      ),
    );
  }
}