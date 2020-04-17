import 'package:flutter/material.dart';

class textForm extends StatelessWidget {
  final String placeholder;
  final Function validator;
  final Function onSubmit;
  final int lineNum;

  textForm(
  {
    this.placeholder,
    this.validator,
    this.onSubmit,
    this.lineNum
  }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0,10,0,30),
      child: TextFormField(
        maxLines: lineNum,
        decoration: InputDecoration(
          hintText: placeholder,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: validator,
        onSaved: onSubmit,
      ),
    );
  }
}
