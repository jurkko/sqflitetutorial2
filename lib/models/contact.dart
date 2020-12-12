class Contact {
  int id;
  String name;
  String surname;
  int category;

  Contact({this.id, this.name, this.surname, this.category});

  Contact.fromMap(dynamic obj) {
    this.id = obj['contactId'];
    this.name = obj['contactName'];
    this.surname = obj['contactSurname'];
    this.category = obj['FK_contact_category'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'contactName': name,
      'contactSurname': surname,
      'FK_contact_category':category,
    };

    return map;
  }
}
