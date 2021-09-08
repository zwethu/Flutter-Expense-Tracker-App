import 'package:flutter/material.dart';
import 'package:eco_ml/data/incomeData.dart';
import 'package:hive/hive.dart';
import 'package:eco_ml/data/outcomeData.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  late DateTime pickedDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickedDate = DateTime.now();
  }

  final int id = Hive.box('id').get(0);
  final bool check = Hive.box('id').get(1);
  final TextEditingController customController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff4F98A1),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                 SizedBox(
                    height: 30,
                  ),
                  TextButton.icon(
                      onPressed: () {
                        _pickDate();
                      },
                      icon: Icon(
                        Icons.event,
                        color: Color(0xff4F98A1),
                        size: 30,
                      ),
                      label: Text(
                        '${pickedDate.month} / ${pickedDate.day} / ${pickedDate.year}',
                        style: TextStyle(
                            color: Color(0xff4F98A1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                      height: 50,
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                             SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: check
                                    ? incomeData[id].colorName
                                    : outcomeData[id].colorName,
                              ),
                              child: Icon(
                                check
                                    ? incomeData[id].iconName
                                    : outcomeData[id].iconName,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              check
                                  ? incomeData[id].title
                                  : outcomeData[id].title,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      SizedBox(
                              width: 10,
                            ),
                      
                      Flexible(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                           focusedBorder: UnderlineInputBorder(
                              borderSide:
                        BorderSide(color: Color(0xff4F98A1), width: 3)
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                        BorderSide(color: Color(0xff4F98A1), width: 3)
                            ),
                            border: InputBorder.none

                          ),
                          cursorColor:Color(0xff4F98A1) ,
                          cursorHeight: 30,
                          style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                              width: 30,
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: 'Write the description...',
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 1,color:Color(0xff4F98A1))
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 1,color:Color(0xff4F98A1))
                      ),
                      border:InputBorder.none,

                    ),
                    cursorColor:Color(0xff4F98A1) ,
                    cursorHeight: 30,
                          style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
                        ),
                  
                  SizedBox(
                    height: 35,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff4F98A1)),
                    ),
                    onPressed: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 235,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _pickDate() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: pickedDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        builder: (context, child) {
          return Theme(
              data: ThemeData(
                  accentIconTheme: IconThemeData(color: Colors.amber),
                  cardTheme: CardTheme(
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60))),
                  textTheme: TextTheme(
                    subtitle1: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  colorScheme: ColorScheme.light(
                      primary: Color(0xff4F98A1),
                      primaryVariant: Colors.blue,
                      secondaryVariant: Colors.brown,
                      onSecondary: Colors.indigo,
                      onPrimary: Colors.white,
                      surface: Colors.deepPurple,
                      secondary: Colors.lime),
                  dialogBackgroundColor: Colors.white,
                  primaryColor: Color(0xff4F98A1),
                  accentColor: Color(0xff4F98A1),
                  bottomAppBarColor: Color(0xff4F98A1)),
              child: child ?? Text(""));
        });

    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }
}
