import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});


  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final List<String> places = ['Mumbai', 'Pune', 'Delhi', 'Nashik', 'Akola', 'Wadala',
    'Chembur', 'Vashi', 'Dheradhun', 'Gujrat', 'Rajasthan', 'Chinchpokli'];
  String selectedPlace = '';
  int dropdownValue = 1;
  int selectedRooms = 0;
  int selectedAdults = 0;
  int selectedChildren = 0;
  DateTimeRange dateRange = DateTimeRange(start: DateTime(2024, 11, 5), end: DateTime(2024, 12, 24));

  CollectionReference bookings = FirebaseFirestore.instance.collection('bookings');
  Future<void> addBooking(String startDate, String endDate, String city, int rooms, int adults, int children) {
    return bookings
        .add({
      'startDate': dateRange.start.toIso8601String(), // Convert DateTime to String
      'endDate': dateRange.end.toIso8601String(),
      'city': selectedPlace,
      'rooms': selectedRooms,
      'adults': selectedAdults,
      'children': selectedChildren
    })
        .then((value) => print("Booking Added"))
        .catchError((error) => print("Failed to add booking: $error"));
  }
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Booking Details',
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: ElevatedButton(
                      child: Text('${start.year}/${start.month}/${start.day}'),
                      onPressed: () { pickDateRange(); },
                    ),
                ),
                const SizedBox(width: 12),
                Expanded(
                    child: ElevatedButton(
                      child: Text('${end.year}/${end.month}/${end.day}'),
                      onPressed: () { pickDateRange(); },

                    ),
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: <Widget>[
                GestureDetector(
                    onTap: () async{
                      final String? place = await showSearch(context: context, delegate: PlaceSearch(places));
                      if (place != null && place.isNotEmpty) {
                      setState(() {
                        selectedPlace = place;
                      });
                      }

                    },
                    child: Container(
                      height: 50,
                      width: 370,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            if (selectedPlace.isEmpty) // Only show the icon if no place is selected
                              Icon(Icons.search, color: Colors.grey),
                            if (selectedPlace.isEmpty) // Add space only if icon is present
                              SizedBox(width: 10),

                           Text(

                              selectedPlace.isEmpty ? 'Search' : selectedPlace,
                              style: TextStyle(color: Colors.black, fontSize: 18),
                            ),


                      ]
                      ),
                    )
                ),


              ]
            ),
            //SizedBox(height: 10),


            ElevatedButton(
              child: Text('Family Details'),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 2, // Set the height to half of the screen height
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Select Rooms and Guests', style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),

                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: IconButton(
                                      icon: Icon(Icons.close),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0), // Add vertical padding
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space out the elements
                                children: [
                                  Expanded(child: Text('Rooms', style: TextStyle(fontSize: 18))), // Increase text size
                                  DropdownButton<int>(
                                    value: selectedRooms,
                                    items: List<int>.generate(6, (i) => i).map((int value) {
                                      return DropdownMenuItem<int>(
                                        value: value,
                                        child: Text('$value', style: TextStyle(fontSize: 18)), // Increase text size
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedRooms = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0), // Add vertical padding
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space out the elements
                                children: [
                                  Expanded(child: Text('Adults', style: TextStyle(fontSize: 18))), // Increase text size
                                  DropdownButton<int>(
                                    value: selectedAdults,
                                    items: List<int>.generate(6, (i) => i).map((int value) {
                                      return DropdownMenuItem<int>(
                                        value: value,
                                        child: Text('$value', style: TextStyle(fontSize: 18)), // Increase text size
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedAdults = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0), // Add vertical padding
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space out the elements
                                children: [
                                  Expanded(child: Text('Children', style: TextStyle(fontSize: 18))), // Increase text size
                                  DropdownButton<int>(
                                    value: selectedChildren,
                                    items: List<int>.generate(6, (i) => i).map((int value) {
                                      return DropdownMenuItem<int>(
                                        value: value,
                                        child: Text('$value', style: TextStyle(fontSize: 18)), // Increase text size
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedChildren = value!;
                                      });

                                    },

                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  backgroundColor: Colors.white, // This makes the background semi-transparent
                );
              },
            ),

            Text('Rooms: $selectedRooms'),
            Text('Adults: $selectedAdults'),
            Text('Children: $selectedChildren'),



            ElevatedButton(
              child: Text('Book'),
              onPressed: () async {
                await addBooking(dateRange.start.toIso8601String(), dateRange.end.toIso8601String(), selectedPlace, selectedRooms, selectedAdults, selectedChildren);
                _showSuccessDialog(context);
              },
            ),

          ],



      ),


      ),

    );
  }

  Future pickDateRange() async {
    final DateTimeRange? pickedDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(1999),
      lastDate: DateTime(2100),
      initialDateRange: dateRange,
    );
    if (pickedDateRange != null && pickedDateRange != dateRange) {
      setState(() {
        dateRange = pickedDateRange;
      });
    }
  }
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Successful'),
          content: Text('Your booking has been confirmed.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  }


