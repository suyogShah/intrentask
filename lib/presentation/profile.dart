import 'dart:io';
import 'package:eventregistration/presentation/resgistrationform.dart';
import 'package:eventregistration/presentation/update.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                SizedBox(
                  width: screenWidth * 0.35, 
                  height: screenWidth * 0.35, 
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/arjit.png', 
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                ),
                
                SizedBox(height: 20),
                Text(
                  "Suyog Shah",
                  style: TextStyle(
                    fontSize: screenWidth * 0.06, 
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Suyogshah@gmail.com",
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdatePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: screenWidth * 0.25, 
                    ),
                  ),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045, 
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 50), 
                ElevatedButton.icon(
                  onPressed: () {
                    
                    print('User logged out');
                  },
                  icon: Icon(Icons.logout, size: screenWidth * 0.06),
                  label: Text(
                    'Logout',
                    style: TextStyle(fontSize: screenWidth * 0.045),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: screenWidth * 0.25, 
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
            
          ),

        ),

      ),
    );
  }
}
