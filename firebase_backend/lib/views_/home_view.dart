import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Text(
          'Welcome to the Home View!',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for the button
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Floating Action Button Pressed')),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}