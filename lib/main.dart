
// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferance/onboarding.dart';


SharedPreferences? prefs;

void main()async { 
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: prefs!.get("Skip") == true ?  const Homepage() : const OnBoardingPage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: const Text("Home Page",style: TextStyle(fontSize: 15),),
        centerTitle: true,
      ),
      body: const Center(child: Text("WELCOME",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
    );
  }
}