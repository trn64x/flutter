import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/date.dart';
import 'package:flutter_application_1/pages/list.dart';
import 'package:flutter_application_1/pages/watch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Widget> _children = [
    Date(),
    Listed(),
    Watch(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.safety_check),label:"Osiemnastki"),
          BottomNavigationBarItem(icon: Icon(Icons.account_tree),label:"My Love to you"),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: "My Husband",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // No semicolon here
      ),
      drawer: Drawer(
        child: Padding(padding: EdgeInsets.all(50.0),child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Coś tutaj kiedyś dodam love ya",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          ],
        ) ),

      ),
      appBar: AppBar(
        title: Text("Hubby & Wifey Tracker",style:TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(199, 199, 199, 1),
      ),
    );
  }
}