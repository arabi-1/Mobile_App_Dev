import 'package:currency_converter_app1/currency_converter_material_page.dart';
import 'package:flutter/material.dart';
//We can't randonly design an app, we have two major companies that provides design rules and principles, here they ae
//1 Material Design(By Google)
//2. Cupertino Design(By Apple)

void main() {
  runApp(MyApp()); //This(runApp) funtion is used to run the flutter app,
  // provided by material.dart from flutter
  //by making the MyApp() constant we make it a compile time constant, we ask flutter not to recreate it repeatedly,(this helps improve the performance of the app be decreasing the number of times the object is created)
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  }); //(Constructors for public widgets should have a named 'key' parameter.
  // Try adding a named parameter to the constructor.) : The analyzer produces this diagnostic when a constructor in a subclass of Widget that isn't private to its library doesn't have a parameter named key.
  //key is a class that helps flutter identify and differentiate between widgets, we assign a specific key to a specific widget instance
  //so when we pass the key to the MyApp() constructor we assign a key to that specific widget instance
  @override
  Widget build(BuildContext context) {
    //writing build method(which returns a widget) is compulsory, else MyApp class gives error
    // return const Text(//for the sake of performance(same reason for MyApp we use const)
    // //if we return text widget we won't be able to move from one page to another, therefore we have to return the MaterialApp or Cupertino to enable navigation, the same goes for themes, internationalization, localizatoin
    //   'Salam Flutter',
    //   textDirection: TextDirection.ltr,
    // ); //Here the Text widget is returned, fulfilling the requirement of build method
    return MaterialApp(
      home: CurrencyConverterMaterialPage(),
    ); //Reason given in front of the Text widget
  }
}

/*What is init method?
Answer: It runs once after the constructor and creatState() is called

2.What is didChangeDependencies?
Answe: This method is called immediately after the initstate method and will be called again after the piece of data the widget depends on is updated
it is used very rarely, as our build method is called after this

3. What is didUpdateWidgent method?
Answer:This function runs when the widget attached to the state is replaced by another widget.

4.What is dispose method?
Answer: This function is used to remove all the connections our app has.  We unsubscribe from all the connections or listeners. 
This it helps us remove things from app's memory  and prevents our app from memory leaks.

5.What is setState
Answer. It helps us rerun our builf function again
*/
