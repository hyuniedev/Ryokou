import 'package:ryokou_service/enum/iSugget.dart';

enum Eday implements ISugget {
  Ngay1('Ngày 1'),
  Ngay2('Ngày 2'),
  Ngay3('Ngày 3'),
  Ngay4('Ngày 4'),
  Ngay5('Ngày 5'),
  Ngay6('Ngày 6'),
  Ngay7('Ngày 7'),
  Ngay8('Ngày 8'),
  Ngay9('Ngày 9'),
  Ngay10('Ngày 10'),
  Ngay11('Ngày 11'),
  Ngay12('Ngày 12'),
  Ngay13('Ngày 13'),
  Ngay14('Ngày 14'),
  Ngay15('Ngày 15'),
  Ngay16('Ngày 16'),
  Ngay17('Ngày 17'),
  Ngay18('Ngày 18'),
  Ngay19('Ngày 19'),
  Ngay20('Ngày 20'),
  Ngay21('Ngày 21'),
  Ngay22('Ngày 22'),
  Ngay23('Ngày 23'),
  Ngay24('Ngày 24'),
  Ngay25('Ngày 25'),
  Ngay26('Ngày 26'),
  Ngay27('Ngày 27'),
  Ngay28('Ngày 28'),
  Ngay29('Ngày 29'),
  Ngay30('Ngày 30'),
  Ngay31('Ngày 31');

  final String s;
  const Eday(this.s);

  @override
  String get text => s;
}
