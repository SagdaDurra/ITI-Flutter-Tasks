//import 'package:flutter/material.dart';
//
//void main(){
//runApp(const MyApp());
//}
//// extends -----> inherits
//// MyApp class inherits from StatelessWidget (properities , methods)
//// in flutter , any widget must extend from specific widget
////  StatelessWidget ----->
//// type of widgets , that is stateless : only shows ui , dont change cause its data dont change
//// statefulwidget we use it to change the data like the counter
//class MyApp extends StatelessWidget{
//  // constructor that takes key (named parameter)
//  // const ---> decrease the rebulding of widgets and improve the performance
//  // the key is used to identify the widget in the widget tree so its like commit in git
//  // then send it to the parent class to make flutter more able to manage the widgets
//  const MyApp({super.key});
//  // another way to write it is :const MyApp({Key? key}) : super(key: key);
//  // super means the parent class
//
//  @override
//  // override ------> override the build method (polymorphism)
//  // the build method in parent we write it in our way in MyApp Class
//  // build method ----> return a widget and draw it on the screen
//  Widget build(BuildContext context) {
//    // title -----> title of the app it is written in the App Bar
//    // MaterialApp is constructor of MaterialApp class , we write it like that cause it
//    // will make instance of MaterialApp class(object) (call constructor = create object)
//    // so with MaterialApp Build method draw
//    // {the widget = object = call constructor called material app}
//    return MaterialApp(
//      // theme -----> it is resbonsible of the app look (named parameter) (object : themedata type)
//      // instead of making a theme to every widget we make a theme to the whole app
//      // ThemeData is a class that contains all the theme properties
//      title: "First App",
//      // here you call materialApp constructor then send to him object (ThemeData) then
//      // stored in the theme which is a parameter
//      theme: ThemeData(
//        // seedcolor -----> color of the app bar (the main colour that the app will come from)
//        // the thing that the build will put it in the widget tree is a widget
//
//        colorScheme: .fromSeed(seedColor: Colors.orange),
//      ), home: const MyHomePage(title: 'Flutter Demo Home Page'),
//
//    );
//  }
//
//}
//
//class MyHomePage extends StatefulWidget {
//  const MyHomePage({super.key, required this.title});
//  final String title;
//  @override
//  State<MyHomePage> createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    throw UnimplementedError();
//  }
//}
//
//@override
//  Widget build(BuildContext context, dynamic widget) {
//
//    var _counter;
//    VoidCallback? _incrementCounter;
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: Column(
//
//          mainAxisAlignment: .center,
//          children: [
//            const Text('You have pushed the button this many times:'),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headlineMedium,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: const Icon(Icons.add),
//      ),
//    );
//  }
//// boxShadow: boxShadow: [
//                 //     BoxShadow(
//                 //       color: Colors.grey.withOpacity(0.3),
//                 //       blurRadius: 10,
//                 //       spreadRadius: 2,
//                 //       offset: Offset(0, 5),
//                 //     ),
//                 //   ], i will use it later now we wrapping with material (elevation)
//                 // we cant make row or column on the container
//                 // ONLY ONE THING IN THE PADDING WRAPPING THE CONTAINER
//                 // when making row and column we should use alignment and write children to write the rest objects
//                 // Icon is in row and column (as children) not in box decoration , in container as a child
//                 // box decoration  in containers only
//color: Colors.deepPurple ---> we write color only one time
// border radius -----> is in the box decoration