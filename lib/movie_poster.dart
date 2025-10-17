import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seat_app/seat_page.dart';

class MoviePoster extends StatelessWidget {
  final List<Map<String, dynamic>> movies = [
    {'poster': 'assets/1.jpg', 'title': '자매의 맛', 'rating': 9.9},
    {'poster': 'assets/2.jpg', 'title': '보스', 'rating': 8.1},
    {'poster': 'assets/3.jpg', 'title': '어쩔수가없다', 'rating': 9.2},
    {'poster': 'assets/4.jpg', 'title': '자매 돌려먹기', 'rating': 1.2},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/5.jpg', width: 50, height: 50),

        actions: [
          Icon(CupertinoIcons.ticket, size: 30, color: Colors.red),
          SizedBox(width: 5),
          Icon(CupertinoIcons.bell, size: 30),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Stack(
            children: [
              Image.asset(
                'assets/1.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Text(
                  "박스오피스 1위 자매의 맛 ",
                  style: TextStyle(
                    color: Colors.redAccent.withOpacity(0.8),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 350, // 포스터 높이 - 높이 안주면 가로스크롤때 오류
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return GestureDetector(
                  onTap: () {
                    //  포스터 클릭 시 SeatPage로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SeatPage(movieTitle: movie['title']),
                      ),
                    );
                  },
                  child: Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //  포스터 이미지
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            movie['poster'],
                            width: 200,
                            height: 280,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),

                        //
                        Text(
                          movie['title'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),

                        //
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 4),
                            Text(
                              movie['rating'].toString(),
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Image.asset(
            'assets/6.jpg',
            width: double.infinity,
            height: 130,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
