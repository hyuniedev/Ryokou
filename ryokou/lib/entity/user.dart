class User {
  late String id;
  late String userName;
  late String password;
  late String fullName;
  late String numberphone;
  late String email;
  User({
    required this.userName,
    required this.password,
    required this.fullName,
    required this.email,
    required this.numberphone,
  }) {
    id = DateTime.now().millisecond.toString();
  }
}
