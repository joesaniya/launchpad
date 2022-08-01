// @dart=2.9
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import './pages/home_page.dart';
import './pages/search_page.dart';
import './theme/constant.dart';

import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet App UI',
      theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme
          ),
          scaffoldBackgroundColor: appBackground),
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List <BottomNavigationBarItem>items = [
    BottomNavigationBarItem(icon: Icon(LineIcons.home,size: 27,),label: 'home'
    ),
    BottomNavigationBarItem(icon: Icon(LineIcons.search,size: 27,),
    label: 'search'
    // title:Padding(
    //   padding: const EdgeInsets.only(top: 8),
    //   child: Text("Search",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
    // )
    ),
    BottomNavigationBarItem(icon: Icon(LineIcons.bell,size: 27),
    label: 'notifications'
    ),
    BottomNavigationBarItem(icon: Icon(Icons.alarm,size: 27),
    label: 'Alerts'
    )
  ];
  int selectedIndex = 0;
  List <Widget> pages = [
    Homepage(),
    // SearchPage(),
    Center(child: Text("Search",style: TextStyle(fontSize: 40),),),
    Center(child: Text("Notifications",style: TextStyle(fontSize: 40),),),
    Center(child: Text("Profile",style: TextStyle(fontSize: 40),),)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0.0,
      toolbarHeight: 90, // Set this height
      flexibleSpace: Container(
        color: Colors.transparent,
        child: AppBar(
          elevation: 0.0,
  toolbarHeight: 90, // Set this height
  flexibleSpace: Container(
    // color: Colors.cyan.shade200,
    color: primary,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 25,),
        Row
        (
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: 
          [
            SizedBox(width: 50,),
             CircleAvatar(
                backgroundImage: NetworkImage('https://www.woolha.com/media/2020/03/eevee.png'),
                radius: 30,
              ),
              Spacer(),
              Spacer(),
              Spacer(),
              // Expanded(child: Text('data'))
              Icon(Icons.notifications,size: 30,color: Colors.white,),
              SizedBox(width: 9,),
              Icon(Icons.alarm,size: 30,color: Colors.white,),
               Padding(
                 padding: const EdgeInsets.only(right:30.0,left: 10),
                 child: Container(
    height: 50.0,
    width: 110,
    child: GestureDetector(
        onTap: () {},
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.indigo,
                    style: BorderStyle.solid,
                    width: 1.0,
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Center(
                        child: Text(
                           "Connect Wallet",
                            style: TextStyle(
                              color: Colors.indigo,
                                // color: Color(0xFFF05A22),
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                            ),
                        ),
                    )
                ],
            ),
        ),
    ),
),
               ),
               
            // Text('data')
          ],
        )
      ],
    ),
  ),
)
      ),
    ),
      body: getBody(),
      bottomNavigationBar: SizedBox(
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
                child: BottomNavigationBar(
                        
                        items: items,
                        onTap: (index){
                          setState(() {
                selectedIndex = index;
                          });
                        },
                        selectedItemColor: primary,
                        unselectedItemColor: Colors.indigo,
                        showUnselectedLabels: true,
                        currentIndex: selectedIndex,
                        type: BottomNavigationBarType.shifting,
                      ),
              ),
      ),
    );
  }

  Widget getBody() {
    return pages.elementAt(selectedIndex);
  }
}




