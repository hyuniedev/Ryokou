import 'package:ryokou/controller/IDataRefresh.dart';

class MyPageController {
  static final MyPageController _instance = MyPageController._singleton();
  MyPageController._singleton();
  factory MyPageController() {
    return _instance;
  }
  IDataRefresh? _dataRefresh;
  set CurrentPage(IDataRefresh? value) => _dataRefresh = value;
  void RefreshPage() {
    _dataRefresh?.RefreshPage();
  }
}
