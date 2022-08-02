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
      title: 'Hami App',
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
  List <BottomNavigationBarItem>items = const [
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

  Widget StylishDrawer()
  {
    return ClipPath
    (
      clipper: DrwaerStyle(),
      child: Container
      (
        width: 300,
        height: 600,
        child: Stack
        (
          children: 
          [
            BackdropFilter
            (
              filter: ImageFilter.blur
              (
                sigmaX: 5.0,
                sigmaY: 5.0
              ),
              child: Container
              (
                decoration:BoxDecoration
                (
                  color: primary.withOpacity(0.5)
                )
              ),
            ),
            Container
            (
              child: ListView
              (
                children: 
                [
                  Column
                  (
                    children: 
                    const [
                      Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox
                    (
                      width: 100,
                      height: 100,
                      child: CircleAvatar
                      (
                        backgroundImage: NetworkImage('https://www.woolha.com/media/2020/03/eevee.png'),
                      ),
                    ),
                  ),
                  Text('Hami',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)
                    ],
                  ),
                  SizedBox
                  (
                    height: 20,
                  ),
                  Divider(height: 0.5,color: Colors.white,),
                  ListTile
                  (
                    leading: Icon(Icons.home,color: Colors.white,),
                    title: Text('Home',style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox
                  (
                    height: 20,
                  ),
                  Divider(height: 0.5,color: Colors.white,),
                  ExpansionTile
                  (
                    leading: Icon(Icons.grid_3x3,color: Colors.white,),
                    title: Text('LaunchPad',style: TextStyle(color: Colors.white),),
                    children: 
                    [
                      ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Home',style: TextStyle(color: Colors.white),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MyDrawer(),
      drawer: Drawer
      (
        child: BackdropFilter
        (
          filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: MyDrawer(),
        ),
      ),
      // drawer: StylishDrawer(),
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

              // Icon(Icons.notifications,size: 30,color: Colors.white,),

              // SizedBox(width: 9,),
              // Icon(Icons.alarm,size: 30,color: Colors.white,),
               Padding(
                 padding: const EdgeInsets.only(right:10.0,left: 10),
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

               Padding(
                 padding: const EdgeInsets.only(right:10.0),
                 child: CircleAvatar(
                  backgroundImage: NetworkImage('https://app.hami.live/static/media/logo.fa40f84cc28cef735cc2.png'),
                  // backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmg6VbQr7k4bE8m1sGjODK19nEZn-UKVChBg&usqp=CAU',),
                  radius: 30,
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

class DrwaerStyle extends CustomClipper<Path>
{

  @override
  Path getClip(Size size)
  {

    Path path=new Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/4, size.height, size.width/2, size.height-40);
    path.quadraticBezierTo(size.width-50, size.height-80, size.width, size.height);
    path.quadraticBezierTo(size.width-100, size.height/2, size.width,0.0);
    path.quadraticBezierTo(size.width/2, 30.0, 0.0,0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper)
  {
    return null;
  }
}

//normal drawer
class MyDrawer extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<MyDrawer> {
  int myIndex;
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  //The Logic where you change the pages
  _onChangePage(int index){
    if(index != 0) setState(() => myIndex = index); //change myIndex if you're Selecting between Settings and Explore
    _controller.animateToPage(index.clamp(0, 1),
      duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primary,
        child: PageView.builder(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(), //so the user can not move between pages
          itemCount: 2,
          itemBuilder: (context, index) {
            // Original Drawer
            if (index == 0) return MyWidget(
                explore: () => _onChangePage(1),
                settings: () => _onChangePage(2),
              );
            //Second Drawer form the PageView
              switch(myIndex){
                case 1:
                  return MyExploreAll(goBack: () => _onChangePage(0));
                case 2:
                default:
                  return MySettings(goBack: () => _onChangePage(0));
              }
          },
        )
      );
  }
}

//The Menu Drawer (Your first image)
class MyWidget extends StatelessWidget {
  final VoidCallback explore;
  final VoidCallback settings;

  MyWidget({this.explore, this.settings});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([

              SizedBox
              (
                height: 50,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundImage: NetworkImage('https://www.woolha.com/media/2020/03/eevee.png'),
                        radius: 50,
                      ),
                      SizedBox(width: 10,),
                      Text('HAMI LAUNCHPAD',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w900),)
                  ],
                ),
              ),
              SizedBox
              (
                height: 20,
              ),
              //1
              ExpansionTile
                  (
                    leading: Icon(Icons.token,color: Colors.white,),
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    title: Text('LaunchPad',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                    children: 
                    [
                      ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Tokens List',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Create Token',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Add Token',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        
                    ],
                    // trailing: ,
                  ),
              
              //2
              ExpansionTile
                  (
                    leading: Icon(Icons.lock,color: Colors.white,),
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    title: Text('Smart Lock',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                    children: 
                    [
                      ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Locked Tokens',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Locked IP Tokens',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Create Lock',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        
                    ],
                    // trailing: ,
                  ),

              // const Divider(color: Colors.grey, thickness: 1,),
              //3
              ExpansionTile
                  (
                    leading: Icon(Icons.settings,color: Colors.white,),
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    title: Text('Services',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                    children: 
                    [
                      ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Advertise With us',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Marketing Companies',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Smartcontract Auditing',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        //
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Exchange Listing',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Shilliers',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Smartcontract Developers',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Web3 Developers',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Twitter Promoters',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Partner With Us',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        
                    ],
                    // trailing: ,
                  ),

            

              //4
              ExpansionTile
                  (
                    leading: Icon(Icons.person_add,color: Colors.white,),
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    title: Text('Referal',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                    children: 
                    [
                      ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Share and Earn',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        
                        
                    ],
                    // trailing: ,
                  ),
              // const Divider(color: Colors.grey, thickness: 1,),
              //5
              ExpansionTile
                  (
                    leading: Icon(Icons.notes,color: Colors.white,),
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    title: Text('Instructions',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                    children: 
                    [
                      ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('How to connect Wallet',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('How to create Token',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('How to create Smart Lock',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('How to Participate in Launch',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('How to REdeem Token',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        
                    ],
                    // trailing: ,
                  ),
              // const Divider(color: Colors.grey, thickness: 1,),

              //5
              ListTile(
                leading: Icon(Icons.help,color: Colors.white,),
                title: Text('Get Help',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                // trailing: const Icon(Icons.arrow_forward_ios),
                onTap: settings,
              ),

              //6
              ListTile(
                leading: Icon(Icons.production_quantity_limits,color: Colors.white,),
                title: Text('our Products',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                // trailing: const Icon(Icons.arrow_forward_ios),
                onTap: settings,
              ),

              //7
              ExpansionTile
                  (
                    leading: Icon(Icons.more,color: Colors.white,),
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    title: Text('More',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                    children: 
                    [
                      ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Terms And Conditions',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Privacy Policy',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        SizedBox
                        (
                          width: 4,
                        ),
                        ListTile
                        (
                          leading: Icon(Icons.rectangle_outlined,color: Colors.white,),
                          title: Text('Advertisement Policy',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                        
                    ],
                    
                    // trailing: ,
                  ),

                  SizedBox
                  (
                    height: 30,
                  ),
                  Text('Hami Launchpd',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w900),),
                  SizedBox(
                    height: 10,
                  ),
                  Row
                  (
                    children: 
                    [
                      Icon(Icons.copyright),
                      SizedBox(width: 5,),
                      Text('2022 All Rights Reserved',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500),)
                    ],
                  )
            ])
          )
        ],
      ),
    );
  }
}

// The settings Drawer(second image)
class MySettings extends StatelessWidget {
  final VoidCallback goBack;

  MySettings({this.goBack});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            ListTile(
              leading: const Icon(Icons.arrow_back_ios),
              title: Text('Main Menu'),
              onTap: goBack,
            ),
            ListTile(
              title: Text('Settings', textScaleFactor: 3,),
              onTap: () => print('Settings'),
            ),
            const Divider(color: Colors.grey, thickness: 1,),
            ListTile(
              title: Text('Change Country'),
              onTap: () => print('Change Country'),
            ),
            ListTile(
              title: Text('ETC'),
              onTap: () => print('ETC'),
            ),
            const Divider(color: Colors.grey, thickness: 1,),
            ListTile(
              title: Text('Dummy Text'),
              onTap: () => print('Dummy Text'),
            ),
          ])
        )
      ],
    );
  }
}

class MyExploreAll extends StatelessWidget {
  final VoidCallback goBack;

  MyExploreAll({this.goBack});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            ListTile(
              leading: const Icon(Icons.arrow_back_ios),
              title: Text('Main Menu'),
              onTap: goBack,
            ),
            ListTile(
              title: Text('Explore All', textScaleFactor: 3,),
              onTap: () => print('Explore'),
            ),
            const Divider(color: Colors.grey, thickness: 1,),
          ])
        )
      ],
    );
  }
}


class MyInnerDrawer extends StatelessWidget {
  final String name;
  final PageController _controller;

  MyInnerDrawer(this._controller, this.name);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        title: Text(name),
        trailing: const Icon(Icons.arrow_back_ios),
        onTap: () => _controller.animateToPage(0,
            duration: const Duration(milliseconds: 500), curve: Curves.linear),
      )
    ]);
  }
}




