import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_tutorial/data/category_operations.dart';
import 'package:sqflite_tutorial/models/category.dart';


class AddCategoryPage extends StatefulWidget {
  AddCategoryPage({Key key}) : super(key: key);

  @override
  _AddCategoryPageState createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final _categoryController = TextEditingController();

  CategoryOperations categoryOperations = CategoryOperations();

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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _categoryController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Category name'),
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final category = Category(
              name: _categoryController.text);
          categoryOperations.createCategory(category);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
