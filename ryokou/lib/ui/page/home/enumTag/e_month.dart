import 'package:ryokou/ui/page/home/enumTag/ISugget.dart';

enum EMonth implements ISugget {
  Thang1('Thang 1'),
  Thang2('Thang 2'),
  Thang3('Thang 3'),
  Thang4('Thang 4'),
  Thang5('Thang 5'),
  Thang6('Thang 6'),
  Thang7('Thang 7'),
  Thang8('Thang 8'),
  Thang9('Thang 9'),
  Thang10('Thang 10'),
  Thang11('Thang 11'),
  Thang12('Thang 12');

  final String s;
  const EMonth(this.s);

  @override
  String get text => s;
}
