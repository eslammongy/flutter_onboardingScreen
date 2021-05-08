import 'package:flutter/material.dart';

class IndicatorCircle extends StatelessWidget {
  final int index;
  IndicatorCircle(this.index);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
          ),
          buildContainer(index == 0 ? Colors.deepOrange : Colors.deepPurple),
          buildContainer(index == 1 ? Colors.deepOrange : Colors.deepPurple),
          buildContainer(index == 2 ? Colors.deepOrange : Colors.deepPurple),
          buildContainer(index == 3 ? Colors.deepOrange : Colors.deepPurple)
        ],
      ),
    );
  }

  Widget buildContainer(Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.all(5),
        height: 10,
        width: 10,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
