import 'dart:convert';

import 'package:eventregistration/model/Eventmodel.dart';
import 'package:eventregistration/widget/eventwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class EventListScreen extends StatefulWidget {
  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  List<Event> events = [];
   int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  Future<void> loadEvents() async {
    final String response = await rootBundle.loadString('assets/events.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      events = data.map((event) => Event.fromJson(event)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, -3), 
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.blueGrey, 
            selectedItemColor: Colors.white, 
            unselectedItemColor: Colors.white70,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Book',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
  

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                  children: [
                  Container(
                    height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.8),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                
              child: Icon(
          Icons.dehaze,
          color: Colors.white, 
          size: 20, 
        ),
                  ),
                  Container(
                    height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.8),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                
        child: Icon(
          Icons.notifications,
          color: Colors.white, 
          size: 20, 
        ),
      
                  )
                ],
                ),
              
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                
                child:
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              
                  children: [
                    Text("Plan Your Best Event",style:GoogleFonts.lato( textStyle:    TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold)),),
                     Text("Explore Best Event Around you",style:GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),),
                  ],

                ),
              
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                        children: [
              
             TextField(
  decoration: InputDecoration(
    hintText: 'Search...',
    hintStyle: TextStyle(
      color: Colors.white.withOpacity(0.7), 
      fontStyle: FontStyle.italic,          
    ),
    prefixIcon: Icon(
      Icons.search,
      color: Colors.white,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide.none, 
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide.none, 
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: Colors.white,
        width: 2.0,
      ),
    ),
    filled: true, 
    fillColor: Colors.blueGrey.withOpacity(0.9), 
    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0), 
  ),
  style: TextStyle(color: Colors.white), 
),
                        ],
                ),
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Upcoming Events",style:GoogleFonts.lato( textStyle:  TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),)
            ),

            Expanded(
              child: events.isEmpty
                  ? Center(child: CircularProgressIndicator()) 
                  : ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        return EventWidget(event: events[index]); 
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}