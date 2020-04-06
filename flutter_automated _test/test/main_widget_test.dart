//Widget testing of toggle buttons will be added soon
import 'package:flutter/material.dart';
import 'package:flutter_automated_test/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Perform widget testing', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      //build app and build a frame
      home: MyHomePage(),
    ));
    var nameField = find.byKey(Key("name-field")); //find widget by key
    var ageField = find.byKey(Key("age-field"));
    var weightField = find.byKey(Key("weight-field"));
    var heightField = find.byKey(Key("height-field"));
    var button = find.byType(OutlineButton); //find widget by type

    expect(nameField, findsOneWidget);        // check if the widget exist
    expect(ageField, findsOneWidget);
    expect(weightField, findsOneWidget);
    expect(heightField, findsOneWidget);

    await tester.enterText(nameField, 'Utkarsh');      // enter text 
    expect(find.text('Utkarsh'), findsOneWidget);       //check if the text exist
    await tester.enterText(ageField, '19');
    expect(find.text('19'), findsOneWidget);
    await tester.enterText(weightField, '70');
    expect(find.text('70'), findsOneWidget);
    await tester.enterText(heightField, '6');
    expect(find.text('6'), findsOneWidget);

    expect(button, findsOneWidget);         //check if button exist           

    await tester.tap(button);               //tap the button      
    await tester.pump();                      //build(trigger) a frame
    expect(
        find.text(
            "Utkarsh is 19 years old Male of height 6Ft and Weight 70Kgs ."),
        findsOneWidget);
  });
}
