class Customer {
  late String _ten;
  late String _sdt;
  late String _email;

  Customer({required String ten, required String sdt, required String email}) {
    _ten = ten;
    _sdt = sdt;
    _email = email;
  }

  String get ten => _ten;
  String get sdt => _sdt;
  String get email => _email;

  set ten(String value) {
    _ten = value;
  }

  set sdt(String value) {
    _sdt = value;
  }

  set email(String value) {
    _email = value;
  }
  factory Customer.fromJson(Map<String, dynamic> json){
    return Customer(ten: json['name'], sdt: json['numberphone'], email: json['email']);
  }
}
