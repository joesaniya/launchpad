import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class ProjectTable extends StatefulWidget {
  const ProjectTable({Key? key}) : super(key: key);

  @override
  State<ProjectTable> createState() => _ProjectTableState();
}

class _ProjectTableState extends State<ProjectTable> {
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
      _getTitleItemWidget('NAME', 150,Color(0xFF333366)),
      Container(width: 2,height: 56,color: Colors.white,),
      FlatButton(
        padding: EdgeInsets.all(0),
        child: _getTitleItemWidget('LIQUIDITY %' +
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
      _getTitleItemWidget('LOCKUP TIME', 150,Color(0xFF333366)),
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
      child: Center(child: Text(user.userInfo[index].name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)),
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
          child:Center(child: Text(user.userInfo[index].start_time,style: TextStyle(fontSize: 18),)),
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
          child:Text(user.userInfo[index].end_time,style: TextStyle(fontSize: 18),),
          width: 152,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        
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
          "Project_$i", i % 3 == 0, 'Project_No $i', '61%', '12 days'));
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