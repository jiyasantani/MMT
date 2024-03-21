import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Host extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Center(
        child: Text('Host Page'),
      ),
    );
  }
}
