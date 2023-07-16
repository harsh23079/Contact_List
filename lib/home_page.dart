import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 213, 114, 235),
        centerTitle: true,
        title: const Text(
          'Samparak Suchi',
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Contact Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Contact Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 120.0,
                height: 50, // Set the width for the Save button
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Add save button logic
                  },
                  child: Text('Save', style: TextStyle(fontSize: 18)),
                ),
              ),
              SizedBox(width: 16.0),
              Container(
                width: 120.0,
                height: 50, // Set the width for the Update button
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Add update button logic
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ]),
          )
        ],
      )),
    );
  }
}
