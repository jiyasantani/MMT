import 'package:demo2/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Center(
        child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        width: MediaQuery.of(context).size.width * .8,
        child:  TextField(
          controller: emailController,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 25),
            border: InputBorder.none,
          ),
        ),
      ),
    ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: MediaQuery.of(context).size.width * .8,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: passwordController.text.isEmpty ? 'Password' : null,
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 25),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),

              child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.green
                  ),
                  //onPressed: () {
                    //FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
                  //},
                  //child: Text('Login')
                onPressed: () async {
                  try {
                    // Attempt to sign in
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim()
                    );

                    // If successful, navigate to the next page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()), // Replace with your screen
                    );
                  } catch (e) {
                    // Handle sign-in error
                    print(e);
                  }
                },
                child: Text('Login'),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

