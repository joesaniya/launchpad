// import 'package:flutter/material.dart';
// import 'package:horizontal_data_table/horizontal_data_table.dart';

// class DemoTable extends StatefulWidget {
//   const DemoTable({Key? key}) : super(key: key);

//   @override
//   State<DemoTable> createState() => _DemoTableState();
// }

// class _DemoTableState extends State<DemoTable> {
//   @override
//   Widget build(BuildContext context) {
//     return HorizontalDataTable(
//         leftHandSideColumnWidth: 100,
//         rightHandSideColumnWidth: 600,
//         isFixedHeader: true,
//         headerWidgets: _getTitleWidget(),
//         leftSideItemBuilder: _generateFirstColumnRow,
//         rightSideItemBuilder: _generateRightHandSideColumnRow,
//         // itemCount: widget.user.userInfo.length,
//         itemCount:50,
//         rowSeparatorWidget: const Divider(
//           color: Colors.black54,
//           height: 1.0,
//           thickness: 0.0,
//         ),
//         leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
//         rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
//       );
//   }

//   List<Widget> _getTitleWidget() {
//     return [
//       _getTitleItemWidget('Name', 100),
//       _getTitleItemWidget('Status', 100),
//       _getTitleItemWidget('Phone', 200),
//       _getTitleItemWidget('Register', 100),
//       _getTitleItemWidget('Termination', 200),
//     ];
//   }

//   Widget _getTitleItemWidget(String label, double width) {
//     return Container(
//       child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
//       width: width,
//       height: 56,
//       padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//       alignment: Alignment.centerLeft,
//     );
//   }

//   Widget _generateFirstColumnRow(BuildContext context, int index) {
//     return Container(
//       child: Text('widget.user.userInfo[index].name'),
//       width: 100,
//       height: 52,
//       padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//       alignment: Alignment.centerLeft,
//     );
//   }

//   Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
//     return Row(
//       children: <Widget>[
//         Container(
//           child: Row(
//             children: <Widget>[
//               Icon(Icons.add),
//               Text('data')
//               // Icon(
//               //     widget.user.userInfo[index].status
//               //         ? Icons.notifications_off
//               //         : Icons.notifications_active,
//               //     color: widget.user.userInfo[index].status
//               //         ? Colors.red
//               //         : Colors.green),
//               // Text(widget.user.userInfo[index].status ? 'Disabled' : 'Active')
//             ],
//           ),
//           width: 100,
//           height: 52,
//           padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//           alignment: Alignment.centerLeft,
//         ),
//         Container(
//           child: Text('widget.user.userInfo[index].phone'),
//           width: 200,
//           height: 52,
//           padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//           alignment: Alignment.centerLeft,
//         ),
//         Container(
//           child: Text('widget.user.userInfo[index].registerDate'),
//           width: 100,
//           height: 52,
//           padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//           alignment: Alignment.centerLeft,
//         ),
//         Container(
//           child: Text('widget.user.userInfo[index].terminationDate'),
//           width: 200,
//           height: 52,
//           padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//           alignment: Alignment.centerLeft,
//         ),
//       ],
//     );
//   }

// }

import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter/material.dart';
class HorizontalTable extends StatefulWidget {



  @override
  _HorizontalTableState createState() => _HorizontalTableState();
}

class _HorizontalTableState extends State<HorizontalTable> {
  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;

