import 'package:flutter/material.dart';
import '/theme/constant.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  
final planetThumbnail = new Container(
  color: Colors.transparent,
margin: new EdgeInsets.symmetric(
 vertical: 6.0
),
// alignment: FractionalOffset.centerLeft,
alignment: Alignment.centerLeft,
child: new Image(
image: new AssetImage("assets/images/launch_logo.png"),
height: 102.0,
width: 62.0,
),
);

final planetCard = Container(
  height: 124.0,
  margin: EdgeInsets.only(left: 36.0),
  // margin: new EdgeInsets.only(left: 46.0),
  decoration:  BoxDecoration(
  color: Color(0xFF333366),
  shape: BoxShape.rectangle,
  borderRadius:  BorderRadius.circular(8.0),
  boxShadow: <BoxShadow>[
  BoxShadow(  
  color: Colors.black12,
  blurRadius: 10.0,
  offset: new Offset(0.0, 10.0),
  ),
  ],
  ),
  child: Padding(
    padding: const EdgeInsets.only(left:40.0,right: 20,bottom: 20,top: 20),
    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    style: TextStyle(color: Colors.cyan,),
    textAlign: TextAlign.justify,
    ),
  ),
);


 

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        height: 120.0,
        color: Colors.transparent,
        // margin: const EdgeInsets.symmetric(
        //   // vertical: 6.0,
        //   horizontal: 4.0,
        // ),
        child: new Stack
        (
          children: <Widget>[
          planetCard,
          planetThumbnail,
      ],
     )
    );


    // return Container(
    //   height: 90,
    //   width: double.infinity,
    //   child: Stack(
    //     children: <Widget>[
    //       Padding(
    //         padding: const EdgeInsets.only(top: 12),
    //         child: Container(
    //             height: 70,
    //             width: double.infinity,
    //             decoration: BoxDecoration(
                  
    //                 borderRadius: BorderRadius.circular(15),
    //                 boxShadow: [
    //                   BoxShadow(color: primary, blurRadius: 0.5)
    //                 ]),
    //               child: Align(
    //                 alignment: Alignment.centerRight,
    //                 child:  Padding(
    //                   padding: const EdgeInsets.only(right: 30),
    //                   child: Text("Lola is lost in your neighborhood!Help us find her!",style:contentWhite,),
    //                 ),
    //               ),
    //           ),
    //       ),
    //         Container(
    //         // padding: EdgeInsets.only(left: 10),
    //         child: Image.asset("assets/images/launch_logo.png",width: 100,),
    //         // child: Image.asset("assets/images/lolo_dog.png"),
    //       )
         
    //     ],
    //   ),
    // );
  }
}