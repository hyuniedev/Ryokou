import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ryokou_service/controller/account_controller.dart';
import 'package:ryokou_service/entity/schedule.dart';

class Tour {
  late String _id;
  late String _name;
  late String _city;
  late int _durations;
  late DateTime _start;
  late int _maintainTime;
  late String _cost;
  late int _sale;
  late String _gatheringPlace;
  late bool _freeService;
  late String _pointo;
  late String _kisoku;
  List<Schedule> _schedule = [];
  List<File> _lsFile = [];

  Tour({
    required String id,
    required String name,
    required String city,
    required int durations,
    required DateTime start,
    required int maintainTime,
    required String cost,
    required int sale,
    required String gatheringPlace,
    required bool freeService,
    required String pointo,
    required String kisoku,
    required List<Schedule> schedule,
    required List<File> lsFile,
  })  : _id = id,
        _name = name,
        _city = city,
        _durations = durations,
        _start = start,
        _maintainTime = maintainTime,
        _cost = cost,
        _sale = sale,
        _gatheringPlace = gatheringPlace,
        _freeService = freeService,
        _pointo = pointo,
        _kisoku = kisoku,
        _schedule = schedule,
        _lsFile = lsFile;


  Tour.empty() {
    _id = '';
    _name = '';
    _city = '';
    _durations = 0;
    _start = DateTime.now();
    _maintainTime = 0;
    _cost = '';
    _sale = 0;
    _gatheringPlace = '';
    _freeService = false;
    _pointo = '';
    _kisoku = '';
    _schedule = [];
    _lsFile = [];
  }

  // Getters
  String get id => _id;
  String get name => _name;
  String get city => _city;
  int get durations => _durations;
  DateTime get start => _start;
  int get maintainTime => _maintainTime;
  String get cost => _cost;
  int get sale => _sale;
  String get gatheringPlace => _gatheringPlace;
  bool get freeService => _freeService;
  String get pointo => _pointo;
  String get kisoku => _kisoku;
  List<Schedule> get schedule => _schedule;
  List<File> get lsFile => _lsFile;

  // Setters
  set id(String value) {
    _id = value;
  }

  set name(String value) {
    _name = value;
  }

  set city(String value) {
    _city = value;
  }

  set durations(int value) {
    _durations = value;
  }

  set start(DateTime value) {
    _start = value;
  }

  set maintainTime(int value) {
    _maintainTime = value;
  }

  set cost(String value) {
    _cost = value;
  }
  
  set sale(int value) {
    _sale = value;
  }

  set gatheringPlace(String value) {
    _gatheringPlace = value;
  }

  set freeService(bool value) {
    _freeService = value;
  }

  set pointo(String value) {
    _pointo = value;
  }

  set kisoku(String value) {
    _kisoku = value;
  }

  set schedule(List<Schedule> value) {
    _schedule = value;
  }

  set lsFile(List<File> value){
    _lsFile = value;
  }

  void addSchedule(Schedule newSchedule) {
    _schedule.add(newSchedule);
  }

  void removeSchedule(Schedule oldSchedule) {
    _schedule.remove(oldSchedule);
  }

  Future<Map<String,dynamic>> toJson() async{
    List<String?> lsUrlImage = await Future.wait(_lsFile.map((i)=>uploadImage(i))) ;
    return{
      'name' : _name,
      'city' : _city,
      'durations' : _durations,
      'start' : Timestamp.fromDate(_start),
      'maintainTime' : _maintainTime,
      'cost' : cost,
      'sale' : _sale,
      'gatheringPlace' : _gatheringPlace,
      'freeService' : _freeService,
      'pointo' : _pointo,
      'kisoku' : _kisoku,
      'schedule' : _schedule.map((sche)=>sche.toJson()).toList(),
      'lsFile' : lsUrlImage,
      'company' : AccountController().getCompany?.id
    };
  }
  Future<String?> uploadImage(File image) async{
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('images/${DateTime.now().microsecondsSinceEpoch}.jpg');

      UploadTask upload = ref.putFile(image);
      TaskSnapshot taskSnapshot = await upload;

      String urlDownload = await taskSnapshot.ref.getDownloadURL();
      return urlDownload;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
  
}
