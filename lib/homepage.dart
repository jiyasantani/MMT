
import 'package:demo2/category.dart';
import 'package:demo2/trip.dart';
import 'package:demo2/welcome.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'WhereToGo.dart';
import 'bottom_bar.dart';
import 'host.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}
  class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;


  // static List<Widget> _widgetOptions = <Widget>[
  //   HomePage(),
  //   const Text("Hello"),
  //   const Text("Where2Go"),
  //   const Text("Money"),
  //   const Text("Host"),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  //   print('Selected index: $_currentIndex');
  // }

  @override
  Widget build(BuildContext context) {

  final user = FirebaseAuth.instance.currentUser;

  return Scaffold(

  appBar: AppBar(

  //title: Text('HomePage'),

  leading: IconButton(
  icon: Icon(Icons.menu),
  onPressed: () {

  // Handle your logic here
  },

  ),

  //title: Text('my'),

  title: Image.asset(
  'assets/my2.png', // Replace with your logo URL
  fit: BoxFit.cover,
  width: 35,
  height: 35,
  ),

  actions: <Widget>[
  IconButton(
  icon: Icon(Icons.search),
  onPressed: () {
  // Handle your logic here
  },
  ),
  Text('myCash'),
  IconButton(
  icon: Icon(Icons.business),
  onPressed: () {
  // Handle your logic here
  },
  ),
  ],
  ),


  body:
  SafeArea(

  child: Column(

  children: <Widget>[



  SizedBox(height: 20),
  Text('Good Morning ${FirebaseAuth.instance.currentUser?.email?.split('@')[0]}', style: TextStyle(fontSize: 30),),
  Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[
  Card(
  child: Padding(
  padding: EdgeInsets.all(8.0),
  child: Column(
  children: <Widget>[
  Icon(Icons.flight, size: 50),
  Text('Flights'),
  ],
  ),
  ),
  ),
  Card(
  child: Padding(
  padding: EdgeInsets.all(8.0),
  child: Column(
  children: <Widget>[
  Icon(Icons.hotel, size: 50),
  Text('Hotels'),
  ],
  ),
  ),
  ),
  Card(
  child: Padding(
  padding: EdgeInsets.all(8.0),
  child: Column(
  children: <Widget>[
  Icon(Icons.beach_access, size: 50),
  Text('Holiday Packages'),
  ],
  ),
  ),
  ),
  Card(
  child: Padding(
  padding: EdgeInsets.all(8.0),
  child: Column(
  children: <Widget>[
  Icon(Icons.train, size: 50),
  Text('Trains/Bus'),
  ],
  ),
  ),
  ),
  ],
  ),
  SizedBox(height: 20),

  Stack(
  children: <Widget>[
  Container(
  padding: EdgeInsets.all(8.0),
  decoration: BoxDecoration(
  color: Colors.lightBlue[100],
  borderRadius: BorderRadius.circular(4.0),
  ),
  child: Column(
  children: <Widget>[
  Text('Use Code: WELCOMEMMT', style: TextStyle(fontSize: 14,color: Colors.grey[900], )),
  Text('FLAT 20% OFF* on 1st Hotel Booking', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
  Text('& Stay Better Pay Lesser.', style: TextStyle(fontSize: 14,color: Colors.grey[900],)),
  ],
  ),
  ),
  ],
  ),

  SizedBox(height: 20),
  Category(),

  Column(
  children: [


  ElevatedButton(
  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
  //onPressed: () {
  //FirebaseAuth.instance.signOut();
  //},
  //child: Text(
  //'LogOut',
  //),
  onPressed: () async {
  try {
  // Attempt to sign out
  await FirebaseAuth.instance.signOut();

  // If successful, navigate to the next page
  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => Welcome()), // Replace with your screen
  );
  } catch (e) {
  // Handle sign-out error
  print(e);
  }
  },
  child: Text('LogOut'),

  )
  ],
  ),
  ],
  ),

  ),

      bottomNavigationBar:
      ClipRRect(
  borderRadius: BorderRadius.only(
  topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
    ),
      child: BottomNavigationBar(
        backgroundColor: Colors.black,

        currentIndex: _currentIndex,
        onTap: (int index){
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => Trips()),);
              break;
            case 2:
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context) => WhereToGo()));
            case 4:
              Navigator.push(context, MaterialPageRoute(builder: (context) => Host()));
              
              
              
          }
          
        },
        elevation: 20,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.search),
            label: 'Trips',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.roundabout_left),
            label: 'Where2Go',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.monetization_on),
            label: 'Money',
          ), BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.backspace),
            label: 'Host',
          ),

        ],
        // onTap: (index) {
        //   setState(() {
        //     _currentIndex = index;
        //   });
        // },
      ),
      ),


  );




  // bottomNavigationBar: BottomNavigationBar(
  //   currentIndex: _currentIndexIndex,
  //   onTap: _onItemTapped,
  //   elevation: 10,
  //   showUnselectedLabels: true,
  //   type: BottomNavigationBarType.fixed,
  //   selectedItemColor: Colors.grey,
  //   unselectedItemColor: const Color(0xFF526480),
  //   items: const [
  //     BottomNavigationBarItem(
  //         icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
  //         activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
  //         label: "Home"),
  //     BottomNavigationBarItem(
  //         icon: Icon(FluentSystemIcons.ic_fluent_backspace_regular),
  //         activeIcon: Icon(FluentSystemIcons.ic_fluent_backspace_filled),
  //         label: "MyTrips"),
  //     BottomNavigationBarItem(
  //         icon: Icon(FluentSystemIcons.ic_fluent_backspace_regular),
  //         activeIcon: Icon(FluentSystemIcons.ic_fluent_backspace_filled),
  //         label: "Where2Go"),
  //     BottomNavigationBarItem(
  //         icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
  //         activeIcon: Icon(FluentSystemIcons.ic_fluent_backspace_filled),
  //         label: "TripMoney"),
  //     BottomNavigationBarItem(
  //         icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
  //         activeIcon: Icon(FluentSystemIcons.ic_fluent_backspace_filled),
  //         label: "BeAHost"),
  //   ],
  // ),
  }
  }





class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Text('First Page'),
      ),
    );
  }
}



class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Text('First Page'),
      ),
    );
  }
}

