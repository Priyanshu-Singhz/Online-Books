import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final int selected;
  final Function callback;
  final tabs = ["eBook", "AudioBook"];
  CustomTab(this.selected, this.callback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(5)),
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 5),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  callback(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selected == index ? Colors.white : Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  alignment: Alignment.center,
                  width: (width - 40) / 2 - 10,
                  child: Text(
                    tabs[index],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
          separatorBuilder: (_, index) => const SizedBox(
                width: 10,
              ),
          itemCount: tabs.length),
      width: width,
      height: 50,
    );
  }
}
