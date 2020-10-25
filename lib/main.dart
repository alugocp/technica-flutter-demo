import 'package:flutter/material.dart';

// Starts the app
void main(){
  runApp(MyApp());
}

// Root app widget
class MyApp extends StatefulWidget{
  @override
  MyAppState createState() => MyAppState(); // All stateful widgets need this kind of function
}
class MyAppState extends State<MyApp>{
  int page=0; // This variable controls what page widget gets shown

  void changeScreen(){
    setState((){ // Remember to use setState or it won't update visually!
      page=1;
    });
  }

  @override
  Widget build(BuildContext context){

    // Use the home state to determine which page widget to use
    Widget home=MyHomePage(this);
    if(page==1){
      home=Page2();
    }

    // Returns a widget for the app itself
    return MaterialApp(home:home);
  }
}

// Second page (very basic)
class Page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child:Text("Hello there")
      )
    );
  }
}

// First page (main page)
class MyHomePage extends StatefulWidget{
  MyAppState app; // We store a reference to the app's state for use in _MyHomePageState

  MyHomePage(MyAppState app){
    this.app=app;
  }

  @override
  _MyHomePageState createState() => _MyHomePageState(); // All stateful widgets need this kind of function
}

class _MyHomePageState extends State<MyHomePage>{
  int _counter=0;

  void _incrementCounter(){
    setState((){
      widget.app.changeScreen(); // Uses this state's widget's app variable to call MyApp's changeScreen function
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:<Widget>[
            Text(
              "You have pushed the button this many times:",
            ),
            Text(
              '$_counter', // Just puts the value of the variable _counter into a string
              style:TextStyle(color:Color(0xffff0000),fontSize:30), // Text styling is also its own widget
            ),
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed:_incrementCounter, // Calls the function that changes the screen
        tooltip:'Increment',
        child:Icon(Icons.add),
      ),
    );
  }
}
