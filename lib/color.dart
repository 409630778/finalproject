import 'package:flutter/material.dart';

//注意使用這裡的素材更改樣式時，不能使用Hot reload，要使用Run，如此才會更新color.dart。
//在list加入設計，用textstyle值去選取，Ex:Text('Hi',style:tstyle[textstyle]，Button同理
//用final建立函式，直接用Tes1執行，Ex:Text('Hi',style:Tes1)；Button設計同理
//依自己需求刪減、修改、新增
//盡量使用List方式，會比較方便

//background design---
int backgroundnum=0;
int backgroundnum1=0;int backgroundnum2=0;int backgroundnum3=0;int backgroundnum4=0;
int backgroundnum5=0;int backgroundnum6=0;int backgroundnum7=0;int backgroundnum8=0;
int backgroundnum9=0;int backgroundnum10=0;int backgroundnum11=0;int backgroundnum12=0;
List<BoxDecoration> backgrounds = [
  BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color.fromARGB(255, 49, 49, 49), Color.fromARGB(
          255, 9, 120, 122)],
    ),
  ),//tech
  BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color.fromARGB(255, 187, 10, 10), Color.fromARGB(
          255, 187, 10, 10)],
    ),
  ),//red type
  BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color.fromARGB(
          255, 0, 0, 0),Color.fromARGB(255, 35, 35, 35), Color.fromARGB(
          255, 70, 70, 70),Color.fromARGB(
          255, 35, 35, 35),Color.fromARGB(
          255, 0, 0, 0)],
    ),
  ),
  BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.pink, Colors.teal],
    ),
  ),
  BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.cyan, Colors.deepPurple],
    ),
  ),
];



//Text design---



int textstyle=0;
List<TextStyle> tstyle=[
  TextStyle(color: Colors.red[800]),

];


//Button design---



int buttonstyle=0;
List<ButtonStyle> bstyle=[
  ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 0, 95, 112),),//tech
  ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(255, 0, 0, 0)),//red type
];
//tech
List<Color> techstyle=[
  Color.fromARGB(179, 8, 208, 253),//AlertDialog
  Color.fromARGB(255, 255, 255, 255),//switch
  Color.fromARGB(255, 9, 120, 122),//appbar
  Color.fromARGB(255, 8, 245, 253),//boxshadow
  Color.fromARGB(255, 19, 255, 74),//up箭頭和income的$
  Color.fromARGB(255, 255, 19, 137),//dowm箭頭和expense的$
  Color.fromARGB(255, 8, 245, 253),//listtitle(全部)
  Color.fromARGB(255, 70, 70, 70),//FloatingActionButton
  Color.fromARGB(255, 8, 245, 253),//FloatingActionButto的+
];
//red type
List<Color> red_type=[
  Color.fromARGB(255, 187, 10, 10),//AlertDialog
  Color.fromARGB(255, 255, 255, 255),//AlertDialog(所有文字)
  Color.fromARGB(255, 0, 0, 0),//switch
  Color.fromARGB(255, 0, 0, 0),//appbar
  Color.fromARGB(255, 255, 255, 255),//boxshadow(模糊0)
  Color.fromARGB(255, 0, 0, 0),//up箭頭
  Color.fromARGB(255, 0, 0, 0),//dowm箭頭
  Color.fromARGB(255, 0, 0, 0),//listtitle(上下箭頭)
  Color.fromARGB(255, 255, 255, 255),//listtitle(文字)
  Color.fromARGB(255, 0, 0, 0),//FloatingActionButton
  Color.fromARGB(255, 255, 255, 255),//FloatingActionButto的+
];