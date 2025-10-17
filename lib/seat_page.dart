import 'package:flutter/material.dart';
import 'package:flutter_seat_app/seat_bottom.dart';
import 'package:flutter_seat_app/seat_select_box.dart';

class SeatPage extends StatefulWidget {
  final String movieTitle; // 영화 제목을 받을 변수 추가

  const SeatPage({Key? key, required this.movieTitle}) : super(key: key);

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectdedRow;
  int? selectedCol;

  void onSelected(int row, int col) {
    setState(() {
      selectdedRow == row && selectedCol == col
          ? (selectdedRow = null, selectedCol = null)
          : (selectdedRow = row, selectedCol = col);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //앱바에 위젯무비타이틀로 무비포스터에 타이틀 가져오기.
      appBar: AppBar(
        title: Text(
          '${widget.movieTitle}   좌석선택',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          SeatSelectBox(selectdedRow, selectedCol, onSelected),
          SeatBottom(selectdedRow, selectedCol),
        ],
      ),
    );
  }
}
