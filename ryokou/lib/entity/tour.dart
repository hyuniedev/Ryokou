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

  List<String> diemNoiBat = [
    'Thời điểm hoa nở rộ: Thời điểm lý tưởng nhất để ngắm hoa anh đào (sakura) ở Tokyo là từ cuối tháng 3 đến đầu tháng 4. Vào thời gian này, hoa nở rộ, tạo nên cảnh quan tuyệt đẹp, thu hút rất nhiều du khách.',
    'Hoạt động Hanami: Hanami, hay còn gọi là "ngắm hoa", là hoạt động phổ biến khi mọi người tụ tập dưới các tán cây anh đào, cùng nhau thưởng thức đồ ăn, uống và tận hưởng cảnh sắc hoa nở. Đây là một phong tục lâu đời, mang lại cảm giác thư giãn và hòa mình vào thiên nhiên.',
    'Khung cảnh ban đêm: Một số công viên như - Chidorigafuchi và Rikugien tổ chức sự kiện thắp sáng hoa anh đào vào ban đêm. Ánh '
  ];
}
