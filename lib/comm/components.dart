export 'components/echart.dart';
export 'components/flchart.dart';
export 'components/flchart1.dart';
export 'components/flchart2.dart';
export 'components/flchart3.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

var mainBgColor = Colors.deepOrange;
var secBgColor = Colors.purple;
var mainTextColor = Colors.white;
var mainGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [mainBgColor, secBgColor]);
var mainBoxDecoration =
    BoxDecoration(gradient: mainGradient, border: Border.all());

Widget ylzButton({required Function() func, required String title}) =>
    ElevatedButton(
      onPressed: func,
      child: Text(title),
    );
Widget ylzContainer({double? width, double? height, Widget? child}) =>
    Container(
      width: width,
      height: height,
      child: child,
      //padding: EdgeInsets.all(3),
      //margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [BoxShadow(offset: Offset(1, 1), blurRadius: 3)]),
    );
Widget ylzFutureBuilder(Future<Object> func, Color color) => FutureBuilder(
    future: func, // 用户定义的需要异步执行的代码，类型为Future<String>或者null的变量或函数
    initialData: "init...",
    builder: (BuildContext context, AsyncSnapshot<Object> snapshot) {
      //snapshot就是_calculation在时间轴上执行过程的状态快照
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          return new Text('Press button to start'); //如果_calculation未执行则提示：请点击开始
        case ConnectionState.waiting:
          return CircularProgressIndicator(backgroundColor: color);
        //return new Text(
        //    'Awaiting result...'); //如果_calculation正在执行则提示：加载中
        default: //如果_calculation执行完毕
          if (snapshot.hasError) //若_calculation执行出现异常
            return new Text('Error: ${snapshot.error}',
                style: TextStyle(fontSize: 24, color: color));
          else //若_calculation执行正常完成
            return snapshot.data as Widget;
      }
    });

Widget ylzDataTable(
        {required List<String> columns,
        required List<Map<String, dynamic>> rows,
        TextStyle? headingTextStyle,
        TextStyle? dataTextStyle}) =>
    DataTable(
      columns: columns.map((x) => DataColumn(label: Text('$x'))).toList(),
      rows: rows
          .map((x) => DataRow(
              cells: x.values.map((y) => DataCell(Text("$y"))).toList()))
          .toList(),
      sortColumnIndex: 2,
      columnSpacing: 60,
      showBottomBorder: true,
      headingTextStyle: headingTextStyle,
      dataTextStyle: dataTextStyle,
    );
