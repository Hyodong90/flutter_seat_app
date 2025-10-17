import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatBottom extends StatelessWidget {
  SeatBottom(this.selectedRow, this.selectedCol);

  int? selectedCol;
  int? selectedRow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Text(
            selectedRow == null && selectedCol == null
                ? "선택된 좌석 없음"
                : "$selectedRow - $selectedCol",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 200,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                selectedRow == null && selectedCol == null
                    ? (showCupertinoDialog)(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text("좌석이 선택되지 않았습니다요?"),
                            actions: [
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("확인"),
                              ),
                            ],
                          );
                        },
                      )
                    : (showCupertinoDialog)(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text("예약확인"),
                            content: Text("효동이랑 영화보시렵니까?"),
                            actions: [
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("싫어ㅠㅠ"),
                              ),
                              CupertinoDialogAction(
                                isDestructiveAction: true,
                                onPressed: () {},
                                child: Text("좋아!"),
                              ),
                            ],
                          );
                        },
                      );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              child: Text(
                "영화표 예매하기",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
