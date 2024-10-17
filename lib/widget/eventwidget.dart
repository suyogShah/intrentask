import 'dart:convert';
import 'package:eventregistration/model/Eventmodel.dart';
import 'package:eventregistration/presentation/resgistrationform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 

class EventWidget extends StatelessWidget {
  final Event event; 

  const EventWidget({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(16.0), 
      child: Stack(
        children: [
          
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              image: DecorationImage(
                image: NetworkImage(event.imageurl),
                fit: BoxFit.cover, 
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            height: screenHeight * 0.45,  
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: screenHeight * 0.2,  
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              event.title,
                              style: TextStyle(
                                fontSize: screenWidth * 0.05,  
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            event.description, 
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,  
                              color: Colors.grey[700],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationForm()),
    );
    print("Seat reserved for ${event.title}");
  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    elevation: 5, 
  ),
  child: Ink(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blueAccent, Colors.cyan], 
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(30.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2), 
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.015,
        horizontal: screenWidth * 0.1,
      ),
      alignment: Alignment.center, 
      child: Text(
        'Book a Seat',
        style: TextStyle(
          fontSize: screenWidth * 0.045, 
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  ),
),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.03,
            left: screenWidth * 0.05,
            child: Container(
              height: screenWidth * 0.16,  
              width: screenWidth * 0.16,  
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      event.date.split(' ')[0], 
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,  
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      event.date.split(' ')[1], 
                      style: TextStyle(
                        fontSize: screenWidth * 0.05, 
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
