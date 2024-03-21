import 'package:demo2/login.dart';
import 'package:demo2/signup.dart';
import 'package:flutter/material.dart';


class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('LOGIN'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               // replace with your logo url
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                padding: EdgeInsets.all(10),
                height: 100, // Adjust the height as needed
                child: Center(
                  child: Image.asset("assets/mmt.png"),
                ),
              ),
              //Image.asset("assets/mmt.png"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Rs. 500 in Your Wallet – Waiting To Be Grabbed! Just Login To Claim!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold, // Makes the text bolder
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle login with Facebook
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  child: Text('Login with Facebook',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle login with Google
                  },

                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,

                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  child: Text('Login with Google',
                      style: TextStyle(color: Colors.white)
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjusts the spacing between the buttons
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle sign up
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()), // Replace with your screen
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text('SIGNUP', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle login
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()), // Replace with your screen
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),

                        child: Text('LOGIN', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
