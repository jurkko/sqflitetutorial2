class Contact {
  int id;
  String name;
  String surname;

  Contact({this.id, this.name, this.surname});

  Contact.fromMap(dynamic obj) {
    this.id = obj['contactId'];
    this.name = obj['contactName'];
    this.surname = obj['contactSurname'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'contactName': name,
      'contactSurname': surname,
    };

    return map;
  }
}
