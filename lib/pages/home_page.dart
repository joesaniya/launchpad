import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:launchpad_demo/table_widget/projecttable.dart';
import '../widgets/datatable.dart';
import '../table_widget/table.dart';
import '/theme/constant.dart';
import '../widgets/custom_card.dart';
import '/widgets/walk_card_dog.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin  {
   List<String> welcomeImages = [
    "assets/images/trendinglogo.jpg",
    "assets/images/trendinglogo.jpg",
    "assets/images/trendinglogo.jpg",
    "assets/images/trendinglogo.jpg",
    "assets/images/hand-shake.png",
    "assets/images/hand-shake.png",
    "assets/images/hand-shake.png",
    "assets/images/hand-shake.png",
    "assets/images/bulb.png",
    "assets/images/bulb.png",
    "assets/images/bulb.png",
    "assets/images/bulb.png",
  ];

    List<dynamic> _services = [
    ['Transfer',"trendinglogo.jpg", Colors.blue],
    ['Top-up', "assets/images/hand-shake.png", Colors.pink],
    ['Bill', "assets/images/bulb.png", Colors.orange],
  ];
  @override
  Widget build(BuildContext context) {
  CardController controller; 
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView
      (
        child: Column
        (
          children: <Widget>[
            Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                "Hello There!",
                style: appTitle,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: size.width * 0.9,
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                    style: contentBlack,
                    textAlign: TextAlign.justify,
                  ),
                
                ),
              SizedBox(
                height: 20,
              ),
              CustomCard(),

              
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Trending Categories".toUpperCase(),style: TextStyle(fontSize: 17,),),
                  Text("See All")
                ],
              ),
              // SizedBox(height: 20,),
              // Placeholder
              // (
              //   fallbackHeight: 60,
              // ),
              Container(
              height: MediaQuery.of(context).size.height * 0.3,//or else 0.5
              // ignore: unnecessary_new
              child: new TinderSwapCard(
                  swipeUp: true,
                  swipeDown: true,
                  orientation: AmassOrientation.BOTTOM,
                  totalNum: welcomeImages.length,
                  stackNum: 3,
                  swipeEdge: 4.0,

                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  maxHeight: MediaQuery.of(context).size.width * 0.5,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  minHeight: MediaQuery.of(context).size.width * 0.3,

                  // maxWidth: MediaQuery.of(context).size.width * 0.9,
                  // maxHeight: MediaQuery.of(context).size.width * 0.9,
                  // minWidth: MediaQuery.of(context).size.width * 0.8,
                  // minHeight: MediaQuery.of(context).size.width * 0.8,
                  // cardBuilder: (context, index) => Card(
                  //       child: Image.asset('${welcomeImages[index]}'),
                  //     ),

                  //container
                  cardBuilder: (context,index)=>Container(
    width: 200,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.cyan.shade50,
      elevation: 10,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
           ListTile(
            // tileColor: Colors.yellow,
            leading: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      child: Image.asset('${welcomeImages[index]}'),
                      // child: _services[index][1],
                    ),
            title: Text('Trending',style: TextStyle(color: Color(0xFF333366),fontSize: 30,fontWeight: FontWeight.w900)),
            subtitle: Text('Digiblock', style: TextStyle(color: Color(0xFF333366),fontSize: 17,fontWeight: FontWeight.w400)),
          )
        ],
      ),
    ),
  ),

        //           cardBuilder:(context,index)=>CupertinoButton(
        //   child: Container(
        //     height: 200,
        //     width: 200,
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         image: AssetImage(('${welcomeImages[index]}')),
        //         fit: BoxFit.cover,
        //       ),
        //       borderRadius: BorderRadius.circular(12),
        //     ),
        //     child: Container(
        //       margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
        //       child: Text(
        //         "Mindfulness",
        //         style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 20,
        //             fontWeight: FontWeight.w600),
        //       ),
        //     ),
        //   ),
        //   onPressed: () {
        //     showCupertinoDialog(
        //       context: context,
        //       builder: (BuildContext context) => CupertinoAlertDialog(
        //             title: const Text('Card is clicked.'),
        //             actions: <Widget>[
        //               CupertinoDialogAction(
        //                 child: const Text('ok'),
        //                 onPressed: () {
        //                   Navigator.pop(context, 'ok');
        //                 },
        //               ),
        //             ],
        //           ),
        //     );
        //   },
        // ),
                  cardController: controller = CardController(),
                  swipeUpdateCallback:
                      (DragUpdateDetails details, Alignment align) {
                    /// Get swiping card's alignment
                    if (align.x < 0) {
                      //Card is LEFT swiping
                    } else if (align.x > 0) {
                      //Card is RIGHT swiping
                    }
                  },
                  swipeCompleteCallback:
                      (CardSwipeOrientation orientation, int index) {
                    /// Get orientation & index of swiped card!
                  },
              ),
          ),

          SizedBox
          (
            height: 30,
          ),

          // DemoTable(),

          // DataTableDemo(),

          SizedBox
          (
            height: 50,
            child: Container
            (
              height: 50,
              width: double.infinity,
              child: Text('Recently Created Tokens',style: TextStyle(fontSize: 20),),
            ),
          ),

          HorizontalTable(),

          //2nd
          SizedBox
          (
            height: 30,
          ),

          // DemoTable(),

          // DataTableDemo(),

          SizedBox
          (
            height: 50,
            child: Container
            (
              height: 50,
              width: double.infinity,
              child: Text('Recently Created Projects',style: TextStyle(fontSize: 20),),
            ),
          ),

          ProjectTable(),

          
              
              //  SingleChildScrollView(
              //    scrollDirection: Axis.horizontal,
              //                   child: Row(
              //      children: <Widget>[
              //         WalkGroupCard(imgScr: "assets/images/trending.jpg",title: "Meet our lovely dogs walking with us",location: "Valencia, Spain",members: "8 memmbers",orgBy: "Laura",),
              //         WalkGroupCard(imgScr: "assets/images/sponsored.jpg",title: "Meet our lovely dogs walking with us",location: "Valencia, Spain",members: "8 memmbers",orgBy: "Laura",),
              //         WalkGroupCard()
              //      ],
              //    ),
              //  )
              
              
            ],
      ),
    ),
          ],
        ),
      ),
  //       child: ListView(
  //         children: <Widget>[
  //           Padding(
  //     padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
  //     child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Text(
  //               "Hello There!",
  //               style: appTitle,
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             SizedBox(
  //                 width: size.width * 0.9,
  //                 child: Text(
  //                   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
  //                   style: contentBlack,
  //                   textAlign: TextAlign.justify,
  //                 ),
                
  //               ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             CustomCard(),

              
  //             SizedBox(height: 30,),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: <Widget>[
  //                 Text("Trending Categories".toUpperCase(),style: TextStyle(fontSize: 17,),),
  //                 Text("See All")
  //               ],
  //             ),
  //             // SizedBox(height: 20,),
  //             // Placeholder
  //             // (
  //             //   fallbackHeight: 60,
  //             // ),
  //             Container(
  //             height: MediaQuery.of(context).size.height * 0.3,//or else 0.5
  //             // ignore: unnecessary_new
  //             child: new TinderSwapCard(
  //                 swipeUp: true,
  //                 swipeDown: true,
  //                 orientation: AmassOrientation.BOTTOM,
  //                 totalNum: welcomeImages.length,
  //                 stackNum: 3,
  //                 swipeEdge: 4.0,

  //                 maxWidth: MediaQuery.of(context).size.width * 0.9,
  //                 maxHeight: MediaQuery.of(context).size.width * 0.5,
  //                 minWidth: MediaQuery.of(context).size.width * 0.8,
  //                 minHeight: MediaQuery.of(context).size.width * 0.3,

  //                 // maxWidth: MediaQuery.of(context).size.width * 0.9,
  //                 // maxHeight: MediaQuery.of(context).size.width * 0.9,
  //                 // minWidth: MediaQuery.of(context).size.width * 0.8,
  //                 // minHeight: MediaQuery.of(context).size.width * 0.8,
  //                 // cardBuilder: (context, index) => Card(
  //                 //       child: Image.asset('${welcomeImages[index]}'),
  //                 //     ),

  //                 //container
  //                 cardBuilder: (context,index)=>Container(
  //   width: 200,
  //   child: Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(15.0),
  //     ),
  //     color: Colors.cyan.shade50,
  //     elevation: 10,
  //     child: Column(
  //       // mainAxisSize: MainAxisSize.min,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: <Widget>[
  //          ListTile(
  //           // tileColor: Colors.yellow,
  //           leading: ClipRRect(
  //                     borderRadius: BorderRadius.all(Radius.circular(4.0)),
  //                     child: Image.asset('${welcomeImages[index]}'),
  //                     // child: _services[index][1],
  //                   ),
  //           title: Text('Trending',style: TextStyle(color: Color(0xFF333366),fontSize: 30,fontWeight: FontWeight.w900)),
  //           subtitle: Text('Digiblock', style: TextStyle(color: Color(0xFF333366),fontSize: 17,fontWeight: FontWeight.w400)),
  //         )
  //       ],
  //     ),
  //   ),
  // ),

  //       //           cardBuilder:(context,index)=>CupertinoButton(
  //       //   child: Container(
  //       //     height: 200,
  //       //     width: 200,
  //       //     decoration: BoxDecoration(
  //       //       image: DecorationImage(
  //       //         image: AssetImage(('${welcomeImages[index]}')),
  //       //         fit: BoxFit.cover,
  //       //       ),
  //       //       borderRadius: BorderRadius.circular(12),
  //       //     ),
  //       //     child: Container(
  //       //       margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
  //       //       child: Text(
  //       //         "Mindfulness",
  //       //         style: TextStyle(
  //       //             color: Colors.white,
  //       //             fontSize: 20,
  //       //             fontWeight: FontWeight.w600),
  //       //       ),
  //       //     ),
  //       //   ),
  //       //   onPressed: () {
  //       //     showCupertinoDialog(
  //       //       context: context,
  //       //       builder: (BuildContext context) => CupertinoAlertDialog(
  //       //             title: const Text('Card is clicked.'),
  //       //             actions: <Widget>[
  //       //               CupertinoDialogAction(
  //       //                 child: const Text('ok'),
  //       //                 onPressed: () {
  //       //                   Navigator.pop(context, 'ok');
  //       //                 },
  //       //               ),
  //       //             ],
  //       //           ),
  //       //     );
  //       //   },
  //       // ),
  //                 cardController: controller = CardController(),
  //                 swipeUpdateCallback:
  //                     (DragUpdateDetails details, Alignment align) {
  //                   /// Get swiping card's alignment
  //                   if (align.x < 0) {
  //                     //Card is LEFT swiping
  //                   } else if (align.x > 0) {
  //                     //Card is RIGHT swiping
  //                   }
  //                 },
  //                 swipeCompleteCallback:
  //                     (CardSwipeOrientation orientation, int index) {
  //                   /// Get orientation & index of swiped card!
  //                 },
  //             ),
  //         ),

  //         SizedBox
  //         (
  //           height: 30,
  //         ),

  //         // DataTableDemo(),

          
              
  //             //  SingleChildScrollView(
  //             //    scrollDirection: Axis.horizontal,
  //             //                   child: Row(
  //             //      children: <Widget>[
  //             //         WalkGroupCard(imgScr: "assets/images/trending.jpg",title: "Meet our lovely dogs walking with us",location: "Valencia, Spain",members: "8 memmbers",orgBy: "Laura",),
  //             //         WalkGroupCard(imgScr: "assets/images/sponsored.jpg",title: "Meet our lovely dogs walking with us",location: "Valencia, Spain",members: "8 memmbers",orgBy: "Laura",),
  //             //         WalkGroupCard()
  //             //      ],
  //             //    ),
  //             //  )
              
              
  //           ],
  //     ),
  //   ),
  //         ],
  //       )
        );
  }
}
