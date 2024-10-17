import 'package:eventregistration/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmationPage extends StatelessWidget {
  final Map<String, dynamic> formData;

  ConfirmationPage({required this.formData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation',style: TextStyle(color: Colors.blueGrey),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5), 
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Registration Successful!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Here are your details:',
                  style:GoogleFonts.lato( textStyle: TextStyle(fontSize: 18, color: Colors.black54),)
                ),
                SizedBox(height: 20),
                buildDetailRow('Name', formData['name']),
                buildDetailRow('Email', formData['email']),
                buildDetailRow('Phone', formData['phone']),
                buildDetailRow('Event Date', 
                    formData['event_date'].toLocal().toString().split(' ')[0]),
                buildDetailRow('Event Type', formData['event_type']),
                buildDetailRow('Comments', formData['comments']),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    
                    onPressed: () {
                       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EventListScreen())
                        ); 
                    },
                    child: Text('Back to Home',style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}