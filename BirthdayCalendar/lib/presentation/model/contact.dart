/// Contact class. Used as an item in contacts tab and as part of birthday note item
class Contact {
  /// Contact name
  final String name;

  /// Contact phone number
  final String phone;

  /// If contact was selected in contacts tab
  bool isSelected = false;

  /// Class constructor
  Contact(this.name, this.phone);
}
