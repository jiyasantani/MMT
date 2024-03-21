import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  List<String> texts = [
    'Insurance',
    'Forex Card',
    'PNR Status',
    'Text4',
    'Text5',
    'Text10',
    'Text7',
    'Text8'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 200),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            children: List.generate(8, (index) {
              return Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 50.0, // specify the width
                      height: 55.0, // specify the height
                      child: Image.asset('assets/logo$index.png',
                          fit: BoxFit.cover),
                    ),
                    Text(texts[index]),
                  ],
                ),
                // replace with your logo URLs
              );
            }),
          ),
        ),
      ),
      padding: const EdgeInsets.all(20.0),
    );
  }
}
