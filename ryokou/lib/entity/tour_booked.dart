import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/tour.dart';

class TourBooked extends Tour {
  late int numPerson;
  late String idTour;
  late String startDay;
  TourBooked(
      {required this.idTour, required this.numPerson, required this.startDay})
      : super.empty() {
    Tour tour = DataController().findTour(idTour);
    super.id = idTour;
    super.name = tour.name;
    super.durations = tour
        .durations; // HyuNie: thêm durations trước start để vào set start có thể đặt lại end
    super.start = DateTime.parse(startDay);
    super.cost = tour.cost;
    super.sale = tour.sale;
    super.lsFile = tour.lsFile;
  }

  factory TourBooked.fromJson(Map<String, dynamic> json) {
    return TourBooked(
        idTour: json['idTour'],
        numPerson: json['numPerson'],
        startDay: json['startDay']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'idTour': idTour,
      'numPerson': numPerson,
      'startDay': startDay,
    };
  }
}
