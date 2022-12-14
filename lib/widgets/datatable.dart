import 'package:flutter/material.dart';

class DataTableDemo extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return ListView(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
      children: <Widget>[  
            Center(  
                child: Text(  
                  'Recently Created Tokens',  
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),  
                )),  
            DataTable(  
              columns: [  
                // DataColumn(label: Text(  
                //     '#',  
                //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                // )),  
                DataColumn(label: Flexible(
                  child: Text(  
                      'TKN_NAME',  
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                  ),
                )
                ),  
                DataColumn(label: Flexible(
                  // fit: BoxFit.contain,
                  child: Text(  
                      'TKN_SUPPLY',  
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                  ),
                )),  
                DataColumn(label: Flexible(
                  child: Text(  
                      'TKN_tYPE',  
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                  ),
                )),  
              ],  
              rows: [  
                DataRow(cells: [  
                  DataCell(Text('1')),  
                  DataCell(Text('Stephen')),  
                  DataCell(Text('Actor')),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('5')),  
                  DataCell(Text('John')),  
                  DataCell(Text('Student')),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('10')),  
                  DataCell(Text('Harry')),  
                  DataCell(Text('Leader')),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('15')),  
                  DataCell(Text('Peter')),  
                  DataCell(Text('Scientist')),  
                ]),  
              ],  
            ),  
          ]);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data Tables'),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           PaginatedDataTable(
//             header: Text('Header Text'),
//             rowsPerPage: 4,
//             columns: [
//               DataColumn(label: Text('Header A')),
//               DataColumn(label: Text('Header B')),
//               DataColumn(label: Text('Header C')),
//               DataColumn(label: Text('Header D')),
//             ],
//             source: _DataSource(context),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _Row {
//   _Row(
//     this.valueA,
//     this.valueB,
//     this.valueC,
//     this.valueD,
//   );

//   final String valueA;
//   final String valueB;
//   final String valueC;
//   final int valueD;

//   bool selected = false;
// }

// class _DataSource extends DataTableSource {
//   _DataSource(this.context) {
//     _rows = <_Row>[
//       _Row('Cell A1', 'CellB1', 'CellC1', 1),
//       _Row('Cell A2', 'CellB2', 'CellC2', 2),
//       _Row('Cell A3', 'CellB3', 'CellC3', 3),
//       _Row('Cell A4', 'CellB4', 'CellC4', 4),
//     ];
//   }

//   final BuildContext context;
//   List<_Row> _rows;

//   int _selectedCount = 0;

//   @override
//   DataRow? getRow(int index) {
//     assert(index >= 0);
//     if (index >= _rows.length) return null;
//     final row = _rows[index];
//     return DataRow.byIndex(
//       index: index,
//       selected: row.selected,
//       onSelectChanged: (value) {
//         if (row.selected != value) {
//           _selectedCount += value ? 1 : -1;
//           assert(_selectedCount >= 0);
//           row.selected = value!;
//           notifyListeners();
//         }
//       },
//       cells: [
//         DataCell(Text(row.valueA)),
//         DataCell(Text(row.valueB)),
//         DataCell(Text(row.valueC)),
//         DataCell(Text(row.valueD.toString())),
//       ],
//     );
//   }

//   @override
//   int get rowCount => _rows.length;

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get selectedRowCount => _selectedCount;
}
}