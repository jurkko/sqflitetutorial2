import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_tutorial/data/category_operations.dart';
import 'package:sqflite_tutorial/data/contact_operations.dart';
import 'package:sqflite_tutorial/models/contact.dart';
import 'package:sqflite_tutorial/models/category.dart';
import 'package:sqflite_tutorial/presentation/widgets/categories_dropdown.dart';
import 'package:sqflite_tutorial/presentation/widgets/contact_list.dart';


class SearchContactsByCategory extends StatefulWidget {
  SearchContactsByCategory({Key key}) : super(key: key);

  @override
  _SearchContactsByCategoryState createState() => _SearchContactsByCategoryState();
}

class _SearchContactsByCategoryState extends State<SearchContactsByCategory> {

  ContactOperations contactOperations = ContactOperations();
  CategoryOperations categoryOperations = CategoryOperations();
  Category _selectedCategory;

  callback(selectedCategory){
    setState(() {
      _selectedCategory = selectedCategory;
      print(_selectedCategory.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQFLite Tutorial'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/homePage');
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<Category>>(
              future: categoryOperations.getAllCategories(),
              builder: (context, snapshot) {
                return snapshot.hasData ? CategoriesDropDown(snapshot.data, callback) : Text('No categories');
              },
            ),
            FutureBuilder(
              future: contactOperations.getAllContactsByCategory(_selectedCategory),
              builder: (context, snapshot){
                if(snapshot.hasError) print('error');
                var data = snapshot.data;
                return snapshot.hasData ? ContactsList(data) : new Center(child: Text('You have no contacts'),);
              },
            ),
          ],
        ),
      ),

    );
  }
}
