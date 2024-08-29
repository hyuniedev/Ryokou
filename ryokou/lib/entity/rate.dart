import 'package:ryokou/entity/user.dart';

class Rate {
  late String id;
  late User user;
  late int star;
  late String comment;
  Rate({
    required this.user,
    required this.star,
    required this.comment,
  }) {
    id = DateTime.now().millisecond.toString();
  }
}
