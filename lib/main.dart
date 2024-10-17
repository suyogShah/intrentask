import 'package:eventregistration/presentation/home.dart';
import 'package:eventregistration/presentation/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white, 
          brightness: Brightness.light,
          primary: Colors.black, 
          secondary: Colors.grey, 
        ),
        scaffoldBackgroundColor: Colors.white, 
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blueAccent), 
          titleTextStyle: TextStyle(
            color: Colors.blueAccent, 
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: TextTheme(
        
        ),
        useMaterial3: true, 
      ),
      
      home:EventListScreen(),
    );
  }
}



