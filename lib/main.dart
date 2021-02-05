import 'package:flutter/material.dart';
import 'package:expandable_card/expandable_card.dart';

import 'default.dart';

void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ExpandableCardPage(
          page: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Home',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  //TODO Section 1
                  Container(
                    child: Image.asset('assets/images/context.png'),
                  ),
                  //TODO Section2
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'What\'s to buy?',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w800),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  StockList(
                    logo: ['logo1.png', 'logo2.png', 'logo3.png'],
                    title: ['AAPL', 'MCD', 'FB'],
                    price: ['364.11', '183.52', '233.43'],
                    color: [kBlackColor, kRedColor, kBlueColor],
                  ),
                ],
              ),
            ),
          ),
          expandableCard: ExpandableCard(
            backgroundColor: Color(0xFF232C41),
            hasRoundedCorners: true,
            minHeight: 370,
            maxHeight: 600,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Todays\'s Opinion,',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFFFE5762),
                          fontWeight: FontWeight.w700),
                    ),
                    OpinionList(
                      title: [
                        'Most Valuable Stocks 2020',
                        'How To Pick for a Blue Chip',
                        'Welcome to NEw NASDAQ',
                        'Just Watch and learn',
                        'Every ants don\'t know Who they are'
                      ],
                      description: [
                        'This is how you set your foot for 2020 Stock market recession.',
                        'This is how you set your foot for 2020 Stock market recession.',
                        'This is how you set your foot for 2020 Stock market recession.',
                        'This is how you set your foot for 2020 Stock market recession.',
                        'This is how you set your foot for 2020 Stock market recession.',
                      ],
                      image: [
                        'avatar0.png',
                        'avatar1.png',
                        'avatar2.png',
                        'avatar3.png',
                        'avatar4.png',
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OpinionList extends StatelessWidget {
  const OpinionList({
    Key key,
    this.title,
    this.description,
    this.image,
  }) : super(key: key);
  final List<String> title;
  final List<String> description;
  final List<String> image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 560,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 20),
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.grey.withOpacity(0.2),
            height: 1,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title[index],
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 60,
                        child: Text(
                          description[index],
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/${image[index]}'),
                    radius: 10,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class StockList extends StatelessWidget {
  const StockList({
    Key key,
    @required this.logo,
    this.title,
    this.price,
    this.color,
  }) : super(key: key);
  final List<Color> color;
  final List<String> logo;
  final List<String> title;
  final List<String> price;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 170,
      child: ListView.builder(
        primary: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 26),
            padding: EdgeInsets.all(18),
            width: 134,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              color: color[index],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/${logo[index]}',
                  width: 32,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title[index],
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '\$ ${price[index]}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
