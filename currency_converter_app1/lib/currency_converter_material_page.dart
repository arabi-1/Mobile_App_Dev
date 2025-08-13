import 'package:flutter/material.dart';
//widgets are always immutable
//the state makes the give class mutable i.e the one that extends state

class CurrencyConverterMaterialPage extends StatefulWidget {
  //
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    //if some values are coming from streams or futures we can assign them in thi sfunctin
    super.initState();
  }
@override
  void dispose() {//we use this method to avoid data leaks by this given controller. 
  // /There are different types of controllers, data may be leaked throught them, so we use dispose funtion. 
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      //The look of border after the app just starts(enabledBorder)
      borderSide: BorderSide(
        color: Colors.white,
        width: 2.0,
        // style: BorderStyle.none, //Removes the border around the TextField
        strokeAlign: BorderSide.strokeAlignInside,
      ),
      borderRadius: BorderRadius.circular(5),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text(
          //we can also add 'actions[]' here to display text or icons in the top right corner of the app
          'Currency Converter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          // padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'PKR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}', //here we have fixed the issue that if a larger number is given by used as input,
                //it will be rounded up to 2 decimal places. and if there is no computation done and the app is in the rest state than there must not be 0.00
                //instead it must be 0(we used the ternary operator)
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              TextField(
                controller: textEditingController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText:
                      'Please enter the amount in USD', //The text that appears where the input is to be taked and disappear automatically
                  hintStyle: TextStyle(color: Colors.black26),
                  prefixIcon: Icon(
                    Icons.monetization_on,
                  ), //suffixIcon is for icon on the right of screen
                  prefixIconColor: Colors.white60,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 105, 182, 219),
                  focusedBorder:
                      border, //the border code written in the function just below the BuildContext Line
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  //change the nature of keyboard, allowing only number to be displayed on the keyboard
                  decimal: true,
                ),
              ),
              const SizedBox(
                height: 10,
              ), //Note: We used Container before the sizedbox here, but container does not have a const constructor,
              // therefore it will be built unecessarily with each build, thus decreasing the efficiency of the, but SizedBox has a const contructor therefore we use it instead
              ElevatedButton(
                onPressed: () {
                  //we have three types of modes in out application: debug, release and profile

                  setState(() {
                    result = double.parse(textEditingController.text) * 280;
                  });
                },
                style: ButtonStyle(
                  //we can use .stylefrom property to avoid using WidgetStatePropertyAll repeatedly
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  elevation: WidgetStatePropertyAll(
                    7,
                  ), //add a shadow below the button
                  // textStyle: WidgetStatePropertyAll(TextStyle(color : Colors.white)),
                  minimumSize: WidgetStatePropertyAll(
                    Size(double.infinity, 50),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                child: Text('Convert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//build context tells us the location of a particular widget in the widget tree
// class CurrencyConverterMaterialPagee extends StatelessWidget {
//   const CurrencyConverterMaterialPagee({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController textEditingController = TextEditingController();
//     double result = 0;
//     final border = OutlineInputBorder(
//       //The look of border after the app just starts(enabledBorder)
//       borderSide: BorderSide(
//         color: Colors.white,
//         width: 2.0,
//         // style: BorderStyle.none, //Removes the border around the TextField
//         strokeAlign: BorderSide.strokeAlignInside,
//       ),
//       borderRadius: BorderRadius.circular(5),
//     );

//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey,
//         elevation: 0,
//         title: const Text(
//           //we can also add 'actions[]' here to display text or icons in the top right corner of the app
//           'Currency Converter',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               result.toString(),
//               style: TextStyle(
//                 fontSize: 35.0,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 255, 255, 255),
//               ),
//             ),
//             Container(
//               //we wrapped textfiled with padding to restrict it from occupying all the width, as it takes all the width
//               //we can use Padding instead of Container as well
//               //What is the difference between container and padding?
//               //Ans: Padding is just a single widget and container has many other small widgets in it(including the padding widget)
//               padding: const EdgeInsets.all(8),
//               child: TextField(
//                 controller: textEditingController,
//                 style: TextStyle(color: Colors.black),
//                 decoration: InputDecoration(
//                   hintText:
//                       'Please enter the amount in PKR', //The text that appears where the input is to be taked and disappear automatically
//                   hintStyle: TextStyle(color: Colors.black26),
//                   prefixIcon: Icon(
//                     Icons.monetization_on,
//                   ), //suffixIcon is for icon on the right of screen
//                   prefixIconColor: Colors.white60,
//                   filled: true,
//                   fillColor: const Color.fromARGB(255, 105, 182, 219),
//                   focusedBorder:
//                       border, //the border code written in the function just below the BuildContext Line
//                   enabledBorder: border,
//                 ),
//                 keyboardType: const TextInputType.numberWithOptions(
//                   //change the nature of keyboard, allowing only number to be displayed on the keyboard
//                   decimal: true,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   //we have three types of modes in out application: debug, release and profile
//                   result = double.parse(textEditingController.text) * 280;
//                 },
//                 style: ButtonStyle(
//                   //we can use .stylefrom property to avoid using WidgetStatePropertyAll repeatedly
//                   backgroundColor: WidgetStatePropertyAll(Colors.black),
//                   foregroundColor: WidgetStatePropertyAll(Colors.white),
//                   elevation: WidgetStatePropertyAll(
//                     7,
//                   ), //add a shadow below the button
//                   // textStyle: WidgetStatePropertyAll(TextStyle(color : Colors.white)),
//                   minimumSize: WidgetStatePropertyAll(
//                     Size(double.infinity, 50),
//                   ),
//                   shape: WidgetStatePropertyAll(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                   ),
//                 ),
//                 child: Text('Convert'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
