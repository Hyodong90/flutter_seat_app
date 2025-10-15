import 'package:flutter/material.dart';

class SeatSelectBox extends StatelessWidget {
  SeatSelectBox(this.selectedCol, this.selectedRow, this.onSelected);

  int? selectedCol;
  int? selectedRow;

  void Function(int row, int col) onSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Screen",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          row(1),
          SizedBox(height: 8),
          row(2),
          SizedBox(height: 8),
          row(3),
          SizedBox(height: 8),
          row(4),
          SizedBox(height: 8),
          row(5),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              label("Available", Colors.grey),
              SizedBox(width: 4),
              label("Selected", Colors.amber),
            ],
          ),
        ],
      ),
    );
  }

  Row label(String text, Color color) {
    return Row(
      children: [
        Text(text),
        SizedBox(width: 4),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }

  Widget row(int rowNum) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "$rowNum",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          seat(rowNum, 1),
          seat(rowNum, 2),
          seat(rowNum, 3),
          seat(rowNum, 4),
          seat(rowNum, 5),
          seat(rowNum, 6),
          seat(rowNum, 7),
          seat(rowNum, 8),
          seat(rowNum, 9),
          seat(rowNum, 10),
        ],
      ),
    );
  }

  Widget seat(int rowNum, int colNum) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: GestureDetector(
          onTap: () {
            onSelected(rowNum, colNum);
          },
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: rowNum == selectedRow && colNum == selectedCol
                    ? Colors.amber
                    : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
