import 'package:flutter/material.dart';
import 'package:ryokou_service/enum/iSugget.dart';

class ItemDay extends StatefulWidget {
  final int counter;
  final Function(String) onDaySelected;

  const ItemDay({super.key, required this.counter, required this.onDaySelected});

  @override
  State<ItemDay> createState() => _ItemDayState();
}

class _ItemDayState extends State<ItemDay> {
  ISugget? _selectedDay;

  @override
  void initState() {
    super.initState();
    if (widget.counter > 0) {
      _selectedDay = ISugget('Ngày 1');
      widget.onDaySelected(_selectedDay!.text); // Chọn mặc định ngày đầu tiên
    }
  }

  void _onTagChanged(ISugget selectedTag) {
    setState(() {
      _selectedDay = selectedTag;
      widget.onDaySelected(_selectedDay!.text); // Gọi callback để cập nhật ngày được chọn
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ISugget> days = List.generate(
      widget.counter,
      (index) => ISugget('Ngày ${index + 1}'), // Tạo danh sách ngày
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: days.map((day) {
          return ItemTag(
            titleTag: day,
            isSelected: _selectedDay == day,
            changedTag: _onTagChanged,
          );
        }).toList(),
      ),
    );
  }
}

class ItemTag extends StatelessWidget {
  final ISugget titleTag;
  final bool isSelected;
  final Function(ISugget) changedTag;

  const ItemTag({
    super.key,
    required this.titleTag,
    required this.isSelected,
    required this.changedTag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 10, bottom: 15),
      child: InkWell(
        borderRadius: BorderRadius.circular(75),
        onTap: () => changedTag(titleTag),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          decoration: BoxDecoration(
            color: isSelected ? Colors.teal : Colors.white,
            border: Border.all(color: Colors.teal, width: 1.5),
            borderRadius: BorderRadius.circular(75),
          ),
          child: Text(
            titleTag.text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
