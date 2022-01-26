import 'package:flutter/material.dart';
import 'package:flutter_bottomnavi_pageviewer/page_1.dart';
import 'package:flutter_bottomnavi_pageviewer/page_2.dart';
import 'package:flutter_bottomnavi_pageviewer/page_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Home_page() );
  }
}

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {

  int _seletedItem = 0;
  var _pages = [Page_1(),Page_2(),Page_3()];
  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  PageView(
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _seletedItem = index;
          });
        },
        controller: _pageController,
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        currentIndex: _seletedItem,
        onTap: (index) {
          setState(() {
            _seletedItem = index;
            _pageController.animateToPage(_seletedItem,
                duration: Duration(milliseconds: 400), curve: Curves.linear);
          });
        },


        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _seletedItem == 0 ?
              Icon(Icons.home_outlined):  Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
          icon: _seletedItem == 1 ?
              
          Icon(Icons.person_add_alt) : Icon(Icons.contact_phone,),
            label: 'Add Person'
          ),
          BottomNavigationBarItem(
              icon:_seletedItem == 2 ? Icon(Icons.account_circle_outlined):Icon(Icons.account_circle), label: 'Profile')
        ],
      ),




    );
  }
}
