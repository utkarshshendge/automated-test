//simple PAGE TO TAKE DATA FROM USER( basics of layouts,togglebuttons,bottomsheet)
// return a concatenated String

//contact :  utkarshcpark@gmail.com
//ALTERNATE contact : utkarsh.shendge18@vit.edu
import 'package:flutter/material.dart';
import 'concatenate.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GSOC 2020  UI',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> isSelected = [false, false, false];
  List<bool> isSelectedHeight = [true, false, false, false]; 
  List<bool> isSelectedWeight = [true, false];
  String name;
  String age;
  String heightIn = "Ft";
  String weightIn = "Kgs";
  String gender = "Male";
  String weight;
  String height;
  String displayText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: double.infinity, // fill the screen horizontally with container
          decoration: BoxDecoration(color: Colors.blueAccent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("To get started.",
                              style: TextStyle(
                                color: Colors.white30,
                                fontSize: 26.0,
                                height: 1.5,
                              )),
                        ],
                      ),
                    ],
                  )),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          child: Container(
                              width: 300,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10,
                                        offset: Offset(0, 10))
                                  ]),
                              child: TextField(
                                key: Key(
                                    "name-field"),         //Keys are added for the sake of Automated testing
                                onChanged: (value) {
                                  this.name = value;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: " Name",
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: 15)),
                              )),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Wrap(
                          children: <Widget>[
                            SizedBox(width: 33),
                            ToggleButtons(
                              renderBorder: false,
                              selectedColor: Colors.white,
                              fillColor: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(20),
                              isSelected: isSelected,
                              onPressed: (int index) {
                                setState(() {
                                  isSelected[index] = !isSelected[
                                      index];                   //logic for toggle buttons selection of gender
                                  if (index == 0) {
                                    this.gender = 'Male';
                                    isSelected[1] = false;
                                    isSelected[2] = false;
                                  }
                                  if (index == 1) {
                                    this.gender = 'Other';
                                    isSelected[0] = false;
                                    isSelected[2] = false;
                                  }
                                  if (index == 2) {
                                    this.gender = 'female';
                                    isSelected[0] = false;
                                    isSelected[1] = false;
                                  }
                                });
                              },
                              children: <Widget>[
                                Text('Male', style: TextStyle(fontSize: 15)),
                                Text('Other', style: TextStyle(fontSize: 15)),
                                Text('Female', style: TextStyle(fontSize: 15)),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          (displayText != '') ? displayText : "None",
                          style: TextStyle(fontSize: 20),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 33),
                              Container(
                                  width: 100,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 10,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: TextField(
                                    key: Key("age-field"),
                                    onChanged: (value) {
                                      this.age = value;
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: "Age",
                                        labelStyle: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                  )),
                              SizedBox(
                                width: 25,
                              ),
                              Ink(
                                  color: Colors.white,
                                  child: InkWell(
                                    onTap: () {
                                      _settingModalBottomSheet(context);  // bottom sheet to select units of height and weight
                                    },
                                    child: Container(
                                        child: Center(
                                          child: Text(" UNITS ( height,weight)",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                        ),
                                        width: 180,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.blueAccent,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 10,
                                                  offset: Offset(0, 10))
                                            ])),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Wrap(
                            children: <Widget>[
                              Container(
                                  width: 100,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 10,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: TextField(
                                    key: Key("weight-field"),
                                    onChanged: (value) {
                                      this.weight = value;
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: "Weight",
                                        hintText: weightIn,
                                        labelStyle: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                  )),
                              SizedBox(
                                width: 35,
                              ),
                              Container(
                                  width: 100,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 10,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: TextField(
                                    key: Key("height-field"),
                                    onChanged: (value) {
                                      this.height = value;
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: "Height",
                                        hintText: heightIn,
                                        labelStyle: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                  )),
                            ],
                          ),
                        ),
                        Container(height: 30),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 120,
                            child: OutlineButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Proceed",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              onPressed: () {
                                setState(() {
                                  displayText = concatenate(name, age, gender,
                                      height, heightIn, weight, weightIn);
                                });
                              },
                              highlightElevation: 6.0,
                              highlightColor: Colors.greenAccent,
                              borderSide: BorderSide(
                                  color: Colors.blue,
                                  style: BorderStyle.solid,
                                  width: 4.0),
                            ),
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//code for modal bottom sheet
  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
                                     //necessary for updating the values in bottom sheet
              builder: (BuildContext context, StateSetter setStateWeight) {
            return Container(
              height: 150,
              child: new Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 2),
                      ToggleButtons(
                        renderBorder: false,
                        selectedColor: Colors.white,
                        fillColor: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20),
                        isSelected: isSelectedWeight,
                        onPressed: (int indexOfWeight) {
                          setStateWeight(() {
                                                            //logic for selecting unit(weight) from toggle buttons
                            isSelectedWeight[indexOfWeight] =
                                !isSelectedWeight[indexOfWeight];
                            if (indexOfWeight == 0) {
                              this.weightIn = 'Kgs';
                              isSelectedWeight[1] = false;
                              isSelectedWeight[0] = true;
                            }
                            if (indexOfWeight == 1) {
                              this.weightIn = 'Pounds';
                              isSelectedWeight[0] = false;
                              isSelectedWeight[1] = true;
                            }
                          });
                        },
                        children: <Widget>[
                          Text('Kilogram', style: TextStyle(fontSize: 15)),
                          Text('Pounds', style: TextStyle(fontSize: 15)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 2),
                      ToggleButtons(
                        renderBorder: false,
                        fillColor: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20),
                        isSelected: isSelectedHeight,
                        onPressed: (int indexOfHeight) {
                          //logic for selecting unit(height) from toggle buttons
                          setStateWeight(() {
                            isSelectedHeight[indexOfHeight] =
                                !isSelectedHeight[indexOfHeight];
                            if (indexOfHeight == 0) {
                              this.heightIn = 'Cm';
                              isSelectedHeight[1] = false;
                              isSelectedHeight[0] = true;
                              isSelectedHeight[2] = false;
                              isSelectedHeight[3] = false;
                            }
                            if (indexOfHeight == 1) {
                              this.heightIn = 'Meter';
                              isSelectedHeight[0] = false;
                              isSelectedHeight[1] = true;
                              isSelectedHeight[2] = false;
                              isSelectedHeight[3] = false;
                            }
                            if (indexOfHeight == 2) {
                              this.heightIn = 'Inch';
                              isSelectedHeight[0] = false;
                              isSelectedHeight[1] = false;
                              isSelectedHeight[2] = true;
                              isSelectedHeight[3] = false;
                            }
                            if (indexOfHeight == 3) {
                              this.heightIn = 'Ft';
                              isSelectedHeight[0] = false;
                              isSelectedHeight[1] = false;
                              isSelectedHeight[2] = false;
                              isSelectedHeight[3] = true;
                            }
                          });
                        },
                        children: <Widget>[
                          Text('Cm', style: TextStyle(fontSize: 15)),
                          Text('Meter', style: TextStyle(fontSize: 15)),
                          Text('Inch', style: TextStyle(fontSize: 15)),
                          Text('Ft', style: TextStyle(fontSize: 15)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          });
        });
  }
}