  @override
  void initState() {
    // user.initData(100);
    user.initData(10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  _getBodyWidget();
  }

  Widget _getBodyWidget() {
    return Container(
      color: Colors.transparent,
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 120,
        rightHandSideColumnWidth: 460,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        // itemCount: user.userInfo.length,
        itemCount: 10,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
        rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
      ),
        // height: 500,
        height: MediaQuery
          .of(context)
          .size
          .height*0.5,
      // height: MediaQuery
      //     .of(context)
      //     .size
      //     .height,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      FlatButton(

        padding: EdgeInsets.all(0),
        child: _getTitleItemWidget(
            '#' + (sortType == sortName ? (isAscending ? '  ↓' : '  ↑') : ''),
            120, Color(0xFF333366)),
        onPressed: () {
          sortType = sortName;
          isAscending = !isAscending;
          user.sortName(isAscending);
          setState(() {

          });
        },
      ),
      Container(width: 2,height: 56,color: Colors.white,),
      _getTitleItemWidget('TOKEN NAME', 150,Color(0xFF333366)),
      Container(width: 2,height: 56,color: Colors.white,),
      FlatButton(
        padding: EdgeInsets.all(0),
        child: _getTitleItemWidget('TOKEN SUPPLY' +
            (sortType == sortStatus ? (isAscending ? '↓' : '↑') : ''), 150,Color(0xFF333366)),
        onPressed: () {
          sortType = sortStatus;
          isAscending = !isAscending;
          user.sortStatus(isAscending);
          setState(() {

          });
        },
      ),
      Container(width: 2,height: 56,color: Colors.white,),
      _getTitleItemWidget('TOKEN_TYPE', 150,Color(0xFF333366)),
      // Container(width: 2,height: 56,color: Colors.white,),
      // _getTitleItemWidget('End Time', 200,Colors.red),
    ];
  }

  Widget _getTitleItemWidget(String label, double width,color) {
    return Container(
      color: color,
      child: Center(child: Text(label, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white))),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      color: Colors.cyan,
      child: Text(user.userInfo[index].name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
      width: 150,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(user.userInfo[index].roll_no,style: TextStyle(fontSize: 18),),
              SizedBox(width: 7,),
              Text('GOT',style: TextStyle(fontSize: 10),),
            ],
          ),
          width: 152,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(width: 2,height: 56,color: Colors.blueGrey,),
        Container(
          child:Text('user.userInfo[index].start_time',style: TextStyle(fontSize: 18),),
          // child: Row(
          //   children: <Widget>[

          //     // Icon(
          //     //     user.userInfo[index].status
          //     //         ? Icons.clear
          //     //         : Icons.check,
          //     //     color: user.userInfo[index].status ? Colors.red : Colors
          //     //         .green),
          //     // Text(user.userInfo[index].status ? 'absent' : 'present',style: TextStyle(fontSize: 18),)
          //   ],
          // ),
          width: 152,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(width: 2,height: 56,color: Colors.blueGrey,),
        Container(
          child: Icon(Icons.edit),
          width: 152,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        // Container(width: 2,height: 56,color: Colors.blueGrey,),
        // Container(
        //   child: Text(user.userInfo[index].end_time,style: TextStyle(fontSize: 18),),
        //   width: 200,
        //   height: 52,
        //   padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        //   alignment: Alignment.centerLeft,
        // ),
      ],
    );
  }
}

Student user = Student();

class Student {
  List<StudentInfo> _userInfo = <StudentInfo>[];

  void initData(int size) {
    for (int i = 0; i < size; i++) {
      _userInfo.add(StudentInfo(
          "Student_$i", i % 3 == 0, 'St_No $i', '10:00 AM', '12:30 PM'));
    }
  }

  List<StudentInfo> get userInfo => _userInfo;

  set userInfo(List<StudentInfo> value) {
    _userInfo = value;
  }

  ///
  /// Single sort, sort Name's id
  void sortName(bool isAscending) {
    _userInfo.sort((a, b) {
      int? aId = int.tryParse(a.name.replaceFirst('Student_', ''));
      int? bId = int.tryParse(b.name.replaceFirst('Student_', ''));
      return (aId! - bId!) * (isAscending ? 1 : -1);
    });
  }

  ///
  /// sort with Status and Name as the 2nd Sort
  void sortStatus(bool isAscending) {
    _userInfo.sort((a, b) {
      if (a.status == b.status) {
        int? aId = int.tryParse(a.name.replaceFirst('User_', ''));
        int? bId = int.tryParse(b.name.replaceFirst('User_', ''));
        return (aId! - bId!);
      } else if (a.status) {
        return isAscending ? 1 : -1;
      } else {
        return isAscending ? -1 : 1;
      }
    });
  }
}

class StudentInfo {
  String name;
  bool status;
  String roll_no;
  String start_time;
  String end_time;

  StudentInfo(this.name, this.status, this.roll_no, this.start_time,
      this.end_time);
}