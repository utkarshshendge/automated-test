
import 'package:flutter_automated_test/concatenate.dart';


import 'package:flutter_test/flutter_test.dart';  //import test pacakage
void main(){
  //write tests
  test("Perform concatenation",(){
String name="Utkarsh";
String age="19";
String gender="Male";

String height="6";
String heightIn="Ft";
String weight="70";
String weightIn="Kgs";
String concatanate=concatenate(name,age,gender,height,heightIn,weight,weightIn);
expect(concatanate, "Utkarsh is 19 years old Male of height 6Ft and Weight 70Kgs .");
  });
}