import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/entity/tour_booked.dart';
import 'package:ryokou/themes/colors_theme.dart';

class BSScheduleTour extends StatefulWidget {
  const BSScheduleTour({super.key, required this.tour});
  final Tour tour;
  @override
  State<BSScheduleTour> createState() => _BSScheduleTourState();
}

class _BSScheduleTourState extends State<BSScheduleTour> {
  final List<String> _lsTitle = ['Chi tiết lịch trình', 'Thông tin vé'];
  int indexCurrentTitle = 0;
  int indexCurrentDay = 0;

  void changeTitle(int newIndex) {
    if (indexCurrentTitle != newIndex) {
      setState(() {
        indexCurrentTitle = newIndex;
      });
    }
  }

  void changeDay(int newIndex) {
    if (indexCurrentDay != newIndex) {
      setState(() {
        indexCurrentDay = newIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            children: List.generate(
              widget.tour is TourBooked ? 2 : 1,
              (index) {
                return Expanded(
                  flex: 1,
                  child: myButtomApp(
                      _lsTitle[index], index == indexCurrentTitle, changeTitle,
                      index: index),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: indexCurrentTitle == 0 ? ScheduleDetail() : TicketDetail(),
          ),
        ],
      ),
    );
  }

  Widget TicketDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Người đặt vé: ${DataController().getUser!.fullName}'),
        Text('Số lượng: ${((widget.tour) as TourBooked).numPerson} vé'),
        Text('Địa điểm tập hợp: ${widget.tour.gatheringPlace}'),
        Text('Ngày đi: ${DateFormat('dd/MM/yyyy').format(widget.tour.start)}'),
        Text('Ngày về: ${DateFormat('dd/MM/yyyy').format(widget.tour.end)}'),
        Text(
            'Tổng tiền: ${widget.tour.getPriceTour(soLuong: ((widget.tour) as TourBooked).numPerson)}')
      ],
    );
  }

  Widget ScheduleDetail() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.tour.schedule.length,
              itemBuilder: (context, index) {
                return myButtomApp(widget.tour.schedule[index].day,
                    indexCurrentDay == index, changeDay,
                    index: index);
              },
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                widget.tour.schedule[indexCurrentDay].todo.length,
                (index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${widget.tour.schedule[indexCurrentDay].todo[index].hour}:${widget.tour.schedule[indexCurrentDay].todo[index].minute}  '),
                      Expanded(
                        child: Text(
                          widget.tour.schedule[indexCurrentDay].todo[index]
                              .content,
                          maxLines: 100,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget myButtomApp(String title, bool isChoose, Function actionCallback,
      {required int index}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: InkWell(
        onTap: () => actionCallback(index),
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: isChoose ? Colors.grey : Colors.transparent),
          child: Center(child: Text(title)),
        ),
      ),
    );
  }
}
