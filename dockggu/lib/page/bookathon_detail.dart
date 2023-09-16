import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home.dart';

void main() {
  runApp(BookathonDetail());
}

class BookathonDetail extends StatelessWidget {
  const BookathonDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Color(0xffFFFFFF),
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(0xff000000),
                size: 16.0,
              ),
              onPressed: () {
                Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Home()));
              },
            ),
            title: Align(
              alignment: Alignment(-1.2, 0),
              child: Text(
                '베이커가 221B번지', //DB에서 불러오기
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 20.0,
                ),
              ),
            ),
            backgroundColor: Color(0xffFFFFFF),
            elevation: 0.0,
          ),
          body: Column(
            children: [
              TabBar(
                  indicator: BoxDecoration(
                    color: Color(0xffFFD66C).withOpacity(0.57),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  indicatorPadding:
                      EdgeInsets.symmetric(horizontal: 56.0, vertical: 8.0),
                  labelColor: Color(0xff000000),
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  tabs: [
                    Tab(
                      text: '홈',
                      height: 50,
                    ),
                    Tab(
                      text: '게시판',
                      height: 50,
                    ),
                  ]),
              Expanded(
                  child: TabBarView(children: [
                Container(
                  width: 10,
                  color: Color(0xffFFFFFF),
                  child: Center(
                    child: Text(
                      'Box',
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 56,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListView.separated(
                  key: PageStorageKey('PageStorage'),
                  itemCount: 3,
                  itemBuilder: (BuildContext ctx, int idx) {
                    if (idx == 0) return HeaderTile();
                    double percent = 0.4;
                    return Column(
                      children: [
                        Container(
                          height: 150,
                          child: Row(
                            children: [
                              Container(
                                child: Image.asset('assets/book.png'),
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                child: Column(
                                  children: [
                                    Container(
                                      child: FractionallySizedBox(
                                        child: Column(
                                          children: [
                                            Text(
                                              '명탐정 코난',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xff000000),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Image.asset(
                                                'assets/profile_image.png',
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.cover),
                                          ],
                                        ),
                                      ),
                                      alignment:
                                          FractionalOffset(percent, 1 - percent),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: LinearPercentIndicator(
                                        padding: EdgeInsets.zero,
                                        percent: percent,
                                        lineHeight: 10,
                                        backgroundColor: Color(0xffBBBBBB),
                                        progressColor: Color(0xffFFC100),
                                        barRadius: Radius.circular(5),
                                      ),
                                    ),
                                  ],
                                ),
                                width: MediaQuery.of(context).size.width * 0.55,
                              ),
                              Container(
                                height: 150,
                                padding: EdgeInsets.fromLTRB(0, 98, 10, 0),
                                child: Text(
                                  '90%',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 0, 5),
                          child: Container(
                            alignment: FractionalOffset(0, 0),
                            child: Text('눈에 갇힌 외딴 산장에서',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff000000),
                            ),
                            ),
                            ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext ctx, int idx) {
                    if (idx == 0) return Divider(color: Colors.transparent);
                    return Divider(
                      color: Color(0xffFFD66C),
                      indent: 20,
                      endIndent: 20,
                    );
                  },
                )
              ]))
            ],
          )),
    );
  }
}

class HeaderTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
      child: Container(
        child: Text(
          '다함께 완독해요! 📖',
          style: TextStyle(
            fontSize: 24,
            color: Color(0xff000000),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
