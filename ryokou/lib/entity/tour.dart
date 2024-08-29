import 'package:ryokou/entity/rate.dart';

class Tour {
  late String id;
  late String titleTour;
  late String descriptionTour;
  late int duration;
  late String location;
  List<Rate> lsRate = [];
  Tour({
    required this.titleTour,
    required this.descriptionTour,
    required this.duration,
    required this.location,
  }) {
    id = DateTime.now().millisecond.toString();
  }
  void addRate(Rate newRate) {
    lsRate.add(newRate);
  }

  double getRateStar() {
    double sumStar = 0;
    for (var element in lsRate) {
      sumStar += element.star;
    }
    return lsRate.isNotEmpty ? sumStar / lsRate.length : 0;
  }
}
