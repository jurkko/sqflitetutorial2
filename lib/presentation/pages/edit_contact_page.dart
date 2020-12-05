import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_tutorial/data/contact_operations.dart';
import 'package:sqflite_tutorial/models/contact.dart';

class EditContactPage extends StatefulWidget {
  Contact contact;

  EditContactPage({Key key, this.contact})
      : super(
          key: key,
        );

  @override
  _EditContactPageState createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  ContactOperations contactOperations = ContactOperations();

  var _nameController = TextEditingController();
  var _surnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = widget.contact.name;
    _surnameController.text = widget.contact.surname;
    return Scaffold(
      appBar: AppBar(
        title: Text('SQFLite Tutorial'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/homePage');
          },
          child: Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _surnameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Surname'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          widget.contact.name= _nameController.text;
          widget.contact.surname= _surnameController.text;

          contactOperations.updateContact(widget.contact);
        },
      ),
    );
  }
}
