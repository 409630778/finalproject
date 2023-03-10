import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/counting.dart';
import 'color.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController amountController = TextEditingController();


void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    print(details.toString());
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FebruaryPage(title:'2月'),
    );
  }
}

class FebruaryPage extends StatefulWidget {
  FebruaryPage({Key? key,required this.title}) : super(key:key);

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FebruaryPage> {

  bool seletincome=false;



  void _changeBackground() {
    setState(() {
      backgroundnum2 = (backgroundnum2 + 1) % backgrounds.length;
    });
  }


  void _addItem(String name, int amount, bool isIncome) {
    setState(() {
      if (isIncome) {
        income2 += amount;
        total_income+=amount;
      } else {
        expense2 += amount;
        total_expense+=amount;
      }
      asset2 = income2 - expense2;
      items2.add({
        'name': name,
        'amount':amount,
        'isIncome': isIncome,
      });
    });
  }

  void _removeItem(int index) {

    setState(() {
      Map<String, dynamic> item = items2[index];
      int a1=item['amount'];
      if (item['isIncome']) {
        income2 -= a1;
        total_income-=a1;
      } else {
        expense2 -= a1;
        total_expense-=a1;
      }
      asset2 = income2 - expense2;
      items2.removeAt(index);

    });
  }



  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 187, 10, 10),
          title: Text('Add Item',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Expense',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                  Switch(
                    activeColor:Color.fromARGB(255, 0, 0, 0) ,
                    value:seletincome,
                    onChanged: (newValue) {
                      setState(() {
                        seletincome =!seletincome;
                      });
                    },
                  ),
                  Text('Income',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                ],
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Name',labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                controller: nameController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount',labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                keyboardType: TextInputType.number,
                controller: amountController,
              ),

              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: Text('Enter'),
                    style: ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(
                        255, 0, 0, 0)),
                    onPressed: () {
                      _addItem(nameController.text, int.parse(amountController.text), seletincome);
                      Navigator.of(context).pop();
                      nameController.text = '';
                      amountController.text = '';
                      if(seletincome==true){
                        setState((){
                          seletincome=false;
                        });
                      };
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(
                        255, 0, 0, 0)),
                    child: Text('Cancel'),
                    onPressed: () {
                      setState((){
                        seletincome=false;
                      });
                      Navigator.of(context).pop();
                      nameController.text = '';
                      amountController.text = '';
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text(widget.title,
          style:TextStyle(fontSize: 30) ,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: _changeBackground,
          ),
        ],

      ),
      body:Container(
        decoration: backgrounds[backgroundnum2],
        child:Column(
          children: [
            SizedBox(width: 0,height: 20,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 0, 0, 0),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 255),
                        offset: Offset(4.0, 4.0),
                        blurRadius: 0.0,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 255),
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 0.0,
                        spreadRadius: 1.0),
                  ]),
              width: 350,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Asset:',style: TextStyle(color: Colors.white,fontSize: 20),),
                  Text('\$$asset2',style: TextStyle(color: Colors.white,fontSize: 30),),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[200],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_upward,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Income',
                                        style: TextStyle(color: Colors.grey[500])),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('\$$income2',
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[200],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_downward,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Expense',
                                        style: TextStyle(color: Colors.grey[500])),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('\$$expense2',
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )
                              ],
                            )
                          ])

                  )


                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items2.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> item = items2[index];
                  return ListTile(
                      title: Text(item['name'],style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),)),
                      subtitle: Text(DateFormat.Md().format(DateTime.now()),style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),)),
                      trailing: Text(item['amount'].toString(),style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),)),
                      leading: item['isIncome']
                          ? Icon(Icons.arrow_upward,color:Color.fromARGB(255, 0, 0, 0),)
                          : Icon(Icons.arrow_downward,color:Color.fromARGB(255, 0, 0, 0)),
                      onLongPress: () =>_removeItem(index)
                  );
                },
              ),
            ),
          ],
        ),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        onPressed: _showAddDialog,
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }
}
