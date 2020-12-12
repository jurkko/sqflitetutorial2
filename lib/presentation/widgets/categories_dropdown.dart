import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_tutorial/models/category.dart';

class CategoriesDropDown extends StatefulWidget {
  List<Category> categories;

  Function(Category) callback;

  CategoriesDropDown(
      this.categories,
      this.callback, {
        Key key,
      }) : super(key: key);

  @override
  _CategoriesDropDownState createState() => _CategoriesDropDownState();
}

class _CategoriesDropDownState extends State<CategoriesDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Category>(
      hint: Text('Select category'),
      onChanged: (Category value){
        setState(() {
          widget.callback(value);
        });
      },
      items: widget.categories.map((category) {
        return DropdownMenuItem(
          value: category,
          child: Text(category.name),
        );
      }).toList()
    );
  }
}
