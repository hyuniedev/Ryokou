import 'package:ryokou_service/entity/company.dart';

class AccountController {
  static final AccountController _instance = AccountController.singleton();
  AccountController.singleton();
  factory AccountController(){
    return _instance;
  }
  Company? _company;
  Company? get getCompany => _company;
  void set setCompany(Company? company) => _company = company;
}