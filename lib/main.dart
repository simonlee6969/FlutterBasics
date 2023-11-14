import 'package:flutter/material.dart';
import 'second_page/second_page.dart';
void main() {
  runApp(MyApp());
}

//StatelessWidget means the screen would never change, all UI remain static
class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String buttonName = 'Click';
  int currentIndex = 0;

  //it's a variable, it would make the whole class non-const
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //homepage set as FirstPage()
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int currentIndex = 0;
  String buttonName = "Click";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Title'),
        backgroundColor: Colors.pinkAccent,
      ),
      //it creates a center widget
      body: Center(
          //if currentIndex == 0, then show container, : else
          child: currentIndex == 0
              ? Container(
                  //width is all the screen
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.red,
                  child: Row(
                    //Y axis when column, X axis when row
                    mainAxisAlignment: MainAxisAlignment.center,
                    //X axis when column, Y axis when row
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.orange,
                        ),
                        //onPresses could functions
                        onPressed: () {
                          //push a new page over this one, route to another page, build a route ad hoc using MaterialPageRoute
                          //it provides a back button automatically
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const SecondPage();
                          }));
                        },
                        child: const Text('Navigate to next page'),
                      ),
                      ElevatedButton(
                        //onPresses could functions
                        onPressed: () {
                          //let Flutter knows we are changing something/variables in a stateful widget
                          //() returns nothing, {actual function code}
                          setState(() {
                            buttonName = 'Clicked';
                          });
                          print('Print something');
                        },
                        child: Text(buttonName),
                      ),
                    ],
                  ),
                )
              //detect clicks on the image
              : Image.asset('images/icon.png')),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 24,
                semanticLabel: 'Test to announce in accessibility modes',
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings')
        ],
        //argument  = var
        //the arg currentindex of a BottomNavigationBar widget will determine which icon to be highlighted
        currentIndex: currentIndex,

        //(return value){actual function code}
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}


