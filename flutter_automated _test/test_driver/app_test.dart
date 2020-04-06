
//use :flutter driver --target=test_driver/app.dart   in terminal to run Integration test
//After running test we can see that   "+1 -3: Some tests failed."   <--It means one test is passed(1st one) and other failed.
//Because we expected output as "Utkarsh is 19 years old Male of height 6Ft and Weight 70Kgs ."
//testing of toggle buttons will be added soon.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("integration testing", () {           //groups created for different test cases
    FlutterDriver driver;
    // Connect to  Flutter driver before running  tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    // Disconnect the driver after the tests have completed
    tearDownAll(() {
      if (driver != null) {
        driver.close();
      }
    });
    var nameField = find.byValueKey("name-field");
    var ageField = find.byValueKey("age-field");
    var weightField = find.byValueKey("weight-field");
    var heightField = find.byValueKey("height-field");
    var button = find.byType('OutlineButton');
    var finalString = find
        .text("Utkarsh is 19 years old Male of height 6Ft and Weight 70Kgs .");

    test('Display info of user', () async {           //test case 1(passes)
      await driver.tap(nameField);                     // tap the textfield
      await driver.enterText("Utkarsh");              //enter  "Utkarsh" in it
      await driver.tap(ageField);
      await driver.enterText("19");
      await driver.tap(heightField);
      await driver.enterText("6");
      await driver.tap(weightField);
      await driver.enterText("70");
      await driver.tap(button);                       //tap OutLineButton
      await driver.waitFor(finalString);
      await driver.waitUntilNoTransientCallbacks();  //confirm that there are no more callbacks
      assert(finalString != null);                   //finalString exists
    }
    );
    test('Display info of user', () async {             //test case 2(fails)
      await driver.tap(nameField);                    
      await driver.enterText("Big Smoke");             
      await driver.tap(ageField);
      await driver.enterText("26");
      await driver.tap(heightField);
      await driver.enterText("6");
      await driver.tap(weightField);
      await driver.enterText("170");
      await driver.tap(button);                       
      await driver.waitFor(finalString);
      await driver.waitUntilNoTransientCallbacks();  
      assert(finalString != null);                   
    }
    );
test('Display info of user', () async {                    //test case 3(fails)
      await driver.tap(nameField);                     
      await driver.enterText("God of thunder");              
      await driver.tap(ageField);
      await driver.enterText("108");
      await driver.tap(heightField);
      await driver.enterText("6");
      await driver.tap(weightField);
      await driver.enterText("200");
      await driver.tap(button);                       
      await driver.waitFor(finalString);
      await driver.waitUntilNoTransientCallbacks();  
      assert(finalString != null);                   
    }
    );

    test('Display info of user', () async {                    //test case 4(fails)
      await driver.tap(nameField);                    
      await driver.enterText("");              
      await driver.tap(ageField);
      await driver.enterText("");
      await driver.tap(heightField);
      await driver.enterText("");
      await driver.tap(weightField);
      await driver.enterText("");
      await driver.tap(button);                       
      await driver.waitFor(finalString);
      await driver.waitUntilNoTransientCallbacks();  
      assert(finalString != null);                   
    }
    );


 
  });
}

