import 'package:flutter/material.dart';
import 'package:ryokou_service/enum/iSugget.dart';

class ItemDay extends StatefulWidget {
  final int counter;

  const ItemDay({super.key, required this.counter});

  @override
  State<ItemDay> createState() => _ItemDayState();
}

class _ItemDayState extends State<ItemDay> {
  ISugget? _selectedDay;

  @override
  void initState() {
    super.initState();
    if (widget.counter > 0) {
      _selectedDay = ISugget('Ngày 1'); // Chọn ngày đầu tiên mặc định
    }
  }

  void _onTagChanged(ISugget selectedTag) {
    setState(() {
      _selectedDay = selectedTag;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Tạo danh sách ngày dựa trên giá trị counter
    List<ISugget> days = List.generate(
      widget.counter,
      (index) => ISugget('Ngày ${index + 1}'), // Sử dụng index để tạo danh sách
    );

    return Column(
      children: [
        SingleChildScrollView(
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
        ),
        const SizedBox(height: 20),
        if (_selectedDay != null)
          Text(
            'Nội dung cho ${_selectedDay!.text}',
            style: const TextStyle(fontSize: 18),
          ),
      ],
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
